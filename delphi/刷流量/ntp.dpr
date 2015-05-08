unit Unit2;
 
interface
 
uses Windows, Winsock;
 
type
  NTPPACKET = record
    li, vn, mode, stratum: Byte;
    root_delay, root_dispersion: LongInt;
    ref_id: array[0..3] of Byte;
    reftimestamphigh, reftimestamplow, oritimestamphigh,
      oritimestamplow, recvtimestamphigh, recvtimestamplow,
      trantimestamphigh, trantimestamplow: LongInt;
  end;
  //����ת�����������ֽ�˳��;
  lr = packed record
    l1, l2, l3, l4: byte;
  end;
 
const
  maxint2 = 4294967296.0;
 
function getntptime: TDateTime;
 
implementation
 
function flip(var n: longint): longint; //�����ֽ�˳���뱾���ֽ�˳��ת��;
var
  n1, n2: lr;
begin
  n1 := lr(n);
  n2.l1 := n1.l4;
  n2.l2 := n1.l3;
  n2.l3 := n1.l2;
  n2.l4 := n1.l1;
  flip := longint(n2);
end;
 
function tzbias: double; // ��ȡ����ʱ������UTCʱ��ƫ��;
var
  tz: TTimeZoneInformation;
begin
  GetTimeZoneInformation(tz);
  result := tz.Bias / 1440;
end;
 
function ntp2dt(nsec, nfrac: longint): TDatetime; //��NTP ʱ���(timestamp)��ʽת����ΪDELPHI�� TDateTime ��ʽ;
var
  d, d1: double;
begin
  d := nsec;
  if d < 0 then d := maxint2 + d - 1;
  d1 := nfrac;
  if d1 < 0 then d1 := maxint2 + d1 - 1;
  d1 := d1 / maxint2;
  d1 := trunc(d1 * 1000) / 1000;
  result := (d + d1) / 86400;
  result := result - tzbias + 2;
end;
 
function getntptime: TDateTime; //������
var
  WSAData: TWSAData;
  skt: TSocket;
  addr: TSockAddrIn;
  n: integer;
  ntppack: NTPPACKET;
begin
  Result := 0;
  WSAStartup($0101, WSAData);
  skt := Socket(PF_INET, SOCK_DGRAM, IPPROTO_IP); //ע��
  if skt = INVALID_SOCKET then
  begin
    Exit;
  end;
  ntppack.li := $1B;    //������1B,NTPЭ�����
  ntppack.vn := 0;
  ntppack.mode := 0;
  ntppack.stratum := 0;
  addr.sin_family := PF_INET; //ע��
  addr.sin_port := htons(123);
  addr.sin_addr.S_addr := inet_addr(inet_ntoa(Pinaddr(gethostbyname('ntp.sjtu.edu.cn')^.h_addr_list^)^));
  if sendto(skt, ntppack, SizeOf(ntppack), 0, addr, SizeOf(addr)) = -1 then
  begin
    closesocket(skt);
    WSACleanup;
  end;
  n := SizeOf(addr);
  if Recvfrom(skt, ntppack, SizeOf(ntppack), 0, addr, n) > 0 then
  begin
    result := ntp2dt(flip(ntppack.trantimestamphigh), flip(ntppack.trantimestamplow)); //���յ������ݱ�ʱ���ʽת��Ϊ����ʱ��;
  end;
  closesocket(skt);
  WSACleanup;
end;
end.
