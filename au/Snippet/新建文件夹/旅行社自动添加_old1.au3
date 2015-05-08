#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <IE.au3>

_IEErrorHandlerRegister()

Local $oIE = _IECreateEmbedded()
GUICreate("Embedded Web control Test", 1000, 580, 0, 0, _
		$WS_OVERLAPPEDWINDOW + $WS_VISIBLE + $WS_CLIPSIBLINGS + $WS_CLIPCHILDREN)
GUICtrlCreateObj($oIE, 0, 40, 1000, 560)
Local $GUI_Button_Back = GUICtrlCreateButton("Back", 10, 420, 100, 30)
Local $GUI_Button_Forward = GUICtrlCreateButton("Forward", 120, 420, 100, 30)
Local $GUI_Button_Home = GUICtrlCreateButton("Home", 230, 420, 100, 30)
Local $GUI_Button_Stop = GUICtrlCreateButton("Stop", 340, 420, 100, 30)
GUISetState() ;Show GUI
_IENavigate($oIE, "https://login.taobao.com/member/login.jhtml")
_IELoadWait($oIE)
$ouname = _IEGetObjById($oIE, "TPL_username_1")
$ouname.value = "webtv100"
$ouname = _IEGetObjById($oIE, "TPL_password_1")
$ouname.value = "0.0329"
$ouname = _IEGetObjById($oIE, "J_SubmitStatic")
$ouname.click
Sleep(1500)
_IELoadWait($oIE)

Local $file = FileOpen("D:\΢������\2100803\1��������ϵ�绰.txt", 0)
If $file = -1 Then
	MsgBox(0, "Error", "Unable to open file.")
	Exit
EndIf
	_IENavigate($oIE, "http://s.taobao.com/search?q=ũ����԰")
	_IELoadWait($oIE)
$sMyString ="�ຼ���ũ����԰��Ʊ/ũ����԰2��1С����Ʊ ������Ʊ �꿨"
$oLinks = _IELinkGetCollection($oIE)
For $oLink in $oLinks
    $sLinkText = _IEPropertyGet($oLink, "innerText")
    If StringInStr($sLinkText, $sMyString) Then
		$oLink.target="_self"
        _IEAction($oLink, "click")
        ExitLoop
    EndIf
Next
	_IELoadWait($oIE)
	Sleep(1500)
	;����Ʊ
$sMyString ="����Ʊ"
$oLinks = _IELinkGetCollection($oIE)
For $oLink in $oLinks
    $sLinkText = _IEPropertyGet($oLink, "innerText")
    If StringInStr($sLinkText, $sMyString) Then
		$oLink.target="_self"
        _IEAction($oLink, "click")
        ExitLoop
    EndIf
Next
Sleep(1000)
$sMyString ="��������"
$oLinks = _IELinkGetCollection($oIE)
For $oLink in $oLinks
    $sLinkText = _IEPropertyGet($oLink, "innerText")
    If StringInStr($sLinkText, $sMyString) Then
		$oLink.target="_self"
        _IEAction($oLink, "click")
        ExitLoop
    EndIf
Next
	_IELoadWait($oIE)
	Sleep(1500)
$oForm = _IEFormGetObjByName ($oIE, "ExampleForm")
;	$ouname.click
MsgBox��0,"","")
;����id J_PayAnother
;����id R_PT_Agent
;	_IELoadWait($oIE)
;990501mm@163.com
;��֤��F-captcha
;apply-form
While 1
	Local $msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			ExitLoop
		Case $msg = $GUI_Button_Home
			_IENavigate($oIE, "http://e.jd.com/30083135.html")
			Sleep(10000)
			_IENavigate($oIE, "lebk://Bought/")
		Case $msg = $GUI_Button_Back
			_IEAction($oIE, "back")
		Case $msg = $GUI_Button_Forward
			_IEAction($oIE, "forward")
		Case $msg = $GUI_Button_Stop
			_IEAction($oIE, "stop")
	EndSelect
WEnd

GUIDelete()

Exit