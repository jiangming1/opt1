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
#include <Clipboard.au3>
#Include <ScreenCapture.au3>
;#include <ACN_HASH.au3>
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
for $i=28 to 50
	$mailname="qq2100803"&$i+$no&"@iigogo.com"
	$password=Random(100000,999999,1)
	$oie=_IECreate("https://passport.baidu.com/v2/?reg&regType=1&tpl=mn&u=http%3A%2F%2Fwww.baidu.com%2F")
	_IELoadWait($oie)
	$oIE.document.parentWindow.TANGRAM__PSP_4__form.account.value=$mailname
	$oIE.document.parentWindow.TANGRAM__PSP_4__form.password.value="jmdjsj903291AA"
	$oImg =_IEGetObjById($oie,"TANGRAM__PSP_4__verifyCodeImg")
;	WinMove("[ACTIVE]","",1000,0)
	Local $aPos = WinGetPos("[ACTIVE]")
	$picname = @ScriptDir & "\t" & @HOUR & @MIN & @SEC&".jpg"
	_ScreenCapture_Capture($picname, $aPos[0]+324,$aPos[1]+380, $aPos[0]+324+100,$aPos[1]+380+40)
	$ovalue=_IEGetObjById($oie,"verifyCode")
	$oIE.document.parentWindow.TANGRAM__PSP_4__form.verifyCode.focus()
send(imgshibie($picname))
	sleep(1000)
	$oIE.document.parentWindow.TANGRAM__PSP_4__form.TANGRAM__PSP_4__submit.click()
	sleep(1000)
	_IELoadWait($oie)
	ProcessClose ("iexplore.exe")
	;	_IEQuit($oie)
next
func imgshibie($imgpath11 )
$imgpath = StringReplace($imgpath11,"\","\\")
;MsgBox(0,0,$imgpath)
$getResult = DllCall($DLL,"long","uu_recognizeByCodeTypeAndPathW", "wstr", $imgpath , "long",1004,"wstr","")
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

