#region ;**** ���������� ACNWrapper_GUI ****
#PRE_icon=SVN�ύ.exe|-1
#PRE_Outfile=SVN�ύ.exe
#PRE_Compression=4
#PRE_Res_Description=SVN�Զ��ύ����
#PRE_Res_Fileversion=1.0.0.19
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
	
	Au3 �汾:
	�ű�����:
	�����ʼ�:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

#include <Process.au3>
Opt("WinTitleMatchMode", 2)
Opt("SendKeyDelay", 50)
AdlibRegister("_Quit", 1000 * 60) ;This is only for testing, so if anything go wrong, the script will exit after 1 seconds.
Global $path = IniRead("SVN-Config.ini", "SVN��Ϣ", "��ַ", "error")
Global $goagent = IniRead("SVN-Config.ini", "SVN��Ϣ", "�򿪴���", "No")
Global $flag = IniRead(@TempDir & "\SVN-Config.ini", "SVN��Ϣ", "����״̬", "Unkown")
If $goagent = "Unkown" Or $goagent <> $flag Then daili() ;���ini������ʹ�ô�������Ҵ򿪴���
commit()

Func daili()
	Local $SVNpath = @ProgramFilesDir & "\TortoiseSVN\bin\TortoiseProc.exe"
	Local $sCommand = "TortoiseProc.exe /command:settings /path:" & $SVNpath & " /closeonend:2"
	Run(@ComSpec & " /c " & $sCommand, "", @SW_HIDE)
	WinWait(" - TortoiseSVN")
	WinActivate(" - TortoiseSVN")
	Sleep(500)
	While Not WinExists(" - TortoiseSVN", "�������������")
		Send("^{TAB}")
		Sleep(100)
	WEnd
;~ 	Local $WinPosArray = WinGetPos(" - TortoiseSVN")
;~ 	Local $TNewCheckListBoxArray = ControlGetPos(" - TortoiseSVN", "", 32494)
;~ 	Local $Width = $WinPosArray[0] + $TNewCheckListBoxArray[0]
;~ 	Local $Height = $WinPosArray[1] + $TNewCheckListBoxArray[1]
;~ 	MouseClick("left", $Width + 50, $Height + 170)
;~ 	Send("^{TAB 8}")
;~ 	Sleep(500)
	If $goagent = "Yes" Then
		ControlCommand(" - TortoiseSVN", "", "[CLASS:Button; INSTANCE:1]", "Check", "")
		IniWrite(@TempDir & "\SVN-Config.ini", "SVN��Ϣ", "����״̬", "Yes")
	ElseIf $goagent = "No" Then
		ControlCommand(" - TortoiseSVN", "", "[CLASS:Button; INSTANCE:1]", "unCheck", "")
		IniWrite(@TempDir & "\SVN-Config.ini", "SVN��Ϣ", "����״̬", "No")
	Else
		TrayTip("���棡", "�򿪴�����ѡ��Yes����No��������ֵ������ֵ��Ч��", 3000)
		Sleep(3000)
	EndIf
	ControlClick(" - TortoiseSVN", "", 1)
EndFunc   ;==>daili

Func commit()
	Local $sCommand = "TortoiseProc.exe /command:commit /path:" & $path & " /closeonend:3"
	Run(@ComSpec & " /c " & $sCommand, "", @SW_HIDE)
	WinWait($path)
	WinActivate($path)
	ControlClick($path,"",1505)
 	Send("!a")
	If ControlCommand($path, "", 1, "IsEnabled", "") Then
		ControlClick($path, "", 1)
	Else
		WinClose($path)
	EndIf
EndFunc   ;==>commit

Func update()
	If IniRead("SVN-Config.ini", "SVN����", "���ļ���", "error") = "Yes" Then ShellExecute($path, "", "", "", @SW_MAXIMIZE) ;�����Ҫ��SVN�ļ��У������һ�У�
	Local $sCommand = "TortoiseProc.exe /command:update /path:" & $path & " /closeonend:2"
	_RunDOS($sCommand)
EndFunc   ;==>update

Func _Quit()
	TrayTip("��ʾ", "�����Ѿ�����1�����ˣ������Զ��˳���", 3000)
	Sleep(3000)
	Exit
EndFunc   ;==>_Quit