#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         jm

 Script Function:
	�ύ���������

#ce ----------------------------------------------------------------------------
#include <MsgBoxConstants.au3>

; Script Start - Add your code below here

#include <IE.au3>
#include <MsgBoxConstants.au3>
;Local $aArray = FileReadToArray("�Զ�����.txt")
;Local $aArray1 = FileReadToArray("xdown�Զ�����url.txt")
For $i = 17 To 17; Loop through the array.
Global $oIE = _IEcreate("http://open.soft.360.cn/softsubmit.htm")
_IELoadWait($oie)
sleep(2000)
send("{tab 16}{enter}")
sleep(1000)



$b=""
;$b=$b& @CRLF &IniRead(@ScriptDir &"\�ٶ��ύ���.ini", "Genera"&$i, "softName", "AutoIt")
;$b=$b& @CRLF &"��С��50000KB"
;$b=$b& @CRLF &"���ԣ�����"
;$b=$b& @CRLF &"�汾��5.21��Ѱ�"
;$b=$b& @CRLF &"����ƽ̨   winxp/win7/win8"
;$b=$b& @CRLF &"��˾��վ   www.gjprj.cn"
;$b=$b& @CRLF &"���ص�ַ   "&IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'down_url', '')
;$b=$b& @CRLF &"������ַ   http://www.gjprj.cn/down/"&IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'snap_1', '')&"1.png"
;$b=$b& @CRLF &"������ַ   http://www.gjprj.cn/down/"&IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'snap_1', '')&"2.png"
;$b=$b& @CRLF &"������ַ   http://www.gjprj.cn/down/"&IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'snap_1', '')&"3.png"
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc1', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc2', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc3', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc4', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc5', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc6', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc7', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc8', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc9', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc10', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc11', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc12', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc13', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc14', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc15', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc16', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc17', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc18', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc19', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc20', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc21', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc22', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc23', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc24', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc25', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc26', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc27', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc28', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc29', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc30', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc31', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc32', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc33', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc34', '')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc35', '')
$oIE.document.parentWindow.form1.name.value=IniRead(@ScriptDir &"\�ٶ��ύ���.ini", "Genera"&$i, "softName", "")
$oIE.document.parentWindow.form1.feature.value=$b
run("c:\upload.exe gjplogo72.png")
$oIE.document.parentWindow.form1.snapshot.click()

$oIE.document.parentWindow.form1.version.value="6.18"
;$oIE.document.parentWindow.form1.logo.value="gjplogo72.png"
$oIE.document.parentWindow.form1.download.value=IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'down_url', '')
$oIE.document.parentWindow.form1.image.value="http://www.gjprj.cn/down/"&IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'snap_1', '')&"1.png"

$oIE.document.parentWindow.form1.cateName.value="��ҵ���"

$o= _IEGetObjById($oIE, "up_snapshot2")
$o.click()
$o= _IEGetObjById($oIE, "EnvWin1")
$o.click()
$o= _IEGetObjById($oIE, "EnvWin0")
$o.click()
$o= _IEGetObjById($oIE, "up_logo")
$o.click()
run("c:\upload.exe "&IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'snap_1', '')&"4.jpg")
$oIE.document.parentWindow.form1.snapshot2.click()



;newfeature


;img_file_1
;xhe0_iframe
;_IEQuit($oie)
Next
