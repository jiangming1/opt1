#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=ICO\1.ico
#PRE_Outfile=��׽�ߵ��Զ�����.exe
#PRE_Compression=4
#PRE_UseX64=n
#PRE_Res_Description=��׽�ߵ��Զ�����
#PRE_Res_Fileversion=0.0.0.4
#PRE_Res_Fileversion_AutoIncrement=y
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
	�ű�����:��Ҫ��Proe�Ͻ��򿪲�׽����Ϊ��ݼ�F11
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
Opt("WinTitleMatchMode",2)
If WinExists("- Pro/ENGINEER Wildfire 5.0") Then
	TrayTip("��ʾ","��⵽��ͼ����",3000)
Else
	TrayTip("��ʾ","û�м�⵽��ͼ���ڣ������˳���",3000)
	Sleep(3000)
	Exit
EndIf

WinActivate("- Pro/ENGINEER Wildfire 5.0")
Sleep(500)
Send("^a")
Sleep(200)
Send("{F11}")
Local $pos = WinGetPos("- Pro/ENGINEER Wildfire 5.0")
Local $x = ControlGetPos("- Pro/ENGINEER Wildfire 5.0", "", "[CLASS:PGL_MOGL_WN_CLASS; INSTANCE:1]")
$x[0] = $x[0] + $pos[0]
$x[1] = $x[1] + $pos[1]
;~ MouseMove($x[0],$x[1])
;~ Sleep(500)
;~ MouseMove($x[0]+$x[2],$x[1]+$x[3])
Local $a = 50
Local $b = 50
Local $flag = 0

While $a < $x[2]
	$b = 50
	While $b < $x[3]

		$array = PixelSearch($x[0] + $a, $x[1] + $b, $x[0] + $a + 50, $x[1] + $b + 50, 0x3366FF)
		If Not @error Then
				Send("{CTRLDOWN}")
				MouseClick("", $array[0]+10, $array[1])
				MouseClick("", $array[0], $array[1]+10)
				Send("{CTRLUP}")
				MouseMove($array[0]-50, $array[1])
				Sleep(200)
		EndIf
;~ 		MouseMove($x[0]+$a-50,$x[1]+$b-50)
		$b = $b + 50
;~ 		TrayTip($a,$b,2000)
;~ 		Sleep(2000)
		SetError(0)
		$flag = 0
	WEnd
	$a = $a + 50
WEnd

MouseClick("middle",($x[0] +$x[2])/2,($x[1] +$x[3])/2)
Sleep(200)
Send("6")
MouseClick("middle",($x[0] +$x[2])/2,($x[1] +$x[3])/2)
Sleep(200)
Send("3")
MouseClick("middle",($x[0] +$x[2])/2,($x[1] +$x[3])/2)
Sleep(200)
Send("6")
MouseClick("middle",($x[0] +$x[2])/2,($x[1] +$x[3])/2,3)

TrayTip("��ʾ","��׽�߶��������ˣ�",3000)
Sleep(3000)