#Include <Date.au3>
#include <IE.au3>
#include <FTPEx.au3>  
#include <SQLite.au3>  
#include <SQLite.dll.au3>  
$s="��׼Ӫ����80�һ����ؽ������ܣ�����2011��12��30���ں����ɵ����ɾƵ���л��顣�����700Ԫ"
$s=$s&"������ֹ16��.������ַhttp://www.716580.com/2012/sign.asp����������ַhttp://www.716580.com/2012/company.asp"
$s=$s&"���ݴ��� �Ž��� ������ �������� ��� ��������� ����� ����Ȫ �й����������� �²���"
ClipPut ($s)
ShellExecute ("iexplore.exe", "about:blank","","", @SW_HIDE)
;ShellExecute ("iexplore.exe", "about:blank")
WinWait ("about:blank")
$oIE1 = _IEAttach ("about:blank", "url")
_IENavigate ($oIE1, "http://baidu.com")
_IELoadWait($oIE1)
ShellExecute ("iexplore.exe", "about:blank","","", @SW_HIDE)
WinWait ("about:blank")
$oIE = _IEAttach ("about:blank", "url")
_IELoadWait ($oIE)
$opages=1
For $page=10 To 5
	MsgBox(0,"","ok")
_IENavigate ($oIE, "http://www.17u.net/qybl/list_31_383_2_0_1_"&$page&".html")
_IELoadWait($oIE)
$oas = $oIE.document.getElementsBytagName("ul")
For $oa In $oas
	If StringInStr($oa.className,'com_member')=1 Then
$stext=$oa.innerhtml
$soldlink="a"
$oa1s =$oa.getElementsBytagName("a")
For $oa1 In $oa1s
	If StringInStr($oa1.href,"http://www.17u.net/mytongcheng/memberinfo")>0 And $soldlink<>$oa1.href  Then
;    MsgBox(0,"",$oa1.href)
	$soldlink=$oa1.href
    _IENavigate ($oIE1, $oa1.href)
	_IELoadWait($oIE1)
	$oa2s = $oIE1.document.getElementsBytagName("a")
	For $oa2 In $oa2s
	 If StringInStr($oa2.href,"tencent://message/?uin=")>0 Then
     ShellExecute ($oa2.href)
 	 EndIf
	Next
	EndIf
Next
     EndIf
Next
Next
_IEQuit ($oIE)
_IEQuit ($oIE1)
;tencent://message/?uin=1256144772&Site=www.17u.net&Menu=yes
;tencent://message/?uin=79774074&amp;Site=www.17u.net&amp;Menu=yes
