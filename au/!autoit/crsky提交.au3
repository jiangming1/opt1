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
For $i = 2 To 19; Loop through the array.
Global $oIE = _IEcreate("http://u.crsky.com/Member_softadd.aspx")
$b=""
;$b=$b& "<p>"LF &IniRead(@ScriptDir &"\�ٶ��ύ���.ini", "Genera"&$i, "softName", "AutoIt")
;$b=$b& "<p>"LF &"��С��50000KB"
;$b=$b& "<p>"LF &"���ԣ�����"
;$b=$b& "<p>"LF &"�汾��5.21��Ѱ�"
;$b=$b& "<p>"LF &"����ƽ̨   winxp/win7/win8"
;$b=$b& "<p>"LF &"��˾��վ   www.gjprj.cn"
;$b=$b& "<p>"LF &"���ص�ַ   "&IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'down_url', '')
;$b=$b& "<p>"LF &"������ַ   http://www.gjprj.cn/down/"&IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'snap_1', '')&"1.png"
;$b=$b& "<p>"LF &"������ַ   http://www.gjprj.cn/down/"&IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'snap_1', '')&"2.png"
;$b=$b& "<p>"LF &"������ַ   http://www.gjprj.cn/down/"&IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'snap_1', '')&"3.png"
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc1', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc2', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc3', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc4', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc5', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc6', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc7', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc8', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc9', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc10', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc11', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc12', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc13', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc14', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc15', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc16', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc17', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc18', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc19', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc20', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc21', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc22', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc23', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc24', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc25', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc26', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc27', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc28', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc29', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc30', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc31', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc32', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc33', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc34', '')
$b=$b&"<p>"& IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'soft_desc35', '')
_IELoadWait($oie)
$oIE.document.parentWindow.aspnetForm.txtKeywords.value=="�ܼ���,��Ѳֿ�����,�ܼ���erp,�ܼ��Ž�����"
$oIE.document.parentWindow.aspnetForm.txtContent.value=$b
$oIE.document.parentWindow.aspnetForm.txtdescription.value==StringLeft ($b,300)

$oIE.document.parentWindow.aspnetForm.ddlClassId.value=171
$oIE.document.parentWindow.aspnetForm.ddl_plus.value=1
$oIE.document.parentWindow.aspnetForm.txtResName.value=IniRead(@ScriptDir &"\�ٶ��ύ���.ini", "Genera"&$i, "softName", "")
$oIE.document.parentWindow.aspnetForm.txtResVer.value="6.18"
$oIE.document.parentWindow.aspnetForm.txtResSize.value="50000"
$oIE.document.parentWindow.aspnetForm.txttags.value="�ܼ���,��Ѳֿ�����,�ܼ���erp,�ܼ��Ž�����"
$oIE.document.parentWindow.aspnetForm.ddl_shouquan.value="��Ѱ�"
$oIE.document.parentWindow.aspnetForm.txtauthorURL.value="http://www.gjprj.net"
$oIE.document.parentWindow.aspnetForm.txtauthorname.value="�ܼ������"
$oIE.document.parentWindow.aspnetForm.txtdownurl1.value=IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'down_url', '')
$oIE.document.parentWindow.aspnetForm.txthzurl.value=="http://www.gjprj.cn"
$oIE.document.parentWindow.aspnetForm.txtupContent.value="�༭�����������ˡ�"
$oIE.document.parentWindow.aspnetForm.txtPreviewImg.value="http://www.gjprj.cn/down/"&IniRead(@ScriptDir & "\�ٶ��ύ���.ini","Genera"&$i, 'snap_1', '')&"1.png"
$oIE.document.parentWindow.aspnetForm.submit()
;_IEPropertySet($oFrame2, "innertext", $b)




;newfeature


;img_file_1
;xhe0_iframe
;_IEQuit($oie)
Next
