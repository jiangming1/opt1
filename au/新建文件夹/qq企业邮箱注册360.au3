; Script Start - Add your code below here
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         jim

 Script Function:
	�ٶ�֪����ע����

#ce ----------------------------------------------------------------------------
;696
; Script Start - Add your code below here
#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <IE.au3>
#include <File.au3>

#include <ACN_HASH.au3>
#PRE_UseX64=n
$softid = IniRead("para.ini","set","softId","-1")		;���ID�����޸�para.ini�ļ���Ӧ����
$softKey  = IniRead("para.ini","set","softKey","-1")	;���KEY�����޸�para.ini�ļ���Ӧ����
$softcrcKey  = IniRead("para.ini","set","softcrcKey","-1")	;���KEY�����޸�para.ini�ļ���Ӧ����
$user  = IniRead("para.ini","set","user","-1")			;�û��������޸�para.ini�ļ���Ӧ����
$pwd  = IniRead("para.ini","set","pwd","-1")			;���룬���޸�para.ini�ļ���Ӧ����
$DLL = DllOpen("UUWiseHelper.dll")
DllCall($DLL,"none","uu_setSoftInfoW","long",$softid,"wstr",$softKey)
$result = DllCall($DLL,"long","uu_loginW", "wstr",$user , "wstr",$pwd)
If IsArray($result) Then
	If $result[0]>0 Then
		ConsoleWrite("��¼�ɹ�" & $result[0] & @CRLF);��¼�ɹ�
;		MsgBox(4096,"�ɹ�","��½�ɹ�")
	Else
		ConsoleWrite("��¼ʧ��" & $result[0] & @CRLF);��¼�ɹ�
;		MsgBox(4096,"����","��¼ʧ��,�����룺" & $result[0])
		Exit
	EndIf
Else
;	MsgBox(4096,"����","ʧ��" )
	Exit
EndIf
$no=0
$zhidaowentis = FileReadToArray("֪�������.txt")
Local $mailname[199]
for $i=100 to 200
	$mailname="qq2100803"&$i+$no&"@iigogo.com"
	$password=Random(100000,999999,1)
	$oie=_IECreate("http://i.360.cn/reg?src=pcw_so&destUrl=http%3A%2F%2Fwww.so.com%2F###")
	_IELoadWait($oie)
	Sleep(2000)
	_IELinkClickByText ($oie, "����ע��" )
	$oImg =_IEGetObjById($oie,"wm")
	Sleep(1000)
	$oPic = $oIE.Document.body.createControlRange()
	$oPic.Add($oImg)
	$oPic.execCommand("Copy")
	$bmp = ClipGet()
	$picname = @ScriptDir & "\t" & @HOUR & @MIN & @SEC&".jpg"
	FileCopy($bmp, $picname)
	$oIE.document.parentWindow.qucpspregForm.account.value=$mailname
	$oIE.document.parentWindow.qucpspregForm.nickName.value="qq"&$password
	$ovalue=_IEGetObjById($oie,"password")
	$ovalue.value="903291"
	$ovalue=_IEGetObjById($oie,"repassword")
	$ovalue.value="903291"
	$ovalue=_IEGetObjById($oie,"captcha")

	;MsgBox(0,0,$codeno)
	$ovalue.value=imgshibie($picname)
	$ovalue=_IEGetObjById($oie,"regSubmitBtn")
	Sleep(3000)
	$ovalue.click();	_IEQuit($oie)
next
func imgshibie($imgpath11 )
$imgpath = StringReplace($imgpath11,"\","\\")
;MsgBox(0,0,$imgpath)
$getResult = DllCall($DLL,"long","uu_recognizeByCodeTypeAndPathW", "wstr", $imgpath , "long",1005,"wstr","")
$string = StringSplit($getResult[3],"_",1)
If @error = 1 Then
	MsgBox(4096,"δ���ַָ��,����2����˳�","",2)
	Exit
ElseIf $string[1]=="" Or $string[2]=="" Then
	MsgBox(4096,"�����ַ�������or������֤�����,����2����˳�","",2)
	Exit
EndIf
;$md5key = _md5key()
;If $string[1]==$md5key Then
	return $string[2]
;	MsgBox(4096,"�ɹ�","ʶ��ͼƬ["&  $string[2]& "]")

EndFunc




;_FileWriteFromArray ( "BizmailGroup_Export.csv", $mailname)

