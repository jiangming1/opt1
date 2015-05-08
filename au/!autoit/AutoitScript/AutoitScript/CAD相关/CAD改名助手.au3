#region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\ICO\��Լϵͳ����ͼ������0.ico
#PRE_Outfile=CAD Namechange.exe
#PRE_Compression=4
#PRE_Res_Comment=Proe to cad to pdfȫ�Զ�
#PRE_Res_Description=���Խ�CAD�ļ��Զ������֣�ǰ���ǿ��Ǻ�ɫ�ġ�
#PRE_Res_Fileversion=2.8.3.58
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=zaoki
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
#include <File.au3>
#include <WinAPIEx.au3>
AdlibRegister("tanchuang")
Func tanchuang()
	ControlClick("AutoCAD", "�Ƿ񽫸Ķ����浽", "[CLASS:Button; INSTANCE:1]")
EndFunc
Global $filename, $i, $single, $spit
HotKeySet("{ESC}", "esc") ;---------------------------------------------------------------------------------------ESC�˳�

$filename = FileOpenDialog("��ѡ����Ҫת����CAD�ļ�", "", "ͼ�� (*.dwg)", 4) ;����ѡ���ļ��Ի���
If @error Then Exit ;���û��ѡ���ѡ��������˳�

Local $hTimer = TimerInit() ; ��ʼ��ʱ

$spit = StringSplit($filename, "|") ;�ָ��ļ��������
If @error Then
	$single = $filename ;˵��ѡ����ǵ����ļ�
	$i=2
	$spit[0]=2
	tuhao($single)
Else
	For $i = 2 To $spit[0] ;һ��һ����ת��PDF��ֱ��������
		$single = $spit[1] & "\" & $spit[$i]
		tuhao($single)
	Next
EndIf
Sleep(5000)
TrayTip("��ʾ", "������ɣ�����" & $spit[0] - 1 & "���ļ�����ʱ" & jishi(TimerDiff($hTimer)) & "��", 5)
Sleep(5000)

Func tuhao($single) ;�Զ��庯����
	Local $PID = ProcessExists("acad.exe") ;���CAD�Ƿ��Ѿ������С�
	If $PID Then ProcessClose($PID) ;�����������ֹ����
	ShellExecute($single) ;�����ļ�
	MouseMove(0, 0)
	WinWait("AutoCAD 2011", "����������ģ��") ;�ȴ�AutoCAD�������
	WinSetState("AutoCAD 2011", "����������ģ��", @SW_MAXIMIZE)
	Local $cindexpos=cindexpos()
	MouseClick("left", $cindexpos[4], $cindexpos[5], 1)
	MouseClick("left", $cindexpos[4]+20, $cindexpos[5], 2)
;~ ��ʼ����ͼ��
	ClipPut("")
	MouseMove(0, 0)
	Send("^a")
	Send("^c")
	Sleep(500)
	ControlSend("AutoCAD 2011", "", 2, "{esc}{esc}{esc}")
;~ ��������ͼ��

	WinClose("AutoCAD 2011")
	
	WinWaitClose("AutoCAD 2011")
;~ ��ʼ�����ļ�����
	Local $cindex = ClipGet()
	If $cindex = "��������" Or $cindex = " " Or $cindex = "" Then
		$cindex = "��ȡͼ�ų���_" & @MSEC
	Else
		$cindex = StringReplace($cindex, ".", "", 2)
		$cindex = StringReplace($cindex, @CRLF, "")
;~ 		MsgBox(0,"",$cindex&"QQ")
	EndIf
	
	Local $szDrive, $szDir, $szFName, $szExt
	$TestPath = _PathSplit($single, $szDrive, $szDir, $szFName, $szExt)
	$newtuhao = $szDrive & $szDir & $cindex & ".dwg"
;~ 	MsgBox(0,"",$newtuhao)
	Local $tuhao = FileMove($single, $newtuhao)
	Local $count=1
	If $tuhao=0 Then 
;~ 		TrayTip( $i - 1 & "/" & $spit[0] - 1,"������ʧ�ܣ��Ѿ������ļ��� " & $cindex & ".dwg��",5)
		While Not $tuhao
			$cindex = $cindex & "_" & $count
			$newtuhao = $szDrive & $szDir & $cindex &".dwg"
			$tuhao = FileMove($single, $newtuhao)
			$count=$count+1
		WEnd
	EndIf
	If $tuhao=1 Then TrayTip( $i - 1 & "/" & $spit[0] - 1,$szFName & $szExt & " �Ѿ��Ѿ�������Ϊ " & $cindex & ".dwg",5)
EndFunc   ;==>ProetoCad

Func esc()
	Exit
EndFunc   ;==>esc

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
	WinMenuSelectItem("AutoCAD 2011", "", "��ͼ", "����","��Χ")
	Sleep(500)
	Local $cpos[6]
	Local $pos1 = ControlGetPos("AutoCAD 2011", "", 59648)
	Local $pos2 = PixelSearch($pos1[0], $pos1[1], $pos1[0] + $pos1[2], $pos1[1] + $pos1[3], 0xFF0000)  ;������ͼ��������������
	Local $pos3 = PixelSearch($pos1[0], $pos1[1], $pos2[0] - 5, $pos1[1] + $pos1[3], 0xFF0000)		;������ͼ�����Ͻ�����
	Local $pos4 = PixelSearch($pos3[0] + 5, $pos3[1] + 5, $pos1[0] + $pos1[2], $pos1[1] + $pos1[3], 0xFF0000) ;���½�X����
	Local $pos5 = PixelSearch($pos3[0] + 5, $pos3[1] + 5, $pos4[0] - 5, $pos1[1] + $pos1[3], 0xFF0000) ;���½�Y����
	$cpos[0]=$pos3[0]
	$cpos[1]=$pos3[1]
	$cpos[2]=$pos4[0]
	$cpos[3]=$pos5[1]
	$cpos[4]=($cpos[0]+$cpos[2])/2  ;����X����
	$cpos[5]=($cpos[1]+$cpos[3])/2  ;����Y����
	Return $cpos
EndFunc
