
#include <IE.au3>
ShellExecute ("iexplore.exe", "about:blank")
WinWait ("�հ�ҳ")
$oIE = _IEAttach ("about:blank", "url")
_IEPropertySet ($oIE, "left", 8000) ;����ie��800����
_IEPropertySet ($oIE, "top", 6000) ;����ie��600����
_IENavigate ($oIE, "http://admin.716580.com")
_IELoadWait ($oIE)
$oQ = _IEGetObjByName ($oIE,  "user_loginname")
_IEFormElementSetValue ($oQ, "����")
$oQ = _IEGetObjByName ($oIE,  "user_pwd")
_IEFormElementSetValue ($oQ, "903291")
;$oQ = _IEGetObjByName ($oIE,  "chkRememberMe")
;$oQ.click
$oQ = _IEGetObjByName ($oIE,  "Login")
$oQ.action="http://admin.716580.com/tbc_v5/ytt_login/check.asp"
Sleep(1000)
$oQ.submit
_IELoadWait ($oIE)
_IENavigate ($oIE, "http://admin.716580.com/tbc_v5/ytt_oa/sms_send.asp")
$oQ = _IEGetObjByName ($oIE,  "telNo")
_IEFormElementSetValue ($oQ, "13291488304")
$oQ = _IEGetObjByName ($oIE,  "tre_Note_Content")
$oQ.innerHtml="��л�����µ磬���Ǳ�����Ϻ�����Я�ֹ�������ּ��Ը���㹩��δ����������óͨ���ι������������"
$oQ = _IEGetObjByName ($oIE,  "imageField")
$oQ.click()
_IEQuit($oIE )
