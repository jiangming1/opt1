#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\ICO\��Լϵͳ����ͼ������16.ico
#PRE_Outfile=Proe to PDF.exe
#PRE_Compression=4
#PRE_Res_Comment=Proe to cad to pdfȫ�Զ�
#PRE_Res_Description=���Խ�Proeת����ɵ�CAD�ļ��Զ��ĸ�ʽ�����Զ�����ת����PDF�ļ���
#PRE_Res_Fileversion=2.8.3.81
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
	
	Au3 �汾:3.3.2
	�ű�����:chen
	�����ʼ�:chen2j@qq.com
	QQ/TM:361995143
	�ű��汾:0.0.0.37
	�ű�����:
	11.19�����ӣ����Ը��ݱ߿��ɫ����ɫ�ͺ�ɫ���ж�ͼֽ��С��������΢�����ӳ�ʱ�䡣
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#include <File.au3>
#include <WinAPIEx.au3>
Local $filename, $i, $nextcindex, $single, $spit
Local $log[5]
Global $print = 0
HotKeySet("{ESC}", "esc") ;---------------------------------------------------------------------------------------ESC�˳�
HotKeySet("^1", "printyes") ;---------------------------------------------------------------------------------------pdf��ӡģʽ
HotKeySet("^2", "printno") ;---------------------------------------------------------------------------------------PDFת��ģʽ

Local $my_Version = "proetopdf_zaoki.com"
AutoItWinSetTitle($my_Version) ;д���ļ����⣬�������������ʶ��

SendKeepActive("AutoCAD 2011")

FileInstall("PopupWindowClick.exe", @TempDir & "\PopupWindowClick.exe", 1)
ShellExecute(@TempDir & "\PopupWindowClick.exe") ;����������򣬻��Զ����ء�

$filename = FileOpenDialog("��ѡ����Ҫת����CAD�ļ�", "", "ͼ�� (*.dwg)", 4) ;����ѡ���ļ��Ի���
If @error Then Exit ;���û��ѡ���ѡ��������˳�

Local $hTimer = TimerInit() ; ��ʼ��ʱ

$spit = StringSplit($filename, "|") ;�ָ��ļ��������
If @error Then
	$single = $filename ;˵��ѡ����ǵ����ļ�
	If FileExists(StringReplace($single, ".dwg", "_dwg__out.log") & ".?") Then
		$nextcindex = ProetoCad($single)
	Else
		$nextcindex = $single
	EndIf
	CADtoPDF($nextcindex)
	$spit[0] = 2
Else
	For $i = 2 To $spit[0] ;һ��һ����ת��PDF��ֱ��������
		$single = $spit[1] & "\" & $spit[$i]
		If FileExists(StringReplace($single, ".dwg", "_dwg__out.log.1")) Then
			$nextcindex = ProetoCad($single)
		Else
			$nextcindex = $single
		EndIf
		CADtoPDF($nextcindex)
		TrayTip("��ʾ", "����" & $spit[0] - 1 & "���ļ���Ҫת��������ɵ�" & $i - 1 & "���ļ���", 5)
	Next
EndIf
TrayTip("��ʾ", "ת���ɹ�������ת����" & $spit[0] - 1 & "���ļ�����ʱ" & jishi(TimerDiff($hTimer)) & "��", 5)
_PathSplit($single, $log[1], $log[2], $log[3], $log[4])
FileRecycle($log[1] & $log[2] & "plot.log")
ControlSend("Program Manager", "", 1, "{F5}") ;~ 	ˢ������
Sleep(5000)

Func ProetoCad($single) ;�Զ��庯����
	Local $PID = ProcessExists("acad.exe") ;���CAD�Ƿ��Ѿ������С�
	If $PID Then ProcessClose($PID) ;�����������ֹ����
	ShellExecute($single) ;�����ļ�
	MouseMove(0, 0)
	WinWait("AutoCAD 2011", "����������ģ��") ;�ȴ�AutoCAD�������
	WinSetState("AutoCAD 2011", "����������ģ��", @SW_MAXIMIZE)
	ControlClick("����ѡ��", "", 1) ;�ر�ҳ������
	WinWaitClose("����ѡ��") ;�ȴ��ر�ҳ������
	WinMenuSelectItem("AutoCAD 2011", "", "�ļ�", "ͼ��ʵ�ù���", "����") ;��������
	WinWait("����") ;�ȴ�����������
	ControlClick("����", "", 1031) ;�ر�ҳ������
	WinWait("���� - ȷ������") ;�ȴ���������ȷ�ϴ���
	Send("!a") ;ȷ��
	ControlClick("����", "", 1) ;�ر�����
	While WinExists("����")
		ControlClick("����", "", 1) ;�ر�����
	WEnd
	ControlSend("AutoCAD 2011", "", 2, "proe{enter}") ;����PROE
;~ 		WinMenuSelectItem("AutoCAD 2011", "", "����", "����¼����","����","proe")
	WinWait("Layer") ;��ֱͣ����ҳ�����ù�����
	WinClose("Layer")
	While WinExists("Layer", "��ת������(&I)")
		WinClose("Layer", "��ת������(&I)") ;�ر�����
	WEnd
	WinMenuSelectItem("AutoCAD 2011", "", "��ͼ", "����", "��Χ") ;ʹҳ����󻯲���ҳ�����ù�����
	WinMenuSelectItem("AutoCAD 2011", "", "����", "����ѡ��")
	WinWait("����ѡ��")
	ControlCommand("����ѡ��", "", 1011, "SelectString", '����')
	ControlCommand("����ѡ��", "", 1023, "SelectString", 'center')
	ControlCommand("����ѡ��", "", 1013, "Check", "")
	ControlCommand("����ѡ��", "", 1036, "Check", "")
	ControlClick("����ѡ��", "", 1) ;�ر�ҳ������
	WinWaitClose("����ѡ��") ;�ȴ��ر�ҳ������
	ControlSend("AutoCAD 2011", "", 2, "chprop{enter}")
	
;~ ��ʼ�ж�ǰ���ǲ���ѡ����ʲô����
	While 1
		Local $xuanze = 0
		If WinExists("AutoCAD 2011", "ѡ�����") Then
			$xuanze = 10
			ExitLoop
		EndIf
		If WinExists("AutoCAD 2011", "����Ҫ���ĵ�����") Then
			$xuanze = 20
			ExitLoop
		EndIf
		Sleep(500)
	WEnd
;~ �����ж�ǰ���ǲ���ѡ����ʲô����

	If $xuanze = 10 Then
		ControlSend("AutoCAD 2011", "", 2, "{ESC}")
	Else
		WinWait("AutoCAD 2011", "����Ҫ���ĵ�����")
		ControlSend("AutoCAD 2011", "", 2, "la{enter}")
		WinWait("AutoCAD 2011", "������ͼ����")
		ControlSend("AutoCAD 2011", "", 2, "__________center{enter}")
		Sleep(200)
		ControlSend("AutoCAD 2011", "", 2, "c{enter}")
		WinWait("AutoCAD 2011", "����ɫ")
		ControlSend("AutoCAD 2011", "", 2, "ByLayer{enter}")
		Sleep(200)
		ControlSend("AutoCAD 2011", "", 2, "lt{enter}")
		WinWait("AutoCAD 2011", "������������")
		ControlSend("AutoCAD 2011", "", 2, "ByLayer{enter}")
		Sleep(200)
		ControlSend("AutoCAD 2011", "", 2, "lw{enter}")
		WinWait("AutoCAD 2011", "�������߿�")
		ControlSend("AutoCAD 2011", "", 2, "ByLayer{enter}{enter}")
		ControlSend("AutoCAD 2011", "", 2, "{ESC}")
	EndIf
	ControlSend("AutoCAD 2011", "", 2, "qselect ")
	WinWait("����ѡ��")
	ControlCommand("����ѡ��", "", 1020, "SelectString", '��')
	ControlClick("����ѡ��", "", 1) ;�ر�ҳ������
	WinWaitClose("����ѡ��") ;�ȴ��ر�ҳ������
	ControlSend("AutoCAD 2011", "", 2, "qselect ")
	WinWait("����ѡ��")
	ControlCommand("����ѡ��", "", 1020, "SelectString", '��')
	ControlClick("����ѡ��", "", 1) ;�ر�ҳ������
	WinWaitClose("����ѡ��") ;�ȴ��ر�ҳ������
	ControlSend("AutoCAD 2011", "", 2, "chprop{enter}")

;~ ��ʼ�ж�ǰ���ǲ���ѡ����ʲô����
	While 1
		$xuanze = 0
		If WinExists("AutoCAD 2011", "ѡ�����") Then
			$xuanze = 10
			ExitLoop
		EndIf
		If WinExists("AutoCAD 2011", "����Ҫ���ĵ�����") Then
			$xuanze = 20
			ExitLoop
		EndIf
		Sleep(500)
	WEnd
;~ �����ж�ǰ���ǲ���ѡ����ʲô����


	If $xuanze = 10 Then
		ControlSend("AutoCAD 2011", "", 2, "{ESC}")
	Else

		WinWait("AutoCAD 2011", "����Ҫ���ĵ�����")
		ControlSend("AutoCAD 2011", "", 2, "la{enter}")
		WinWait("AutoCAD 2011", "������ͼ����")
		ControlSend("AutoCAD 2011", "", 2, "__________cu{enter}")
		Sleep(200)
		ControlSend("AutoCAD 2011", "", 2, "c{enter}")
		WinWait("AutoCAD 2011", "����ɫ")
		ControlSend("AutoCAD 2011", "", 2, "ByLayer{enter}")
		Sleep(200)
		ControlSend("AutoCAD 2011", "", 2, "lt{enter}")
		WinWait("AutoCAD 2011", "������������")
		ControlSend("AutoCAD 2011", "", 2, "ByLayer{enter}")
		Sleep(200)
		ControlSend("AutoCAD 2011", "", 2, "lw{enter}")
		WinWait("AutoCAD 2011", "�������߿�")
		ControlSend("AutoCAD 2011", "", 2, "ByLayer{enter}{enter}")
		ControlSend("AutoCAD 2011", "", 2, "{ESC}")
	EndIf
	Local $cindexpos = cindexpos()
	MouseClick("left", $cindexpos[4], $cindexpos[5], 1)
;~ ��ʼ����ͼ��
	MouseMove(0, 0)
	WinMenuSelectItem("AutoCAD 2011", "", "����", "�Զ�����Ԫ��ʽ")
	WinWait("���Ԫ��ʽ")
	ClipPut(ControlGetText("���Ԫ��ʽ", "", 1021))
	WinClose("���Ԫ��ʽ")
	WinWaitClose("���Ԫ��ʽ")
;~ 	Sleep(500)
;~ ��������ͼ��
;~ 	WinMenuSelectItem("AutoCAD 2011", "", "�޸�", "��ת")
;~ 	MouseClick("left", $cindexpos[2], $cindexpos[3])   ;������½�
;~ 	MouseClick("left", $cindexpos[4], $cindexpos[3])	;���
;~ 	MouseClick("left", $cindexpos[2] * 3 / 2 - $cindexpos[0] / 2, $cindexpos[3])
;~ 	WinMenuSelectItem("AutoCAD 2011", "", "�޸�", "�ƶ�")
;~ 	MouseClick("left", $cindexpos[2], $cindexpos[3])
;~ 	MouseMove($cindexpos[0]+10, $cindexpos[1]+10)
;~ 	MouseClick("left", $cindexpos[0], $cindexpos[1])
	MouseMove(0, 0)
	WinActivate("AutoCAD 2011", "����������ģ��")
	WinWaitActive("AutoCAD 2011", "����������ģ��")
	WinMenuSelectItem("AutoCAD 2011", "", "�ļ�", "����")
	WinMenuSelectItem("AutoCAD 2011", "", "�ļ�", "�˳�")
	While WinExists("AutoCAD 2011")
		WinClose("AutoCAD 2011")
		Sleep(500)
	WEnd
	FileRecycle(StringReplace($single, ".dwg", "_dwg__out.log.1"))
	If FileExists(StringReplace($single, ".dwg", "_dwg__out.log.2")) Then FileRecycle(StringReplace($single, ".dwg", "_dwg__out.log.2"))
	If FileExists(StringReplace($single, ".dwg", "_dwg__out.log.3")) Then FileRecycle(StringReplace($single, ".dwg", "_dwg__out.log.3"))
;~ ��ʼ�����ļ�����
	Local $cindex = ClipGet()
	If $cindex = "��������" Or $cindex = " " Or $cindex = "" Then
		$cindex = "��ͼ���ļ�_" & @MSEC
	Else
		$cindex = StringReplace($cindex, ".", "", 2)   ;�õ�  8SF352623.1~2.dwg
	EndIf
	
	If StringInStr($cindex,"/") Then $cindex=StringReplace($cindex,"/","-")  ;�滻����  8SF352623.1/2.dwg  �õ�  8SF352623.1-2.dwg
	
	Local $newcindex = @DesktopDir & "\" & $cindex & ".dwg"	   ;�����µ�CAD�ļ��ĳ�·��
	Local $tuhao = FileMove($single, $newcindex)

	Local $count = 1     ;��ʼ�ж��ǲ�������������
	While Not $tuhao
		$tuhao = FileMove($single, @DesktopDir & "\" & $cindex & "�ļ�����_" & $count & ".dwg")
		$newcindex = @DesktopDir & "\" & $cindex & "�ļ�����_" & $count & ".dwg"
		$count = $count + 1
	WEnd   				;�����ж��ǲ�������������

;~ ���������ļ�����
	Return $newcindex ;�����µ��ļ�����
EndFunc   ;==>ProetoCad

Func CADtoPDF($single) ;�Զ��庯����
	Local $PID = ProcessExists("acad.exe") ;���CAD�Ƿ��Ѿ������С�
	If $PID Then ProcessClose($PID) ;�����������ֹ����
	ShellExecute($single) ;�����ļ�,�����Ч
	MouseMove(0, 0)
	WinWait("AutoCAD 2011", "����������ģ��") ;�ȴ�AutoCAD�������
	WinSetState("AutoCAD 2011", "����������ģ��", @SW_MAXIMIZE) ;���CAD����
	WinMenuSelectItem("AutoCAD 2011", "", "��ͼ", "����", "��Χ") ;ʹҳ�����
	WinActivate("AutoCAD 2011", "����������ģ��")
	WinWaitActive("AutoCAD 2011", "����������ģ��")
	Local $a3ora4 = A3A4()
	ControlSend("AutoCAD 2011", "", 2, "pagesetup{enter}") ;����ҳ�����ù�����
	WinWait("ҳ�����ù�����") ;��ֱͣ����ҳ�����ù�����
	ControlSend("ҳ�����ù�����", "", 4696, "!m") ;����ALT+M��
	WinWait("ҳ������ - ģ��") ;��ֱͣ����ҳ������ - ģ��
	ControlCommand("ҳ������ - ģ��", "", 1020, "SetCurrentSelection", 4) ;���ô�ӡ��Ϊ��Adobe PDF��
	If $a3ora4 = 1 Then
		ControlCommand("ҳ������ - ģ��", "", 1040, "SelectString", 'A3') ;����ͼֽ�ߴ�Ϊ��A3��
		ControlCommand("ҳ������ - ģ��", "", 1037, "Check", "") ;����ͼ�η���Ϊ�����򡱣�ƥ��A3
	Else
		ControlCommand("ҳ������ - ģ��", "", 1040, "SelectString", 'A4') ;����ͼֽ�ߴ�Ϊ��A4��
		ControlCommand("ҳ������ - ģ��", "", 1036, "Check", "") ;����ͼ�η���Ϊ�����򡱣�ƥ��A4
	EndIf
	ControlCommand("ҳ������ - ģ��", "", 1043, "SelectString", '��Χ') ;���ô�ӡ��ΧΪ����Χ��
	ControlCommand("ҳ������ - ģ��", "", 1030, "UnCheck", "") ;���ð���ӡ��ʽ��ӡΪ����
	ControlCommand("ҳ������ - ģ��", "", 1030, "Check", "") ;���ð���ӡ��ʽ��ӡΪ���ǡ�---��ֹû�й��ϡ���ӡ�����߿�
	ControlCommand("ҳ������ - ģ��", "", 1053, "Check", "") ;���ò���ͼֽ
	ControlCommand("ҳ������ - ģ��", "", 1046, "Check", "") ;���þ��д�ӡ
;~ 	ControlCommand("ҳ������ - ģ��", "", 1006, "SelectString", 'monochrome') ;���ô�ӡ��ʽ��Ϊmochrome.ctb
;~ 	Sleep(500)
	Local $monochrome = ControlCommand("ҳ������ - ģ��", "", 1006, "GetCurrentSelection", '')
	While StringCompare("monochrome.ctb", $monochrome)
		ControlCommand("ҳ������ - ģ��", "", 1006, "SelectString", 'monochrome') ;���ô�ӡ��ʽ��Ϊmochrome.ctb
		Sleep(500)
		$monochrome = ControlCommand("ҳ������ - ģ��", "", 1006, "GetCurrentSelection", '')
	WEnd
	
	ControlCommand("ҳ������ - ģ��", "", 1053, "Check", "") 
	ControlCommand("ҳ������ - ģ��", "", 1046, "Check", "") ;�ظ�����һ��
	
	While ControlCommand("ҳ������ - ģ��", "", "[CLASS:Button; INSTANCE:10]", "IsEnabled", "")
		Send("!E")
		Sleep(500)
	WEnd

	ControlClick("ҳ������ - ģ��", "", 1) ;�ر�ҳ������
	WinWaitClose("ҳ������ - ģ��") ;�ȴ��ر�ҳ������
	ControlClick("ҳ�����ù�����", "", 2) ;�ر�ҳ�����ù�����
	While WinExists("ҳ�����ù�����")
		ControlClick("ҳ�����ù�����", "", 2) ;�ر�ҳ�����ù�����
		Sleep(100)
	WEnd
	WinActivate("AutoCAD 2011", "����������ģ��")
	WinWaitActive("AutoCAD 2011", "����������ģ��")
	If $print = 1 Then
		ControlSend("AutoCAD 2011", "", 2, "print{enter}") ;�򿪴�ӡ�Ի���
		WinWait("��ӡ - ģ��")
		ControlClick("��ӡ - ģ��", "", 1) ;�����ӡ
		WinWaitClose("��ӡ - ģ��")
		WinWait("��� PDF �ļ�Ϊ") ;��ֱͣ���򿪡���� PDF �ļ�Ϊ��
		Local $pdfname = ControlGetText("��� PDF �ļ�Ϊ", "", 1001)
		While @error
			SetError(0)
			$pdfname = ControlGetText("��� PDF �ļ�Ϊ", "", 1001)
			Sleep(200)
		WEnd
		While WinExists("��� PDF �ļ�Ϊ")
			ControlClick("��� PDF �ļ�Ϊ", "", "[CLASS:Button; INSTANCE:1]")
			Sleep(500)
		WEnd
		WinWait($pdfname) ;��ֱͣ���򿪡�Adobe Acrobat Pro��
		;-------------------------------------------------------------------------�����A3����ʱ����ת90�ȡ�
		If $a3ora4 = 1 Then
			ControlSend($pdfname, "", "[CLASS:AVL_AVView; INSTANCE:16]", "^+R")
			While Not WinExists("��תҳ��")
				ControlSend($pdfname, "", "[CLASS:AVL_AVView; INSTANCE:16]", "^+R")
				Sleep(100)
			WEnd
			ControlCommand("��תҳ��", "", "[CLASS:ComboBox; INSTANCE:1]", "SetCurrentSelection", 0)
			ControlClick("��תҳ��", "", "[CLASS:Button; INSTANCE:5]") ;�ر�"��ӡ - ģ��"
			WinWaitClose("��תҳ��")
		EndIf
		;-------------------------------------------------------------------------�����A3����ʱ����ת90�ȡ�
		Local $pdfdir = _WinAPI_GetProcessCommandLine(WinGetProcess($pdfname))
		$pdfdir = StringReplace($pdfdir, """", "")
		
		ControlSend($pdfname, "", "[CLASS:AVL_AVView; INSTANCE:16]", "^s")
		WinClose($pdfname) ;�رա�Adobe Acrobat Pro��
		ControlSend("AutoCAD 2011", "", 2, "{esc}") ;����CAD
		ControlSend("AutoCAD 2011", "", 2, "qsave{enter}") ;����CAD
		WinClose("AutoCAD 2011") ;�ر�CAD
		While WinExists("AutoCAD 2011")
			WinClose("AutoCAD 2011")
			Sleep(500)
		WEnd
		;-------------------------------------------------------------------------���Ǹĳ�ͼ�ŵ����ְ�o(��_��)o
		Local $number = StringSplit($single, "\")
		Local $cindex = $number[$number[0]]     ;�õ�����  8SF326236.1~2.dwg
		$cindex = StringTrimRight($cindex, 4)   ;�õ�����  8SF326236.1~2
		Local $rename = FileMove($pdfdir, @DesktopDir & "\PDF Convert\" & $cindex & ".pdf", 9)
		While Not $rename
			$rename = FileMove($pdfdir, @DesktopDir & "\PDF Convert\" & $cindex & ".pdf", 9)
			Sleep(500)
		WEnd
;~ 	;-------------------------------------------------------------------------���Ǹĳ�ͼ�ŵ����ְ�o(��_��)o
	Else
		ControlSend("AutoCAD 2011", "", 2, "exportpdf{enter}") ;�򿪴�ӡ�Ի���
		WinWait("���Ϊ PDF") ;��ֱͣ����"��ӡ - ģ��"
		WinActivate("���Ϊ PDF")
		WinWaitActive("���Ϊ PDF")
		ControlCommand("���Ϊ PDF", "", 13001, "SelectString", '����') ;���ô�ӡ��ΧΪ����Χ��
		ControlCommand("���Ϊ PDF", "", 4214, "SelectString", '��Χ') ;���ô�ӡ��ΧΪ����Χ��
		Local $cindex_convert = ControlGetText("���Ϊ PDF", "", 1001)
		ControlClick("���Ϊ PDF", "", "[CLASS:Button; INSTANCE:16]")
		While WinExists("���Ϊ PDF")
			ControlClick("���Ϊ PDF", "", "[CLASS:Button; INSTANCE:16]")
			Sleep(200)
		WEnd
		ControlSend("AutoCAD 2011", "", 2, "{ESC}") ;����CAD
		WinMenuSelectItem("AutoCAD 2011", "", "�ļ�", "����")
		WinMenuSelectItem("AutoCAD 2011", "", "�ļ�", "�˳�")
		While WinExists("AutoCAD 2011")
			WinClose("AutoCAD 2011")
			Sleep(500)
		WEnd
		FileMove(@DesktopDir & "\" & $cindex_convert, @DesktopDir & "\PDF Convert\" & $cindex_convert, 9)
	EndIf
EndFunc   ;==>CADtoPDF

Func esc()
	Exit
EndFunc   ;==>esc

Func printyes()
	$print = 1
	TrayTip("��ʾ", "�л���PDF��ӡģʽ", 5)
EndFunc   ;==>printyes

Func printno()
	$print = 0
	TrayTip("��ʾ", "�л���PDFת��ģʽ", 5)
EndFunc   ;==>printno

Func A3A4()
	;--------------------------------------------------------------------------------------------���ݴ��ڴ�С�ж��Ƿ�A3����A4
	Local $flag = 0
	Local $array = ControlGetPos("AutoCAD 2011", "", 59648)
	Local $xpos = (($array[3] - 26) * 420 / 297 + $array[2]) / 2 + $array[0]
	Local $se = 0
	;--------------------------------------------------------------------------------------------��ɫ��������
	PixelSearch($xpos - 150, $array[1] + 100, $xpos + 50, $array[1] + 110, 0xFFFF00, 20);��ɫ
	If @error Then
		SetError(0)
	Else
		$se = 1
	EndIf
	PixelSearch($xpos - 150, $array[1] + 100, $xpos + 50, $array[1] + 110, 0xFF0000, 20);��ɫ
	If @error Then
		SetError(0)
	Else
		$se = 1
	EndIf
	PixelSearch($xpos - 150, $array[1] + 100, $xpos + 50, $array[1] + 110, 0xFFFFFF, 20);��ɫ
	If @error Then
		SetError(0)
	Else
		$se = 1
	EndIf
	PixelSearch($xpos - 150, $array[1] + 100, $xpos + 50, $array[1] + 110, 0x00FF00, 20);��ɫ
	If @error Then
		SetError(0)
	Else
		$se = 1
	EndIf
	;--------------------------------------------------------------------------------------------��ɫ��������
	If $se Then $flag = 1
	Return $flag
	;--------------------------------------------------------------------------------------------���ݴ��ڴ�С�ж��Ƿ�A3����A4
EndFunc   ;==>A3A4

Func jishi($iDiff)
	Local $time[4]
	Local $say
	$time[0] = Floor($iDiff / 1000)
	If $time[0] < 60 Then
		$time[1] = $time[0]
		$say = $time[1] & "��"
	Else
		If $time[0] >= 60 And $time[0] < 3600 Then
			$time[2] = Floor($time[0] / 60)
			$time[1] = $time[0] - $time[2] * 60
			$say = $time[2] & "��" & $time[1] & "��"
		Else
			$time[3] = Floor($time[0] / 3600)
			$time[2] = Floor(($time[0] - $time[3] * 3600) / 60)
			$time[1] = $time[0] - $time[2] * 60 - $time[3] * 3600
			$say = $time[3] & "ʱ" & $time[2] & "��" & $time[1] & "��"
		EndIf
	EndIf
	Return $say
EndFunc   ;==>jishi

Func cindexpos()
	WinMenuSelectItem("AutoCAD 2011", "", "��ͼ", "����", "��Χ")
	Sleep(500)
	Local $cpos[6]
	Local $pos1 = ControlGetPos("AutoCAD 2011", "", 59648)   ;��������������
	Local $pos2 = PixelSearch($pos1[0], $pos1[1], $pos1[0] + $pos1[2], $pos1[1] + $pos1[3], 0xFF0000) ;������ͼ��������������
	Local $pos3 = PixelSearch($pos1[0], $pos1[1], $pos2[0] - 5, $pos1[1] + $pos1[3], 0xFF0000) ;������ͼ�����Ͻ�����
	Local $pos4 = PixelSearch($pos3[0] + 5, $pos3[1] + 5, $pos1[0] + $pos1[2], $pos1[1] + $pos1[3], 0xFF0000) ;���½�X����
	Local $pos5 = PixelSearch($pos3[0] + 5, $pos3[1] + 5, $pos4[0] - 5, $pos1[1] + $pos1[3], 0xFF0000) ;���½�Y����
	$cpos[0] = $pos3[0]
	$cpos[1] = $pos3[1]
	$cpos[2] = $pos4[0]
	$cpos[3] = $pos5[1]
	$cpos[4] = ($cpos[0] + $cpos[2]) / 2 ;����X����
	$cpos[5] = ($cpos[1] + $cpos[3]) / 2 ;����Y����
	Return $cpos
EndFunc   ;==>cindexpos