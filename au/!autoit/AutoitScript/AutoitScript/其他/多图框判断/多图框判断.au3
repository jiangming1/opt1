#region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\ico\0 (2).ico
#PRE_Outfile=AutoCAD to PDF_��ӡ��ʽ.exe
#PRE_Outfile_x64=cadtopdf.exe
#PRE_Compression=4
#PRE_Res_Fileversion=0.0.0.38
#PRE_Res_Fileversion_AutoIncrement=p
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
	
	Au3 �汾:3.3.2
	�ű�����:chen
	�����ʼ�:chen2j@qq.com
	QQ/TM:361995143
	�ű��汾:0.0.0.37
	�ű�����:
	11.19�����ӣ����Ը��ݱ߿��ɫ����ɫ�ͺ�ɫ���ж�ͼֽ��С��������΢�����ӳ�ʱ�䡣
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#include <Array.au3>
Local $flag
Local $filename, $i
Global $single, $spit
HotKeySet("{ESC}", "esc") ;---------------------------------------------------------------------------------------ESC�˳�
AutoItSetOption("SendKeyDelay", 50) ;---------------------------------------------------------------------------------------���������ı��ļ��ʱ�䣬ʱ��̫��ᵼ����������޷�ѡ��PDF�����ļ���
$pdfoutdir = @DesktopCommonDir & "\PDF_OUT"
If Not FileExists($pdfoutdir) Then DirCreate($pdfoutdir)
Global $flag = 0 ;---------------------------------------------------------------------------------------ͼֽΪA3��flag=1��ͼֽΪA4��flag=0
ShellExecute(@ScriptDir & "\wait.au3") ;�����жϽű������Զ����ء�
$filename = FileOpenDialog("��ѡ����Ҫת����CAD�ļ�", "", "ͼ�� (*.dwg)", 4) ;����ѡ���ļ��Ի���
If @error Then Exit ;���û��ѡ���ѡ��������˳�
$spit = StringSplit($filename, "|") ;�ָ��ļ��������
If @error Then
	$single = $filename ;˵��ѡ����ǵ����ļ�
	CADtoPDF($single)
Else
	For $i = 2 To $spit[0] ;һ��һ����ת��PDF��ֱ��������
		$single = $spit[1] & "\" & $spit[$i]
		CADtoPDF($single)
	Next
EndIf
Func CADtoPDF($single) ;�Զ��庯����
	Local $PID = ProcessExists("acad.exe") ;���CAD�Ƿ��Ѿ������С�
	If $PID Then ProcessClose($PID) ;�����������ֹ����
	ShellExecute($single) ;�����ļ�,�����Ч
	MouseMove(0, 0)
	WinWait("AutoCAD 2011", "����������ģ��") ;�ȴ�AutoCAD�������
	WinSetState("AutoCAD 2011", "����������ģ��", @SW_MAXIMIZE) ;���CAD����
	;	ControlSend("AutoCAD 2011", "", 2, "z e ") ;ʹҳ�����
	WinActivate("AutoCAD 2011", "����������ģ��")
	WinWaitActive("AutoCAD 2011", "����������ģ��")
	$bing = biankuang()
;	_ArrayDisplay($bing)
	ControlSend("AutoCAD 2011", "", 2, "pagesetup ") ;����ҳ�����ù�����
	WinWait("ҳ�����ù�����") ;��ֱͣ����ҳ�����ù�����
	ControlSend("ҳ�����ù�����", "", 4696, "!m") ;����ALT+M��
	WinWait("ҳ������ - ģ��") ;��ֱͣ����ҳ������ - ģ��
	ControlCommand("ҳ������ - ģ��", "", 1020, "SetCurrentSelection", 4) ;���ô�ӡ��Ϊ��Adobe PDF��
	If $flag = 1 Then
		ControlCommand("ҳ������ - ģ��", "", 1040, "SelectString", 'A3') ;����ͼֽ�ߴ�Ϊ��A3��
		ControlCommand("ҳ������ - ģ��", "", 1037, "Check", "") ;����ͼ�η���Ϊ�����򡱣�ƥ��A3
	Else
		ControlCommand("ҳ������ - ģ��", "", 1040, "SelectString", 'A4') ;����ͼֽ�ߴ�Ϊ��A4��
		ControlCommand("ҳ������ - ģ��", "", 1036, "Check", "") ;����ͼ�η���Ϊ�����򡱣�ƥ��A4
	EndIf
	ControlCommand("ҳ������ - ģ��", "", 1043, "SelectString", '����') ;���ô�ӡ��ΧΪ����Χ��
	If WinExists("ҳ������ - ģ��") Then ControlClick("ҳ������ - ģ��", "", 1061)
	MouseClick("left", $bing[1], $bing[2])
	MouseClick("left", $bing[3], $bing[4])
	
	ControlCommand("ҳ������ - ģ��", "", 1030, "UnCheck", "") ;���ð���ӡ��ʽ��ӡΪ����
	ControlCommand("ҳ������ - ģ��", "", 1030, "Check", "") ;���ð���ӡ��ʽ��ӡΪ���ǡ�---��ֹû�й��ϡ���ӡ�����߿�
	ControlCommand("ҳ������ - ģ��", "", "[CLASS:Button; INSTANCE:20]", "Check", "") ;���ϡ�����ͼֽ��
	ControlCommand("ҳ������ - ģ��", "", 1006, "SelectString", 'monochrome') ;���ô�ӡ��ʽ��Ϊmochrome.ctb-----δ�����������
	ControlClick("ҳ������ - ģ��", "", 1) ;�ر�ҳ������
	WinWaitClose("ҳ������ - ģ��") ;�ȴ��ر�ҳ������
	ControlClick("ҳ�����ù�����", "", 2) ;�ر�ҳ�����ù�����
	While WinExists("ҳ�����ù�����")
		ControlClick("ҳ�����ù�����", "", 2) ;�ر�ҳ�����ù�����
		Sleep(100)
	WEnd
	WinActivate("AutoCAD 2011", "����������ģ��")
	WinWaitActive("AutoCAD 2011", "����������ģ��")
	ControlSend("AutoCAD 2011", "", 2, "^p") ;�򿪴�ӡ�Ի���
	While Not WinExists("��ӡ - ģ��")
		ControlSend("AutoCAD 2011", "", 2, "^p")
		Sleep(500)
	WEnd ;��ʱ�򿪲�����ӡ���ڣ���һ��ѭ����⡣
	ControlClick("��ӡ - ģ��", "", 1) ;�ر�"��ӡ - ģ��"
	WinWaitClose("��ӡ - ģ��")
	WinWait("��� PDF �ļ�Ϊ") ;��ֱͣ���򿪡���� PDF �ļ�Ϊ��
	WinActivate("��� PDF �ļ�Ϊ")
	WinWaitActive("��� PDF �ļ�Ϊ")
	Local $time = @YEAR & @MON & @MDAY & @HOUR & @MIN & @SEC
	ControlSend("��� PDF �ļ�Ϊ", "", 1001, $pdfoutdir & "\" & $time) ;�����ļ�����Ϊ����ʱ��
	ControlSend("��� PDF �ļ�Ϊ", "", 1, "^s")
	WinWait($time) ;��ֱͣ���򿪡�Adobe Acrobat Pro��
	Sleep(500)
	;-------------------------------------------------------------------------�����A3����ʱ����ת90�ȡ�
	If $flag = 1 Then
		ControlSend($time, "", "[CLASS:AVL_AVView; INSTANCE:16]", "^+R")
		While Not WinExists("��תҳ��")
			ControlSend($time, "", "[CLASS:AVL_AVView; INSTANCE:16]", "^+R")
			Sleep(100)
		WEnd
		ControlCommand("��תҳ��", "", "[CLASS:ComboBox; INSTANCE:1]", "SetCurrentSelection", 0)
		ControlClick("��תҳ��", "", "[CLASS:Button; INSTANCE:5]") ;�ر�"��ӡ - ģ��"
		WinWaitClose("��תҳ��")
		ControlSend($time, "", "[CLASS:AVL_AVView; INSTANCE:16]", "^s")
	EndIf
	;-------------------------------------------------------------------------�����A3����ʱ����ת90�ȡ�
	WinClose($time) ;�رա�Adobe Acrobat Pro��
	WinWaitClose($time)
	If WinExists("��ӡ - ģ��") Then WinClose("��ӡ - ģ��") ;��ʱ�������������δ�رգ����½ű���ͣ��
	ControlSend("AutoCAD 2011", "", 2, "^s") ;����CAD
	WinClose("AutoCAD 2011") ;�ر�CAD
	WinWaitClose("AutoCAD 2011")
EndFunc   ;==>CADtoPDF

Func esc()
	Exit
EndFunc   ;==>esc

Func A3()
	;--------------------------------------------------------------------------------------------���ݴ��ڴ�С�ж��Ƿ�A3����A4
	Local $array = ControlGetPos("AutoCAD 2011", "", 59648)
	Local $xpos = (($array[3] - 26) * 420 / 297 + $array[2]) / 2 + $array[0]
	Local $se1 = 0
	Local $se2 = 0
	Local $se3 = 0
	PixelSearch($xpos - 150, $array[1] + 100, $xpos + 50, $array[1] + 150, 0xFFFF00, 20);��ɫ
	If @error Then
		SetError(0)
	Else
		$se1 = 1
	EndIf
	PixelSearch($xpos - 150, $array[1] + 100, $xpos + 50, $array[1] + 150, 0xFF0000, 20);��ɫ
	If @error Then
		SetError(0)
	Else
		$se2 = 1
	EndIf
	PixelSearch($xpos - 150, $array[1] + 100, $xpos + 50, $array[1] + 150, 0xFFFFFF, 20);��ɫ
	If @error Then
		SetError(0)
	Else
		$se3 = 1
	EndIf
	If $se1 Or $se2 Or $se3 Then $flag = 1
	;--------------------------------------------------------------------------------------------���ݴ��ڴ�С�ж��Ƿ�A3����A4
EndFunc   ;==>A3

Func biankuang()
	Local $array = ControlGetPos("AutoCAD 2011", "", 59648)
	Local $x, $y
	For $x = $array[0] + 10 To $array[0] + $array[2] - 60 Step 50
		For $y = $array[1] + 5 To $array[1] + $array[3] - 80 Step 50
			If PixelChecksum($x, $y, $x + 50, $y + 50) <> 1019006366 Then
				ExitLoop (2)
			EndIf
		Next
	Next
	
	Local $x1, $y1, $pos[5]
	For $x1 = $x To $x + 50
		For $y1 = $y To $y + 50
			If PixelGetColor($x1, $y1) <> 0x212830 Then
				MsgBox(0, "", "�ҵ���������Ϊ" & $x1 & "," & $y1)
				$pos[1] = $x1
				$pos[2] = $y1
				ExitLoop (2)
			EndIf
		Next
	Next
	
	For $x2 = $x1 To $x1 + $array[2]
		If PixelGetColor($x2, $y1) = 0x212830 Then
			$pos[3] = $x2 - 1
			ExitLoop
		EndIf
	Next
	
	For $y2 = $y1 To $y1 + $array[3]
		If PixelGetColor($pos[3], $y2) = 0x212830 Then
			$pos[4] = $y2 - 1
			ExitLoop
		EndIf
	Next
	Return $pos
EndFunc   ;==>biankuang