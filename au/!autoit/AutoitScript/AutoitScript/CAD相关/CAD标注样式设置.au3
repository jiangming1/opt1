#region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\ICO\pencil64.ico
#PRE_Outfile=CAD��ע��ʽ����.exe
#PRE_Compression=4
#PRE_UseX64=n
#PRE_Res_Description=CAD���弰��ע��ʽ��׼��
#PRE_Res_Fileversion=0.0.0.18
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=chen
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
HotKeySet("{ESC}", "tuichu")
Func tuichu()
	Exit
EndFunc   ;==>tuichu

If Not ProcessExists("acad.exe") Then
	TrayTip("���棡", "û�м�⵽�����е�AutoCAD�������ԣ�", 3000)
	Sleep(3000)
	Exit
EndIf

Global $flag = MsgBox(262144 + 64 + 3, "��ѡ��", "ѡ���ǣ�����ӷ������ע��ʽ��" & @CRLF & "ѡ��񣬽����Romans��ע��ʽ��") ;��Ϊ6���Ƿ�����,��Ϊ7Ϊromans;
Global $name,$number,$scale

If $flag = 6 Then
	TrayTip("��ʾ��", "��ѡ���˷����壡", 3000)
	$name="__" & "FangSong-GB2312-" & Random(10, 100, 1)
	$number=426
ElseIf $flag = 7 Then
	TrayTip("��ʾ��", "��ѡ����Romans��", 3000)
	$name="__" & "Romans-" & Random(10, 100, 1)
	$number=315
Else
	TrayTip("���棡", "��û��ѡ�񣬳��򼴽��˳���", 3000)
	Sleep(3000)
	Exit
EndIf
$scale=InputBox("��ʾ","�������ע����ȫ�ֱ���","1")

MouseMove(0, 0)
wenziyangshi()
biaozhuyangshi()

Func wenziyangshi()
	WinActivate("AutoCAD 2011")
	ControlSend("AutoCAD 2011", "", 2, "style{enter}")
	WinWait("������ʽ")
	ControlClick("������ʽ", "", "[CLASS:Button; INSTANCE:12]")
	Sleep(200)
	If WinExists("AutoCAD", "��ǰ��ʽ�ѱ��޸�") Then ControlClick("AutoCAD", "��ǰ��ʽ�ѱ��޸�", "[CLASS:Button; INSTANCE:2]")
	WinWait("�½�������ʽ")
	ControlSetText("�½�������ʽ", "", "[CLASS:Edit; INSTANCE:1]", $name)
	ControlClick("�½�������ʽ", "", "[CLASS:Button; INSTANCE:1]")
	Sleep(200)
	If WinExists("������ʽ - �����Ѿ�����") Then
		WinClose("������ʽ - �����Ѿ�����")
		WinClose("�½�������ʽ")
		WinClose("������ʽ")
	Else
		WinWaitClose("�½�������ʽ")
		ControlCommand("������ʽ", "", "[CLASS:ComboBox; INSTANCE:2]", "SetCurrentSelection", $number) ;����˳���
		ControlCommand("������ʽ", "", "[CLASS:Button; INSTANCE:3]", "UnCheck", "")
		ControlSetText("������ʽ", "", "[CLASS:Edit; INSTANCE:1]", "0")
		
		If $flag = 6 Then
			ControlSetText("������ʽ", "", "[CLASS:Edit; INSTANCE:2]", "1")
		Else
			ControlSetText("������ʽ", "", "[CLASS:Edit; INSTANCE:2]", "0.66") ;���ֱ���
		EndIf
		
		ControlClick("������ʽ", "", "[CLASS:Button; INSTANCE:14]")
		WinClose("������ʽ")
	EndIf
EndFunc   ;==>wenziyangshi

Func biaozhuyangshi()
	WinActivate("AutoCAD 2011")
	ControlSend("AutoCAD 2011", "", 2, "dimstyle{enter}")
	WinWait("��ע��ʽ������")
	ControlClick("��ע��ʽ������", "", "[CLASS:Button; INSTANCE:4]")
	WinWait("�����±�ע��ʽ")
	ControlSetText("�����±�ע��ʽ", "", "[CLASS:Edit; INSTANCE:1]", $name)
	ControlClick("�����±�ע��ʽ", "", "[CLASS:Button; INSTANCE:2]")
;~ 	Sleep(1000)
;~ �������ò������
	WinWait("�½���ע��ʽ:")
	WinActivate("�½���ע��ʽ:", "")
	Local $taptext ;ÿ��ѡ�����Ŀɼ����ֲ�ͬ��
;~ �� ѡ�

	$taptext = "�̶����ȵ�������"
	While Not WinExists("�½���ע��ʽ:", $taptext)
		Send("^{TAB}")
	WEnd
	Sleep(100)
	ControlCommand("�½���ע��ʽ:", $taptext, 2517, "SetCurrentSelection", 0)
	ControlCommand("�½���ע��ʽ:", $taptext, 2522, "SetCurrentSelection", 0)
	ControlCommand("�½���ע��ʽ:", $taptext, 2518, "SetCurrentSelection", 0)
	ControlSetText("�½���ע��ʽ:", $taptext, 2501, "1.25")
	ControlClick("�½���ע��ʽ:", $taptext, 2501)
	ControlSetText("�½���ע��ʽ:", $taptext, 2503, "0")
	ControlClick("�½���ע��ʽ:", $taptext, 2503)
;~ 	Sleep(1000)
;~ ���źͼ�ͷ ѡ�
	$taptext = "���������ע"
	While Not WinExists("�½���ע��ʽ:", $taptext)
		Send("^{TAB}")
	WEnd
	Sleep(100)
	ControlCommand("�½���ע��ʽ:", $taptext, 2527, "SetCurrentSelection", 0)
	ControlCommand("�½���ע��ʽ:", $taptext, 2528, "SetCurrentSelection", 0)
	ControlCommand("�½���ע��ʽ:", $taptext, 2677, "SetCurrentSelection", 0)
	ControlSetText("�½���ע��ʽ:", $taptext, 2529, "3")
	ControlClick("�½���ע��ʽ:", $taptext, 2529)
;~ 	Sleep(1000)
;~ ���� ѡ�
	$taptext = "�������ֱ߿�"
	While Not WinExists("�½���ע��ʽ:", $taptext)
		Send("^{TAB}")
	WEnd
	Sleep(100)
	ControlCommand("�½���ע��ʽ:", $taptext, 2515, "SetCurrentSelection", 0)
	ControlCommand("�½���ע��ʽ:", $taptext, 2645, "SetCurrentSelection", 0)
	ControlCommand("�½���ע��ʽ:", $taptext, 2692, "SetCurrentSelection", 0)
	ControlSetText("�½���ע��ʽ:", $taptext, 2508, "3")
	ControlClick("�½���ע��ʽ:", $taptext, 2508)
	ControlCommand("�½���ע��ʽ:", $taptext, 2502, "SetCurrentSelection", 1)
	ControlCommand("�½���ע��ʽ:", $taptext, 2510, "SetCurrentSelection", 0)
	ControlCommand("�½���ע��ʽ:", $taptext, 2729, "SetCurrentSelection", 0)
	ControlSetText("�½���ע��ʽ:", $taptext, 2516, "1")
	ControlClick("�½���ע��ʽ:", $taptext, 2516)
	ControlCommand("�½���ע��ʽ:", $taptext, 2680, "Check", "")
;~ 	Sleep(1000)
;~ ���� ѡ�
	$taptext = "����ͷ���ܷ�����������"
	While Not WinExists("�½���ע��ʽ:", $taptext)
		Send("^{TAB}")
	WEnd
	Sleep(100)
	ControlCommand("�½���ע��ʽ:", $taptext, 2688, "Check", "")
	ControlCommand("�½���ע��ʽ:", $taptext, 2729, "SetCurrentSelection", 0)
	ControlCommand("�½���ע��ʽ:", $taptext, 2723, "UnCheck", "")
	ControlCommand("�½���ע��ʽ:", $taptext, 2682, "Check", "")
	ControlSetText("�½���ע��ʽ:", $taptext, 2533, $scale)
	ControlClick("�½���ע��ʽ:", $taptext, 2533)
	ControlCommand("�½���ע��ʽ:", $taptext, 2686, "UnCheck", "")
	ControlCommand("�½���ע��ʽ:", $taptext, 2687, "Check", "")
;~ 	Sleep(1000)
;~ ����λ ѡ�
	$taptext = "��������"
	While Not WinExists("�½���ע��ʽ:", $taptext)
		Send("^{TAB}")
	WEnd
	Sleep(100)
	ControlCommand("�½���ע��ʽ:", $taptext, 2534, "SetCurrentSelection", 1)
	ControlCommand("�½���ע��ʽ:", $taptext, 2512, "SetCurrentSelection", 2)
	ControlSetText("�½���ע��ʽ:", $taptext, 2509, "1")
	ControlClick("�½���ע��ʽ:", $taptext, 2509)
	ControlCommand("�½���ע��ʽ:", $taptext, 2652, "UnCheck", "")
	ControlCommand("�½���ע��ʽ:", $taptext, 2653, "Check", "")
	ControlCommand("�½���ע��ʽ:", $taptext, 2659, "UnCheck", "")
	ControlCommand("�½���ע��ʽ:", $taptext, 2661, "Check", "")
;~ 	Sleep(1000)
;~ ���㵥λ ѡ�
	$taptext = "��ʾ���㵥λ"
	While Not WinExists("�½���ע��ʽ:", $taptext)
		Send("^{TAB}")
	WEnd
	Sleep(100)
	ControlCommand("�½���ע��ʽ:", $taptext, 2546, "UnCheck", "")
;~ 	Sleep(1000)
;~ ���� ѡ�
	$taptext = "�����ʽ"
	While Not WinExists("�½���ע��ʽ:", $taptext)
		Send("^{TAB}")
	WEnd
	Sleep(100)
	ControlCommand("�½���ע��ʽ:", $taptext, 2504, "SetCurrentSelection", 0)
;~ 	Sleep(1000)
	;ѡ�������ϣ�
	
	ControlClick("�½���ע��ʽ:", "", 1)
	WinWaitClose("�½���ע��ʽ:")
	ControlClick("��ע��ʽ������", "", 1)

	Sleep(500)

	If WinExists("AutoCAD ����", "") Then ControlClick("AutoCAD ����", "", "[CLASS:Button; INSTANCE:1]")

	TrayTip("��ϲ��", "AutoCAD�µı�ע��ʽ�½���ɣ����Ǳ���ֵ��Ҫ����ͼֽ�޸ģ�", 3000)
	Sleep(3000)
EndFunc   ;==>biaozhuyangshi




