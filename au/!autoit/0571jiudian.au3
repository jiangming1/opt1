#Include <Date.au3>
#include <IE.au3>
;#include <FTPEx.au3>  
;#include <SQLite.au3>  
;#include <SQLite.dll.au3>  

   ;_SQLite_Startup()
   ;_SQLite_Open("d:\17u0574hotel.db")
   ;_SQLite_Exec(-1,"Create table d (lvxingshe,dianhua,chuanzhen,lianxiren);")
$file = FileOpen("d:\17u0571allhotel.csv", 1)
FileWriteLine($file,"��,��,סլ�绰,סլ����"&@CRLF)
ShellExecute ("iexplore.exe", "about:blank")
WinWait ("about:blank")
$oIE = _IEAttach ("about:blank", "url")
_IELoadWait ($oIE)
$opages=1
For $page=1 To 104
_IENavigate ($oIE, "http://www.17u.net/qybl/list_31_0_2_0_2_"&$page&".html")

_IELoadWait($oIE)
$oas = $oIE.document.getElementsBytagName("ul")
For $oa In $oas
	If StringInStr($oa.className,'com_member')=1 Then
$stext=$oa.innerText
$atexts = StringSplit($stext, Chr(10))
For $stext In $atexts
	If StringLen($stext)>20 Then
$aname = StringSplit($stext, '��',1)
$sname=$aname[1]
$atel = StringSplit($stext, '����',1)
$atel = StringSplit($atel[2] , '��',1)
$stel=$atel[1]
$atel = StringSplit($stext, '�棺',1)
$atel = StringSplit($atel[2] , '��',1)
$sfax=$atel[1]
$aman = StringSplit($stext, '��ϵ�ˣ�',1)
$aman = StringSplit($aman[2], ' ',1)
$sman = $aman[1]
;MsgBox(4096, $stel, "Insert into d (lvxingshe,dianhua,chuanzhen,lianxiren) values ('"&$sname&'","'&$stel&","&$sfax&","&$sman&"');", 10)
;_SQLite_Exec(-1, "Insert into d (lvxingshe,dianhua,chuanzhen,lianxiren) values ('"&$sname&"','"&$stel&"','"&$sfax&"','"&$sman&"');")  
FileWriteLine($file,$sname&","&$sman&","&$stel&","&$sfax&@CRLF)
EndIf
Next
     EndIf
Next
Next