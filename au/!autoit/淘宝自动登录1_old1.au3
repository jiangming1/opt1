#include<IE.au3>
$aKeyword = StringSplit("���������,������������,������ϵͳ,������������,���ι������", ",")
    FOR $element IN $aKeyword
        Sleep(1000)
Global $oIE = _IECreate("http://www.baidu.com")
js(FileRead("jquery-1.10.2.min.js"))
js("$('#kw').val('���������')")
js("$('#su').click()")
_IELoadWait($oie)
_IELinkClickByText ($oie, "��������� [��óͨ]����ϵͳ���,�������")
    Next


Func js($script)
  $oIE.document.parentWindow.eval($script)
EndFunc
