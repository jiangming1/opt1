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
For $i = 4 To 19; Loop through the array.

   Local $oIE = _IECreate("http://weishi.baidu.com/submission/company.html")
   _IELoadWait( $oIE)
   Local $ovalue= _IEGetObjById($oIE, "company")
   $ovalue.value="���ݹܼ��������˾"
   Local $ovalue= _IEGetObjById($oIE, "mobile")
   $ovalue.value=13858101782
   Local $ovalue= _IEGetObjById($oIE, "url")
   $ovalue.value="www.hzgjp.cn"
   Local $ovalue= _IEGetObjById($oIE, "email")
   $ovalue.value='2851167808@qq.com'
   Local $ovalue= _IEGetObjById($oIE, "step_submit")
   $ovalue.submit()

      _IELoadWait( $oIE)
Local $ovalue= _IEGetObjById($oIE, "softName")

$ovalue.value=IniRead(@ScriptDir &"\�ٶ��ύ���.ini", "Genera"&$i, "softName", "AutoIt")
Local $ovalue= _IEGetObjById($oIE, "version")
$ovalue.value=IniRead(@ScriptDir &"\�ٶ��ύ���.ini", 'Genera'&$i, 'version', '-1')
Local $ovalue= _IEGetObjById($oIE, "soft_desc")
$b=IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc1', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc2', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc3', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc4', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc5', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc6', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc7', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc8', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc9', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc10', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc11', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc12', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc13', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc14', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc15', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc16', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc17', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc18', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc19', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc20', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc21', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc22', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc23', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc24', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc25', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc26', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc27', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc28', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc29', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc30', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc31', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc32', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc33', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc34', '-1')
$b=$b&@CR& IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'soft_desc35', '-1')

$ovalue.value=$b
Local $ovalue= _IEGetObjById($oIE, "home_url")
$ovalue.value=IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'home_url', '-1')
Local $ovalue= _IEGetObjById($oIE, "down_url")
$ovalue.value=IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'down_url', '-1')
Local $oSelect= _IEGetObjByid($oIE, "units_1")
$oSelect.click()
Local $oSelect= _IEGetObjByid($oIE, "system_1")
$oSelect.click()
Local $oSelect= _IEGetObjByid($oIE, "system_2")
$oSelect.click()
Local $oSelect= _IEGetObjByid($oIE, "system_3")
$oSelect.click()
Local $oSelect= _IEGetObjByid($oIE, "system_4")
$oSelect.click()
Local $oSelect= _IEGetObjByid($oIE, "system_5")
$oSelect.click
Local $oSelect= _IEGetObjByid($oIE, "system_6")
$oSelect.click
Local $ovalue= _IEGetObjById($oIE, "snap_1")
run("c:\upload.exe "&IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'snap_1', '-1')&"1.png")
$ovalue.click
Local $ovalue= _IEGetObjById($oIE, "snap_2")
run("c:\upload.exe "&IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'snap_1', '-1')&"2.png")
$ovalue.click
Local $ovalue= _IEGetObjById($oIE, "snap_3")
run("c:\upload.exe "&IniRead(@ScriptDir & "\�ٶ��ύ���.ini", 'Genera'&$i, 'snap_1', '-1')&"3.png")
$ovalue.click
Local $ovalue= _IEGetObjById($oIE, "logo_32")
run("c:\upload.exe gjplogo321.png")
$ovalue.click
Local $ovalue= _IEGetObjById($oIE, "logo_48")
run("c:\upload.exe gjplogo481.png")
$ovalue.click

;Local $ovalue= _IEGetObjById($oIE, "step_submit")
;$ovalue.submit

;   _IEQuit($oie)
Next
