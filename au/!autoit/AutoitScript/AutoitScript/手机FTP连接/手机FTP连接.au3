#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\ICO\��Լϵͳ����ͼ������26.ico
#PRE_Outfile=�ֻ�FTP����.exe
#PRE_Compression=4
#PRE_Res_Description=��WIFIԶ�̹�����ֻ�FTPվ��
#PRE_Res_Fileversion=0.0.0.15
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=zaoki
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
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
	
	Au3 �汾:
	�ű�����:
	�����ʼ�:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#include <FTPEx.au3>
#include <Process.au3>
;~ #Include <Array.au3>
HotKeySet("{ESC}", "tuichu")
Local $i, $Conn, $Open, $iniread ,$memory
Global $fa,$start,$end
$Open = _FTP_Open('�ֻ�FTP����')
$iniread = IniRead(@ScriptDir & "\config.ini", "����FTP", "��ַ", "ftp://192.188.29.0:2121")
$start=IniRead(@ScriptDir & "\config.ini", "����FTP", "��ʼ�Ŷ�", 0)
$end=IniRead(@ScriptDir & "\config.ini", "����FTP", "�����Ŷ�", 256)
Local $array = StringSplit($iniread, ".")
$fa = $array[1] & "." & $array[2] & "." & $array[3] & "."
$memory=StringReplace($array[1],"ftp://","") & "." & $array[2] & "." & $array[3] & "." & StringReplace($array[4],":2121","")
;~ MsgBox(0,"",$memory)
Local $Conn = _FTP_Connect($Open, $memory, "", "", 0, "2121")
If @error <> 0 Then
	SetError(0)
	all()
Else
	_RunDOS("explorer " & $iniread)
EndIf

Func all()
	For $i = $start To $end
		Local $Conn = _FTP_Connect($Open, StringReplace($fa,"ftp://","") & $i, "", "", 0, "2121")
		If @error <> 0 Then
			SetError(0)
			TrayTip("���ӣ�ID��" & $i & "����ʱ","���ڳ�������  " & $fa & $i+1 & ":2121", 5)
		Else			
			IniWrite(@ScriptDir & "\config.ini", "����FTP", "��ַ", $fa & $i & ":2121")
			IniWrite(@ScriptDir & "\config.ini", "����FTP", "��ʼ�Ŷ�", $start)
			IniWrite(@ScriptDir & "\config.ini", "����FTP", "�����Ŷ�", $end)
			_RunDOS("explorer " & $fa & $i & ":2121")
			Exit
		EndIf
	Next
	TrayTip("��ʾ", "�Ҳ����������ӵ��ƶ��豸��", 5)
	Sleep(5000)
	Exit
EndFunc   ;==>all

Func tuichu()
	Exit
EndFunc   ;==>tuichu