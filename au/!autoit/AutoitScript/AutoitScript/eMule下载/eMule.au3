#region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\ICO\��Լϵͳ����ͼ������22.ico
#PRE_Outfile=eMule.exe
#PRE_Compression=4
#PRE_Res_Description=eMule�Զ���������
#PRE_Res_Fileversion=0.0.0.7
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=zaoki
#PRE_Res_requestedExecutionLevel=None
#endregion ;**** ���������� ACNWrapper_GUI ****
#region ACNԤ����������(���ò���)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#endregion ACNԤ����������(���ò���)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	Au3 �汾:
	�ű�����:
	�����ʼ�:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#include <systray UDF.au3>
#include <TrayIconClick.au3>
AdlibRegister("_Quit", 1000 * 60) ;This is only for testing, so if anything go wrong, the script will exit after 1 seconds.
If ProcessExists("emule.exe") And Not WinExists("emule.exe") Then
	Local $index = _SysTrayIconIndex("emule.exe", 0, 1)
	Local $pos = _SysTrayGetButtonInfo($index, 1,3,1)  ;get the pos of emule
	Local $handle = _SysTrayGetButtonInfo($index, 1,1,1)  ;get the handle of emule
	_SysTray_ClickItem("emule", "left", 2)
;~ 	MouseClick("", $pos[0], $pos[1], 2)
;~ 	Sleep(500)
Else
	Run(@ProgramFilesDir & "\eMule\emule.exe")
	WinWait("eMule", "״̬:	������")
EndIf

WinActivate("eMule", "״̬:	������")
Send("!s")
ControlSetText("eMule", "��������", 2183, ClipGet())
ControlClick("eMule", "��������", 2189)

Func _Quit()
	TrayTip("��ʾ", "�����Ѿ�����1�����ˣ������Զ��˳���", 3000)
	Sleep(3000)
	Exit
EndFunc   ;==>_Quit
