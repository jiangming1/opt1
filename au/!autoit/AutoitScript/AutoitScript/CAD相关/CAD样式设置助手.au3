#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\ICO\��Լϵͳ����ͼ������24.ico
#PRE_Outfile=CAD��ʽ��������.exe
#PRE_Compression=4
#PRE_Res_Description=CAD���弰��ע��ʽ��׼��
#PRE_Res_Fileversion=0.0.0.10
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=chen
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
HotKeySet("{ESC}", "tuichu")
Func tuichu()
	Exit
EndFunc   ;==>tuichu

If Not ProcessExists("acad.exe") Then Exit
Local $iniread = IniRead(@TempDir & "\CAD��ʽ��������.ini", "����", "˳��", 0)
WinActivate("AutoCAD 2011")
MouseMove(0, 0)
ControlSend("AutoCAD 2011", "", 2, "style{enter}")
WinWait("������ʽ")
ControlClick("������ʽ", "", "[CLASS:Button; INSTANCE:12]")
WinWait("�½�������ʽ")
ControlSetText("�½�������ʽ", "", "[CLASS:Edit; INSTANCE:1]", "__romans" & Random(10, 50, 1))
ControlClick("�½�������ʽ", "", "[CLASS:Button; INSTANCE:1]")
Sleep(200)
WinWaitClose("�½�������ʽ")
If $iniread = 0 Then
	romans()
Else
	ControlCommand("������ʽ", "", "[CLASS:ComboBox; INSTANCE:2]", "SetCurrentSelection", $iniread)
EndIf
ControlCommand("������ʽ", "", "[CLASS:Button; INSTANCE:3]", "UnCheck", "")
ControlSetText("������ʽ", "", "[CLASS:Edit; INSTANCE:1]", "0")
ControlSetText("������ʽ", "", "[CLASS:Edit; INSTANCE:2]", "0.66")
ControlClick("������ʽ", "", "[CLASS:Button; INSTANCE:14]")
WinClose("������ʽ")


WinActivate("AutoCAD 2011")
ControlSend("AutoCAD 2011", "", 2, "dimstyle{enter}")
WinWait("��ע��ʽ������")
ControlClick("��ע��ʽ������", "", "[CLASS:Button; INSTANCE:4]")
WinWait("�����±�ע��ʽ")
ControlSetText("�����±�ע��ʽ", "", "[CLASS:Edit; INSTANCE:1]", "__romans_style" & Random(10, 50, 1))
ControlClick("�����±�ע��ʽ", "", "[CLASS:Button; INSTANCE:2]")

;~ �������ò������

WinWait("�½���ע��ʽ:")
If Not WinActivate("�½���ע��ʽ:", "") Then WinActivate("�½���ע��ʽ:", "")
WinWaitActive("�½���ע��ʽ:", "")
$WinPosArray = WinGetPos("�½���ע��ʽ:")
$WinPosArray = WinGetPos("�½���ע��ʽ:")
$TNewCheckListBoxArray = ControlGetPos("�½���ע��ʽ:", "", "[CLASS:SysTabControl32; INSTANCE:1]")
$Width = $WinPosArray[0] + $TNewCheckListBoxArray[0]
$Height = $WinPosArray[1] + $TNewCheckListBoxArray[1]

;~ �� ѡ�
MouseClick("left", $Width + 20, $Height + 40)

MouseClick("left", $Width + 180, $Height + 80)
MouseClick("left", $Width + 180, $Height + 100)
MouseClick("left", $Width + 180, $Height + 330)
MouseClick("left", $Width + 180, $Height + 350) ;�ߵ���ɫ

MouseClick("left", $Width + 480, $Height + 330)
Send("^a")
Send("1.5")
MouseClick("left", $Width + 480, $Height + 360)
Send("^a")
Send("0")

;~ ���źͼ�ͷ ѡ�
MouseClick("left", $Width + 80, $Height + 40)
MouseClick("left", $Width + 60, $Height + 225)
Send("^a")
Send("3.5")

;~ ���� ѡ�
MouseClick("left", $Width + 150, $Height + 40)
MouseClick("left", $Width + 170, $Height + 85) ;ѡ��������ʽ
MouseWheel("up", 20)
MouseClick("left", $Width + 170, $Height + 100)

MouseClick("left", $Width + 170, $Height + 120)
MouseClick("left", $Width + 170, $Height + 140) ;ѡ��������ɫ

MouseClick("left", $Width + 240, $Height + 175)
Send("^a")
Send("3.5") ;ѡ������߶�
MouseClick("left", $Width + 200, $Height + 285)
MouseClick("left", $Width + 200, $Height + 310)
MouseClick("left", $Width + 200, $Height + 315)
MouseClick("left", $Width + 200, $Height + 325)
MouseClick("left", $Width + 240, $Height + 375)
Send("^a")
Send("1")
MouseClick("left", $Width + 340, $Height + 340)

;~ ���� ѡ�
MouseClick("left", $Width + 195, $Height + 40)
MouseClick("left", $Width + 70, $Height + 140)
MouseClick("left", $Width + 350, $Height + 365)
MouseClick("left", $Width + 490, $Height + 365)
Send("^a")
Send("1")

SetError(0)
PixelSearch($Width + 305, $Height + 410, $Width + 325, $Height + 430, 0x4B6097, 50)
If Not @error Then
	MouseClick("left", $Width + 350, $Height + 415)
	SetError(0)
EndIf ;��������֮����Ƴߴ����ж�

SetError(0)
PixelSearch($Width + 305, $Height + 430, $Width + 325, $Height + 450, 0x4B6097, 50)
If @error Then
	MouseClick("left", $Width + 350, $Height + 435)
	SetError(0)
EndIf ;��������֮����Ƴߴ����ж�

;~ ����λ ѡ�
MouseClick("left", $Width + 250, $Height + 40)
MouseClick("left", $Width + 200, $Height + 105)
MouseClick("left", $Width + 200, $Height + 145)
MouseClick("left", $Width + 220, $Height + 275)
Send("^a")
Send("1")

SetError(0)
PixelSearch($Width + 175, $Height + 320, $Width + 200, $Height + 340, 0x4B6097, 50)
If @error Then
	MouseClick("left", $Width + 190, $Height + 335)
	SetError(0)
EndIf ;���� �ж�

;~ ���� ѡ�
MouseClick("left", $Width + 350, $Height + 40)
MouseClick("left", $Width + 200, $Height + 80)
MouseClick("left", $Width + 200, $Height + 100)

ControlClick("�½���ע��ʽ:", "", 1)
WinWaitClose("�½���ע��ʽ:")
ControlClick("��ע��ʽ������", "", 1)

Func romans()
	$WinPosArray = WinGetPos("������ʽ")
	$TNewCheckListBoxArray = ControlGetPos("������ʽ", "", "[CLASS:Button; INSTANCE:1]")
	$Width = $WinPosArray[0] + $TNewCheckListBoxArray[0]
	$Height = $WinPosArray[1] + $TNewCheckListBoxArray[1]
;~ 	MouseMove($Width + 20, $Height + 30)
;~ 	MouseMove($Width + $TNewCheckListBoxArray[2] - 10, $Height + $TNewCheckListBoxArray[3])
;~ 	$s = ControlCommand("������ʽ", "", "[CLASS:ComboBox; INSTANCE:2]", "GetCurrentSelection", "")
;~ 			Sleep(500)
;~ 	$color = PixelChecksum($Width + 20, $Height + 30, $Width + $TNewCheckListBoxArray[2] - 10, $Height + $TNewCheckListBoxArray[3])
;~ 	MsgBox(0,"",$color)
	
	Local $i
	For $i = 1 To 1000
		ControlCommand("������ʽ", "", "[CLASS:ComboBox; INSTANCE:2]", "SetCurrentSelection", $i)
		$s = ControlCommand("������ʽ", "", "[CLASS:ComboBox; INSTANCE:2]", "GetCurrentSelection", "")
		Sleep(100)
		$color = PixelChecksum($Width + 20, $Height + 30, $Width + $TNewCheckListBoxArray[2] - 10, $Height + $TNewCheckListBoxArray[3])
		If $color = 1358578069 Then
			IniWrite(@TempDir & "\CAD��ʽ��������.ini", "����", "˳��", $i)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>romans