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
for $i=0 to 50
	$mailname="qq2100803"&$i+$no
	$password=Random(100000,999999,1)
	$oie=_IECreate("http://zc.qq.com/chs/index.html?from=pt")
	_IELoadWait($oie)
	$vname=_IEGetObjById ($oie,"nick")

	$vname.value=$mailname
	$vname.focus()
	$vname=_IEGetObjById ($oie,"password")

	$vname.value="jmdjsj903291AA"
	$vname.focus()

	$vname=_IEGetObjById ($oie,"year_value")
	$vname.value=1982
;	$vname.focus()
	$vname=_IEGetObjById ($oie,"month_value")
	$vname.value=1
;	$vname.focus()
	$vname=_IEGetObjById ($oie,"day_value")
	$vname.value=1
	$vname=_IEGetObjById ($oie,"password_again")
	$vname.value="jmdjsj903291AA"
	$vname.focus()
	$vname=_IEGetObjById ($oie,"code")
	$vname.focus()
	sleep(1555)

	Local $aPos = WinGetPos("[ACTIVE]")
	$picname = @ScriptDir & "\t" & @HOUR & @MIN & @SEC&".jpg"
	_ScreenCapture_Capture($picname, $aPos[0]+643,$aPos[1]+538, $aPos[0]+643+127,$aPos[1]+538+55)
	$vname.value=imgshibie($picname)
	$vname=_IEGetObjById ($oie,"submit")
	$vname.click()
	_IELoadWait($oie)
		$vname=_IEGetObjById ($oie,"defaultUin")
msgbox(0,0,$vname.innertext)
;	WinMove("[ACTIVE]","",1000,0)
exit
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

