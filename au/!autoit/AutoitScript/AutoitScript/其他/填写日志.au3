#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=ICO\addressbook64.ico
#PRE_Outfile=��д��־.exe
#PRE_Compression=4
#PRE_UseX64=n
#PRE_Res_Fileversion=0.0.0.7
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#Region ACNԤ����������(���ò���)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#include <IE.au3>
$oIE = _IECreate ("http://192.188.1.24",0,0) 
$oForm = _IEFormGetObjByName ($oIE, "login")
$oQuery = _IEFormElementGetObjByName ($oForm, "LoginName")
_IEFormElementSetValue ($oQuery, "�¿�")
$oQuery = _IEFormElementGetObjByName ($oForm, "Password")
_IEFormElementSetValue ($oQuery, "112211") 
$oQuery = _IEFormElementGetObjByName ($oForm, "submit")
_IEAction($oQuery ,"click")
;_IEFormSubmit($oForm)
_IELoadWait($oIE)
_IENavigate($oIE, "http://192.188.1.24/mylog/list.asp")
WinSetState("[CLASS:IEFrame]","",@SW_MAXIMIZE)
_IEAction ($oIE, "visible")
WinFlash("Untitled - Windows Internet Explorer")