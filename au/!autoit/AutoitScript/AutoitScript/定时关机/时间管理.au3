#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\ICO\��Լϵͳ����ͼ������10.ico
#PRE_Outfile=ʱ�����.exe
#PRE_Compression=4
#PRE_Res_Comment=һ��С���������ɫ�޹�档�������ÿ����Զ������������п����Զ����غͼ����Ƿ��Զ�������ʱ�ػ����ܡ�
#PRE_Res_Description=��ʱ�ػ�����
#PRE_Res_Fileversion=2.5.0.78
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=Zaoki
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
	
	Au3 �汾:3.3.9.4
	�ű�����:zaoki.com
	�����ʼ�:361995143@qq.com
	QQ/TM:361995143
	�ű��汾:0.5.0.14
	�ű�����:
	1.��ʱ�ػ����ܡ������������ö�ʱ�ػ�ʱ�䣬�����м���ػ�ʱ�书�ܡ�����ѡ���Ƿ񿪻���ѡ��ʱ�ػ���
	2.������ʾ���ܡ������Զ��ж��Ƿ��ǹ����պ���ĩ���ܡ������Զ�������ܰ��ʾ���ݡ����Լ����Ƿ�����ʾ����
	3.�����Զ����ع��ܡ�
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <Date.au3>
#include <IE.au3>
#include <File.au3>
#include <INet.au3>
#region ### START Koda GUI section ### Form=c:\users\chen\desktop\form1.kxf
Global $h = 10 ;���ݸ߶ȿɵ�ѡ��

;-----------ini�ļ���ȡ
Local $shezhi_guanjihour = IniRead(@ScriptDir & "\" & "time.ini", "Ĭ�Ϲػ�ʱ��", "�ػ�Сʱ", "05")
Local $shezhi_guanjimin = IniRead(@ScriptDir & "\" & "time.ini", "Ĭ�Ϲػ�ʱ��", "�ػ�����", "30")
Local $shezhi_dingshiguanji = IniRead(@ScriptDir & "\" & "time.ini", "��ʱ�ػ�", "����", "1")
Local $shezhi_zhengdiantixing = IniRead(@ScriptDir & "\" & "time.ini", "��������", "����", "1")
Local $shezhi_tongbu = IniRead(@ScriptDir & "\" & "time.ini", "��������", "�����Զ�����ͬ��", "1")
Local $shezhi_rizhi = IniRead(@ScriptDir & "\" & "time.ini", "����־", "����", "0")
;-----------ini�ļ���ȡ
#OnAutoItStartRegister "hello"  ;����ʱ����������
OnAutoItExitRegister("tuichu")
;------------------------------------------------------form1
$Form1 = GUICreate("ʱ�����", 200, 260, -1, -1, BitOR($WS_CAPTION, $WS_POPUP, $WS_SYSMENU))
$Label1 = GUICtrlCreateLabel("������", 20, $h + 12, 100, 17)
$Label2 = GUICtrlCreateLabel(_NowCalc(), 68, $h + 12, 150, 17)
;-------------------------------------��ʱ�ػ�GUI
$Group1 = GUICtrlCreateGroup("��ʱ�ػ�", 20, $h + 45, 160, 120)
$hour = GUICtrlCreateCombo("00", 30, $h + 67, 40, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData($hour, "01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23", $shezhi_guanjihour)
$min = GUICtrlCreateCombo("00", 110, $h + 67, 40, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData($min, "05|10|15|20|25|30|35|40|45|50|55", $shezhi_guanjimin)
$dian = GUICtrlCreateLabel("��", 75, $h + 70, 24, 17)
$fen = GUICtrlCreateLabel("��", 155, $h + 70, 24, 17)
$Button1 = GUICtrlCreateButton("ִ��", 40, $h + 97, 50, 28)
$Button2 = GUICtrlCreateButton("ȡ��", 110, $h + 97, 50, 28)
$checkbox = GUICtrlCreateCheckbox("������������ʱ�ػ�", 30, $h + 138, 140, 17)
If $shezhi_dingshiguanji = 1 Then
	GUICtrlSetState($checkbox, $GUI_CHECKED)
	GUICtrlSetState($hour, $GUI_DISABLE)
	GUICtrlSetState($min, $GUI_DISABLE)
	GUICtrlSetState($Button1, $GUI_DISABLE)
	GUICtrlSetState($Button2, $GUI_ENABLE)
	GUISetState(@SW_HIDE, $Form1)
Else
	GUICtrlSetState($checkbox, $GUI_UNCHECKED)
	GUICtrlSetState($hour, $GUI_ENABLE)
	GUICtrlSetState($min, $GUI_ENABLE)
	GUICtrlSetState($Button1, $GUI_ENABLE)
	GUICtrlSetState($Button2, $GUI_DISABLE)
	GUISetState(@SW_SHOW, $Form1)
EndIf
;-------------------------------------��ʱ�ػ�GUI
;-------------------------------------���㲥��GUI
$Group2 = GUICtrlCreateGroup("��������", 20, $h + 180, 160, 50)
$Radio1 = GUICtrlCreateRadio("����", 40, $h + 200, 50, 17)
$Radio2 = GUICtrlCreateRadio("�ر�", 110, $h + 200, 50, 17)
If $shezhi_zhengdiantixing = 1 Then
	GUICtrlSetState($Radio1, $GUI_CHECKED)
Else
	GUICtrlSetState($Radio2, $GUI_CHECKED)
EndIf
;~ If $shezhi_dingshiguanji=1 Then GUISetState(@SW_HIDE, $Form1)  ;�����ѡ�˿���������ʱ�ػ��������������ؽ��档
;------------------------------------------------------form1
#endregion ### END Koda GUI section ###

Local $daojishi, $miaoshu, $dqtime, $Label2, $panduan

Opt("TrayMenuMode", 3) ; Ĭ�����̲˵���Ŀ(�ű�����ͣ/�˳��ű�) (Script Paused/Exit) ������ʾ.
$kaiji = TrayCreateMenu("��������")
$kaijiyes = TrayCreateItem("����", $kaiji)
$kaijino = TrayCreateItem("ȡ��", $kaiji)
TrayCreateItem("")
$jiaoshi = TrayCreateItem("У׼ϵͳʱ��")
TrayCreateItem("")
$about = TrayCreateItem("���ڱ����")
TrayCreateItem("")
$homepage = TrayCreateItem("���ʹ���")
TrayCreateItem("")
$exititem = TrayCreateItem("�˳�")
TraySetToolTip("ʱ�����С����") ; ����ƶ���������ʾ����ʾ��
TraySetClick(8) ;�Ҽ��Ż���ʾ�˵�
HotKeySet("^{F1}", "tuichu") ; �����˳���ݼ�Ϊ Ctrl+F1��

If $shezhi_tongbu Then
	InetGet("http://autoitzaoki.googlecode.com/svn/trunk/AutoitScript/%e5%ae%9a%e6%97%b6%e5%85%b3%e6%9c%ba/traytip.dat", @TempDir & "\traytip.dat", 0, 1) ; ͬ�������ϵ���ʾ���ݡ�
EndIf

While 1 ;-------------------------------------------------------------��ʼѭ��
	
	Local $xiaoshi = GUICtrlRead($hour, 1);��ȡ�ػ�Сʱ����
	Local $fenzhong = GUICtrlRead($min, 1) ;��ȡ�ػ���������
	;-----------------------------------------------------------------------��ʾ����ʱ��
	If $dqtime <> _NowCalc() Then
		GUICtrlSetData($Label2, _NowCalc())
		$dqtime = _NowCalc()
	EndIf
	;-----------------------------------------------------------------------��������ʱ��
	;-------------------------------------------------------------��ʼ�ж��Ƿ��ػ���
	If GUICtrlGetState($Button1) = 144 Then ;����ֵ144˵���ǽ���״̬������ֵ80˵���ǿ���״̬��
		If $fenzhong >= 05 And $fenzhong < 60 Then ;��ʱ�ػ���������05�ֵ�59��֮��
			If (@HOUR = $xiaoshi And @MIN = $fenzhong - 5 And @SEC = 0) Then tishi("ϵͳ����5���Ӻ�ر�")
			If (@HOUR = $xiaoshi And @MIN = $fenzhong - 1 And @SEC = 0) Then tishi("ϵͳ����1���Ӻ�ر�")
		ElseIf $fenzhong >= 01 And $fenzhong < 05 Then ;��ʱ�ػ���������01�ֵ�04��֮��
			If (@HOUR = $xiaoshi - 1 And @MIN = $fenzhong + 55 And @SEC = 0) Then tishi("ϵͳ����5���Ӻ�ر�")
			If (@HOUR = $xiaoshi And @MIN = $fenzhong - 1 And @SEC = 0) Then tishi("ϵͳ����1���Ӻ�ر�")
		Else ;��ʱ�ػ�������Ϊ00
			If (@HOUR = $xiaoshi - 1 And @MIN = $fenzhong + 55 And @SEC = 0) Then tishi("ϵͳ����5���Ӻ�ر�")
			If (@HOUR = $xiaoshi - 1 And @MIN = $fenzhong + 59 And @SEC = 0) Then tishi("ϵͳ����1���Ӻ�ر�")
		EndIf
		;-------------------------------------------------------------�����ж��Ƿ��ػ���
		;-------------------------------------------------------------��ʼ�ж��Ƿ����Ҫ�ػ���
		If (@HOUR = $xiaoshi And @MIN = $fenzhong And @SEC = 0) Then
			$daojishi = MsgBox(1 + 262144, "��ʾ", "ϵͳ�����رա�ȷ����", 10)
			If $daojishi = 1 Or $daojishi = -1 Then Shutdown(1) ; �ж��Ƿ�ػ���
			If $daojishi = 2 Then
				GUICtrlSetState($hour, $GUI_ENABLE)
				GUICtrlSetState($min, $GUI_ENABLE)
				GUICtrlSetState($Button1, $GUI_ENABLE)
				GUICtrlSetState($Button2, $GUI_DISABLE)
			EndIf
		EndIf

	EndIf
	;-------------------------------------------------------------�����ж��Ƿ����Ҫ�ػ���
	;-------------------------------------------------------------������ʾ
	If GUICtrlRead($Radio1) = 1 Then ;������������
		If (@MIN = 0 And @SEC = 0) Then tishi(FileReadLine(@ScriptDir & "\traytip.dat", Random(1, _FileCountLines(@ScriptDir & "\traytip.dat"), 1))) ;��������
		If (@MIN = 1 And @SEC = 0) Then TrayTip("","",1) ;��������
		If @WDAY > 1 And @WDAY < 7 And (@HOUR = 16 And @MIN = 50 And @SEC = 0) And $shezhi_rizhi Then ;˵���ǹ�����,����־����
			ShellExecute("http://192.188.1.24/", "", "", "", @SW_MAXIMIZE)
			Sleep(1000)
		EndIf
	EndIf
	;-------------------------------------------------------------������ʾ
	;-------------------------------------------------------------��ʼ�ж��Ƿ��Ѿ������˿�������
	If FileExists(@StartupDir & "\ʱ�����.lnk") Then
		TrayItemSetState($kaijiyes, $TRAY_DISABLE)
		TrayItemSetState($kaijino, $TRAY_ENABLE)
	Else
		TrayItemSetState($kaijiyes, $TRAY_ENABLE)
		TrayItemSetState($kaijino, $TRAY_DISABLE)
	EndIf
	;-------------------------------------------------------------�����ж��Ƿ��Ѿ������˿�������
	If Not FileExists(@ScriptDir & "\traytip.dat") Then 
		InetGet("http://autoitzaoki.googlecode.com/svn/trunk/AutoitScript/%e5%ae%9a%e6%97%b6%e5%85%b3%e6%9c%ba/traytip.dat", @ScriptDir & "\traytip.dat", 0, 1) ; ���Σ����û������ļ�������������
	EndIf
	;-------------------------------------------------------------��ʼ�ж�GUI״̬
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			GUISetState(@SW_HIDE)
		Case $Button1
			If $xiaoshi > -1 And $xiaoshi < 24 And $fenzhong > -1 And $fenzhong < 60 And Floor($xiaoshi) = $xiaoshi And Floor($fenzhong) = $fenzhong Then
				GUICtrlSetData($hour, StringFormat("%02s", $xiaoshi))
				GUICtrlSetData($min, StringFormat("%02s", $fenzhong))
				GUICtrlSetData($min, StringFormat("%02s", $fenzhong)) ;�ı��������ֵ�λ����
				GUICtrlSetState($hour, $GUI_DISABLE)
				GUICtrlSetState($min, $GUI_DISABLE)
				GUICtrlSetState($Button1, $GUI_DISABLE)
				GUICtrlSetState($Button2, $GUI_ENABLE)
			Else
				MsgBox(0, "��ʾ", "��ʱ�ػ�ʱ���������")
			EndIf
		Case $Button2
			GUICtrlSetState($hour, $GUI_ENABLE)
			GUICtrlSetState($min, $GUI_ENABLE)
			GUICtrlSetState($Button1, $GUI_ENABLE)
			GUICtrlSetState($Button2, $GUI_DISABLE)
	EndSwitch
	;-------------------------------------------------------------�����ж�GUI״̬
	;-------------------------------------------------------------��ʼ��������
	$msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $kaijino
			FileDelete(@StartupDir & "\ʱ�����.lnk")
			TrayTip("��ʾ��","��ȡ������������",3000)
		Case $msg = $kaijiyes
			FileDelete(@StartupDir & "\ʱ�����.lnk") 
			FileCreateShortcut(@AutoItExe, @StartupDir & "\ʱ�����.lnk")
			TrayTip("��ʾ��","�����������óɹ���",3000)
		Case $msg = $jiaoshi
			duishi()
		Case $msg = $about
			tishi("����������zaoki" & @CRLF & "�汾�ţ�" & FileGetVersion(@ScriptFullPath))
		Case $msg = $homepage
			ShellExecute("http://blog.zaoki.com", "", "", "", @SW_MAXIMIZE)
		Case $msg = $exititem
			ExitLoop
		Case $msg = $TRAY_EVENT_PRIMARYDOUBLE
			GUISetState(@SW_SHOW, $Form1)
	EndSelect
	;-------------------------------------------------------------������������
WEnd ;-------------------------------------------------------------����ѭ��

Func tuichu() ;==>��ݼ����ú���
	;-------------------------------------------------------------ini�ļ�д�뿪ʼ
	IniWrite(@ScriptDir & "\" & "time.ini", "Ĭ�Ϲػ�ʱ��", "�ػ�Сʱ", $xiaoshi)
	IniWrite(@ScriptDir & "\" & "time.ini", "Ĭ�Ϲػ�ʱ��", "�ػ�����", $fenzhong)
	IniWrite(@ScriptDir & "\" & "time.ini", "��������", "����", GUICtrlRead($Radio1))
	IniWrite(@ScriptDir & "\" & "time.ini", "��������", "�����Զ�����ͬ��", $shezhi_tongbu)
	IniWrite(@ScriptDir & "\" & "time.ini", "��ʱ�ػ�", "����", GUICtrlRead($checkbox))
	IniWrite(@ScriptDir & "\" & "time.ini", "����־", "����", $shezhi_rizhi)
	If FileGetSize(@TempDir & "\traytip.dat") Then FileMove(@TempDir & "\traytip.dat",@ScriptDir & "\traytip.dat",1)
	;-------------------------------------------------------------ini�ļ�д�����
	Exit
EndFunc   ;==>tuichu

Func tishi($tishi) ;==>�������ú���
	Local $shezhi_title = "������" & _NowCalc()
	TrayTip($shezhi_title, $tishi, 10) ;
	Sleep(1000)
EndFunc   ;==>tishi

Func hello()
	_MyProExists() ;����Ƿ��ظ�����
	If IniRead(@ScriptDir & "\" & "time.ini", "��ʱ�ػ�", "����", "1") = 1 Then tishi("ʱ����������ص���������˫������򿪡�")
EndFunc   ;==>hello

Func duishi()
	$lanSHIJIAN = _INetGetSource('http://diancom.sinaapp.com/timedatabar.php')
	If $lanSHIJIAN <> "" Then
		If _DateIsValid($lanSHIJIAN) Then
			$lanSHIJIAN = StringSplit($lanSHIJIAN, " ", 1)
			If IsArray($lanSHIJIAN) Then
				If $lanSHIJIAN[1] <> _NowDate() Then
					RunWait(@ComSpec & " /c date " & $lanSHIJIAN[1], @ScriptDir, @SW_HIDE)
					TrayTip("ʱ�������������", "����ʱ��ͬ���ɹ���", 10)
				EndIf
				If StringLeft(_NowTime(), 5) <> StringLeft($lanSHIJIAN[2], 5) Then RunWait(@ComSpec & " /c time " & $lanSHIJIAN[2], @ScriptDir, @SW_HIDE)
			EndIf
		EndIf
	Else
		TrayTip("ʱ�������������", "��ȡ����ʱ��ʧ�ܣ�����������Ҫ�������磬��������������������Ƿ���ȷ��", 10)
	EndIf
EndFunc   ;==>duishi

Func _MyProExists()
	$my_Version = "ʱ�����_zaoki.com"
	If WinExists($my_Version) Then Exit
	AutoItWinSetTitle($my_Version)
EndFunc   ;==>_MyProExists
