#Include <Date.au3>
#include <IE.au3>
$file = FileOpen("Я�̾Ƶ�����.txt", 1)
While 1
$oIE = _IEAttach ("http://hotels.ctrip.com/Domestic/ShowHotelInformation.aspx", "url")
If $oie <> 0 Then
_IELoadWait ($oIE)
$oo = _IEGetObjByName ($oIE,"ctl00_MainContentPlaceHolder_spanTelephone")
$s=$oo.outerHTML
If StringInStr($s, '���棺')>0 Then 
$afax = StringSplit($s, '���棺',1)
$afax = StringSplit($afax[2] , '"',1)
$sfax =$afax[1]
$atel = StringSplit($s, '�绰��',1)
$atel = StringSplit($atel[2] , "<",1)
$stel =$atel[1]

;MsgBox(0,$sfax,$stel)
$oo = _IEGetObjByName ($oIE,"ctl00_MainContentPlaceHolder_h3id")
$sname=$oo.innerText

FileWriteLine($file,$sname&","&$sfax&","&$stel&@CRLF)
EndIf

_IEQuit ($oIE)

EndIf
Sleep(500)
WEnd