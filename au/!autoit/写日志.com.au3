
#include <IE.au3>
ShellExecute ("iexplore.exe", "about:blank")
WinWait ("�հ�ҳ")
$oIE = _IEAttach ("about:blank", "url")
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
; �����ҵĵ�һ���ű�
Sleep ( Random(0,1000*60*10, 1))
If @HOUR="08" Then _IENavigate ($oIE, "http://admin.716580.com/tbc_v5/ytt_oahotel/person.asp?xaction=z")
If @HOUR="17" Then _IENavigate ($oIE, "http://admin.716580.com/tbc_v5/ytt_oahotel/person.asp?xaction=w")
_IELoadWait ($oIE)
_IENavigate ($oIE, "http://admin.716580.com/tbc_v5/ytt_oa/daily.asp?xaction=add&daily_type=������־")

$oQ = _IEGetObjByName ($oIE,  "daily_type")
_IEFormElementOptionSelect ($oQ, "������־")
_IELoadWait ($oIE)
$oQ = _IEGetObjByName ($oIE,  "daily_title")
_IEFormElementSetValue ($oQ, "������־")
$oQ = _IEGetObjByName ($oIE,  "daily_demo")
_IEFormElementSetValue ($oQ, "����3���µĹ�����")
$oQ = _IEGetObjByName ($oIE,  "daily_to")
$oQ.value='С��'

;daily_title daily_demo
;daily_type Bt1 daily_to