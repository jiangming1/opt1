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
_SetIEProxy()
$oie=_IECreate("")
$asks=readask()
	for $i=1 to $asks[0]
	   $oie=_IECreate("")
	    _SetIEProxy('')
		$ask1s=StringSplit($asks[$i], ";;",1)
		$question=$ask1s[2]
		$answer=$ask1s[3]
		sogoulogin("2100803","opewoq")
		$url=sogouask($question)
		ProcessClose ("iexplore.exe")
		 _SetIEProxy('sock=127.0.0.1:1080')
		$oie=_IECreate("")
		sogoulogin("2851167808","gjpGJP123")
		answer($answer,$url)
		Sleep(3000)
		ProcessClose ("iexplore.exe")
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

func sogoulogin($n,$p)
	$oie1=_IECreate("http://xui.ptlogin2.qq.com/cgi-bin/xlogin?link_target=blank&target=blank&appid=6000201&daid=220&hide_uin_tip=1&style=20&hide_close_icon=0&target=parent&hide_close_icon=1&s_url=http%3A%2F%2Fwenwen.sogou.com%2Fz%2FLLogin.e%3Fsp%3D307%26sp%3DX%26sp%3D1008%26sp%3DX%26sp%3D0")

	_IELoadWait($oie1)

	$vname=_IEGetObjById ($oie1,"u")
	$vname.value=$n
	$vname.focus()
	$vname=_IEGetObjById ($oie1,"p")
	$vname.value=$p
	$vname.focus()
	$vname=_IEGetObjById ($oie1,"login_button")
	Sleep(1000)
	$vname.click()
	Sleep(1000)
	EndFunc
Func sogouask($question)
	$oie=_IECreate("http://wenwen.sogou.com/z/AskNew.e?sp=S&sp=1008")
		WinMove("[ACTIVE]", "", 0, 0, 1117,741,1)
	_IELoadWait($oie)
	Sleep(1000)
	$vname=_IEGetObjById ($oie,"questionWrap")
	$vname.focus()
	$vname.value=$question
	$vname=_IEGetObjById ($oie,"submitButton")
	$vname.click()
	Sleep(1000)
	_IELinkClickByText($oie,"ѡ�����")
	sleep(1000)
	_IELoadWait($oie)
	Local $aPos = WinGetPos("[ACTIVE]")
	;MsgBox(0,$aPos[0]+528,$aPos[1]+298)
	MouseClick("left",$aPos[0]+528,$aPos[1]+298,10)
	sleep(1000)
	MouseClick("left",$aPos[0]+620,$aPos[1]+574,10)
	$vname=_IEGetObjById ($oie,"submitButton")
	$vname.click()
    _IELoadWait($oie)
	Sleep(25000)

	$url88=_IEPropertyGet($oIE,"locationurl")
   MsgBox(0,0,$url88)
    $R=StringRegExp($url88,'\d+',3)
	$url11=$R[0]
   MsgBox(0,$url11,0)
	Local $hFileOpen = FileOpen(@ScriptName&".txt", $FO_APPEND)
	FileWriteLine($hFileOpen,"http://wenwen.sogou.com/z/q"&$url11&".htm")
	FileClose($hFileOpen)
	return $url11
	EndFunc
func readask()
	_IENavigate($oie,"http://www.caiwuhao.com/s1")
	_IELoadWait($oie)
$keyword=StringSplit($oie.document.title, ";;;",1)
return $keyword
EndFunc

func answer($answer,$url)
	$oie=_IECreate("http://wenwen.sogou.com/z/q"&$url&".htm")
	_IELoadWait($oie)
	$oFrame2 = _IEFrameGetCollection($oie, 0)
	_IEPropertySet($oFrame2, "innertext", $answer)
	sleep(15000)
		$vname=_IEGetObjById ($oie,"answerSubmit")
	$vname.click()
 EndFunc


Func _SetIEProxy($DLIP = "")
	If $DLIP > "" Then
	      Run("plink -N root@www.caiwuhao.com -pw jmdjsj903291A -D 127.0.0.1:1080")
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyEnable", "REG_DWORD", 0x00000001);��������
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyServer", "REG_SZ", $DLIP)
	Else
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyEnable", "REG_DWORD", 0x00000000);�رմ���
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyServer", "REG_SZ", "")
	EndIf
	DllCall("wininet.dll", "uint", "InternetSetOption", "ptr", 0, "dword", 39, "ptr", 0, "dword", 0);INTERNET_OPTION_SETTINGS_CHANGED
	DllCall('wininet.dll', 'uint', 'InternetSetOption', 'ptr', 0, 'dword', 37, 'ptr', 0, 'dword', 0) ; INTERNET_OPTION_REFRESH
EndFunc
