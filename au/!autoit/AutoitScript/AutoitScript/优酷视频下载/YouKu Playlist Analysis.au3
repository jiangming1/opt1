#region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\ICO\5.ico
#PRE_Outfile=YouKu Playlist Analysis.exe
#PRE_Compression=4
#PRE_Res_Comment=�ſ�ר����������
#PRE_Res_Description=�ſ�ר����������
#PRE_Res_Fileversion=0.0.0.48
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_requestedExecutionLevel=None
#endregion ;**** ���������� ACNWrapper_GUI ****
#region ACNԤ����������(���ò���)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#endregion ACNԤ����������(���ò���)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	Au3 �汾:http://v.youku.com/v_show/id_XMTE4MDY1MTgw.html?f=3744460
	�ű�����:http://v.youku.com/v_show/id_XMTE4MDY3Mzky.html?f=3744460
	�����ʼ�:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#include <IE.au3>
#include <Array.au3>
TraySetState(2)   ;hide the tray ico
Local $PlalistAdress=ClipGet()
Local $arraytxt = @TempDir & "\YouKu Playlist Analysis.txt" ;The file dir
Local $alllinks[100] ;ԭʼ����������
Local $oIE = _IECreate($PlalistAdress, 0, 0)
Local $oLinks = _IELinkGetCollection($oIE)
Local $flag = 1
While @error Or @extended = 0
	SetError(0)
	Local $oLinks = _IELinkGetCollection($oIE)
	Sleep(500)
WEnd
Local $i = 0
For $oLink In $oLinks
	If StringInStr($oLink.href, "http://v.youku.com/v_show/") = 1 Then
		$alllinks[$i] = $oLink.href
		$i = $i + 1
	EndIf
Next

$links = _ArrayUnique($alllinks) ;���ջ�õ����顣
;~ _ArrayDelete($links,100)   ;�������������һ�����ַ���������һ�п��п���,��Ϊ�����Ǵ��ڵģ�
$i = 0
While $i < $links[0]
	FileWriteLine($arraytxt, $links[$i]) ;һ��һ��д��
	$i = $i + 1
WEnd
_IEQuit($oIE) ;�˳������
