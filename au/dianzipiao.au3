#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <WINAPI.au3>
#include <IE.au3>
#include <Word.au3>
$Step = 0
$smob = 0
$chengren = 0
$xiaohai = 0
Func _GetNICInfo($n)
	$strComputer = "."
	$objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\cimv2")
	$colItems = $objWMIService.ExecQuery("Select * From Win32_NetworkAdapterConfiguration Where IPEnabled = True")
	For $objItem In $colItems
		If StringLeft($objItem.MACAddress, 2) = 00 Then
			$MACAdress = $objItem.MACAddress
			$Key = StringMid($objItem.Caption, 6, 4)
			$DriverDesc = $objItem.Description
		EndIf
	Next
	Switch $n
		Case 1
			Return $MACAdress
		Case 2
			Return $Key
		Case 3
			Return $DriverDesc
	EndSwitch
EndFunc   ;==>_GetNICInfo


	$guicontrol = GUICreate("ControlGUI", 800, 600, 0, 0,$WS_POPUP)
	$Pic1 = GUICtrlCreatePic(StringReplace(_GetNICInfo(1),":","")&".jpg", 0, 0, 800, 600)
	$Input1 = GUICtrlCreateInput("", 120, 72, 518, 54)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
$pingbtn = GUICtrlCreateButton("��óͨ����", 304, 560, 150, 25)
	GUISetState()
_IEErrorHandlerRegister()
Local $oIE = _IECreateEmbedded()
Local $oIE1 = _IECreateEmbedded()
	$gui = GUICreate("trans",800, 600, 0, 0,$WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_TOPMOST) )
$Timer = DllCallbackRegister("Timer", "int", "hwnd;uint;uint;dword")
$TimerDLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 1000, "ptr", DllCallbackGetPtr($Timer))
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateObj($oIE, 1000, 0, 1000, 560)
GUICtrlCreateObj($oIE1, 1000, 0, 1000, 560)

$Button1 = GUICtrlCreateButton("��Ʊ", 304, 472, 150, 75)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
$Button2 = GUICtrlCreateButton("", 120, 128, 150, 75)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
$Button3 = GUICtrlCreateButton("", 304, 128, 150, 75)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
$Button4 = GUICtrlCreateButton("", 488, 128, 150, 75)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
$Button5 = GUICtrlCreateButton("", 120, 232, 150, 75)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
$Button6 = GUICtrlCreateButton("", 304, 232, 150, 75)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
$Button7 = GUICtrlCreateButton("", 488, 232, 150, 75)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
$Button8 = GUICtrlCreateButton("", 120, 352, 150, 75)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
$Button9 = GUICtrlCreateButton("", 304, 352, 150, 75)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
$Button10 = GUICtrlCreateButton("", 488, 352, 150, 75)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")

$Button11 = GUICtrlCreateButton("", 488, 472, 150, 75)
;$Label1 = GUICtrlCreateLabel("Label1", 336, 16, 123, 50)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
$Button12 = GUICtrlCreateButton("", 120, 472, 150, 75)

GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")

	GUISetBkColor(0xABCDEF)
	_WinAPI_SetLayeredWindowAttributes($gui, 0x010101)
	_WinAPI_SetLayeredWindowAttributes($gui, 0xABCDEF, 20)
	
	GUISetState()
	

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			;			Exit

		Case $Button1
			bchupiao(GUICtrlRead($Input1))
		Case $Button2
			GUICtrlSetData($Input1, GUICtrlRead($Input1) & "1")
		Case $Button3
			GUICtrlSetData($Input1, GUICtrlRead($Input1) & "2")
		Case $Button4
			GUICtrlSetData($Input1, GUICtrlRead($Input1) & "3")
		Case $Button5
			GUICtrlSetData($Input1, GUICtrlRead($Input1) & "4")
		Case $Button6
			GUICtrlSetData($Input1, GUICtrlRead($Input1) & "5")
		Case $Button7
			GUICtrlSetData($Input1, GUICtrlRead($Input1) & "6")
		Case $Button8
			GUICtrlSetData($Input1, GUICtrlRead($Input1) & "7")
		Case $Button9
			GUICtrlSetData($Input1, GUICtrlRead($Input1) & "8")
		Case $Button10
			GUICtrlSetData($Input1, GUICtrlRead($Input1) & "9")
		Case $Button11
			$a1 = GUICtrlRead($Input1)
			$a1 = StringLeft($a1, StringLen($a1) - 1)
			GUICtrlSetData($Input1, $a1)
		Case $Button12
			GUICtrlSetData($Input1, GUICtrlRead($Input1) & "0")


	EndSwitch
WEnd
Func bchupiao($code)
	If $code = "8556440385564403" Then Exit
	If $code = "903291903291" Then
		Run("shutdown -s -t 1")
		Exit
	EndIf

	Select
		Case $Step = 2
			$chengren = $code
			$Step =3
			GUICtrlSetData($Input1, "���Σ������Ŷ�С������")
			Sleep(1000)
			GUICtrlSetData($Input1, "")



		Case $Step = 3
			MsgBox(0,"","")
			$xiaohai = $code
			_IENavigate($oIE, "http://www.716580.com/b2b/ETicketChecking.aspx?method=check&Tel=" & $smob & "&scr=" & $chengren & "&sxh=" & $xiaohai & "&mac=" & _GetNICInfo(1) & "&r=" & Random(9999))
			_IELoadWait($oIE)
			$sText = _IEBodyReadText($oIE)
			If StringLen($sText) < 6 Then
				GUICtrlSetData($Input1, "�������ܴ��ڳ��ŵ�����������������")
				Sleep(1000)
				GUICtrlSetData($Input1, "")
				$Step =2
			Else
				GUICtrlSetData($Input1, "Ʊ��֤�ɹ������ڴ�ӡ���Ժ�")
				$oWordApp = _WordCreate(@ScriptDir & "\Test.doc", 0, 0)
				$oDoc = _WordDocGetCollection($oWordApp, 0)
				$oDoc.Range.Text = StringReplace($sText, ",", @LF); "��������������������������������������������������������"&@LF&"    Ʊ:"&$code&"��"
				_WordDocPrint($oDoc)
				_WordQuit($oWordApp, 0)
				Sleep(5000)
				GUICtrlSetData($Input1, "")
				$Step = 0
			EndIf
		Case $Step = 0
			If StringLen($code) < 7 Then
				GUICtrlSetData($Input1, "Ʊ��֤ʧ�ܣ�����������")
				Sleep(1000)
				GUICtrlSetData($Input1, "")
			else
				_IENavigate($oIE1, "http://www.716580.com/b2b/ETicketChecking.aspx?method=getType&Tel=" & $code & "&mac=" & _GetNICInfo(1) & "&r=" & Random(9999))
				_IELoadWait($oIE1)
				$stype = _IEBodyReadText($oIE1)
				If $stype = "ɢ��" Then
					_IENavigate($oIE, "http://www.716580.com/b2b/ETicketChecking.aspx?method=check&Tel=" & $code & "&mac=" & _GetNICInfo(1) & "&r=" & Random(9999))
					_IELoadWait($oIE)	
					$sText = _IEBodyReadText($oIE)

					If StringLen($sText) < 2 Then
						GUICtrlSetData($Input1, "Ʊ��֤ʧ�ܣ�����������")
						Sleep(1000)
						GUICtrlSetData($Input1, "")
					Else
						GUICtrlSetData($Input1, "Ʊ��֤�ɹ������ڴ�ӡ���Ժ�")
						$oWordApp = _WordCreate(@ScriptDir & "\Test.doc", 0, 0)
						$oDoc = _WordDocGetCollection($oWordApp, 0)
						$oDoc.Range.Text = StringReplace($sText, ",", @LF)
				;		$oDoc.Range.Text = "aaaaa"
						_WordDocPrint($oDoc)
						_WordQuit($oWordApp, 0)
						Sleep(5000)
						GUICtrlSetData($Input1, "")
					EndIf
				else
					$smob = $code
					GUICtrlSetData($Input1, "���Σ������Ŷӳ�����")
					Sleep(1000)
					GUICtrlSetData($Input1, "")
					$Step = 2
				EndIf
			endif
				;		GUICtrlSetData($Input1, "Ʊ��֤ʧ�ܣ�����������")
				;		Sleep(3000)
				;		GUICtrlSetData($Input1, "")

				;_OpenFilePrint("dzppringt.txt")


;				_IENavigate($oIE, "http://ma.taobao.com/consume/code.htm?spm=0.0.0.0.OLyq97")
;				_IELoadWait($oIE)
;				$ouname = _IEGetObjById($oIE, "J_MaCodeDetail")
;				$ouname.value = $code
;				While 1
;					;MouseClick("left", 300, 300)
;					$ouname = _IEGetObjById($oIE, "J_MaCodeDetail")
;					$ouname.focus()
;					Send("{tab}")
;					Sleep(1000)
;					$ouname = _IEGetObjById($oIE, "J_SearchSubmit")
;					$ouname.click
					;	Send("{tab}{enter}")
;					Sleep(1000)
;					$oDoc = _IEDocGetObj($oIE)
					;J_SpinBox ��������
					;J_ConfirmConsume ȷ�Ϻ���
;					$sText = _IEBodyReadText($oIE)
;					If StringInStr($sText, "���ֻ�ܺ���") Then
;						MsgBox(0, "��֤�ɹ�", "")
;						ExitLoop
;					EndIf
;					If StringInStr($sText, "�ף�������ĵ���ƾ֤�����ڸö�������˶Զ������ݣ�") Or StringInStr($sText, "�ף�����ƾ֤�Ѿ�ʹ���꣬����ϵ�������¹���") Or StringInStr($sText, "�ף�������ĵ���ƾ֤�����ã���˶Զ������ݣ� ") Then
;						MsgBox(0, "Ʊ��֤ʧ��", "")
;						Exit
;					EndIf
;				WEnd

;				$ouname = _IEGetObjById($oIE, "J_SpinBox")
;				$ouname.value = "1"

;				$ouname = _IEGetObjById($oIE, "J_ConfirmConsume")
;				$ouname.click
;				GUICtrlSetData($Input1, "Ʊ��֤�ɹ������ڴ�ӡ���Ժ�")
;				$oWordApp = _WordCreate(@ScriptDir & "\Test.doc", 0, 0)
;				$oDoc = _WordDocGetCollection($oWordApp, 0)
	;			$oDoc.Range.Text = "��óͨ����Ʊ" & @CRLF _
;						 & "ȡƱ��֤�룺" & $code & @CRLF _
;						 & "����" & @MON & "��" & @MDAY & "��ǰʹ����Ч"
;				_WordDocPrint($oDoc)
;				_WordQuit($oWordApp, 0)
;				Sleep(5000)
;				GUICtrlSetData($Input1, "")

	EndSelect
EndFunc   ;==>bchupiao


Func Timer($hWnd, $uiMsg, $idEvent, $dwTime)
        If $idEvent = $TimerDLL[0] Then
			$var = Ping("www.baidu.com",250)
			If $var Then; ������:  If @error = 0 Then ...
						If $var<300 Then 
                GUICtrlSetData($pingbtn,"���ٺ�"&_GetNICInfo(1) )
				Else
				GUICtrlSetData($pingbtn,"���ٿ�"&$var )
				endIf
Else
                GUICtrlSetData($pingbtn,"������"&_GetNICInfo(1))
EndIf


        EndIf
EndFunc