#region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
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
If WinExists("CAD�ֽ�����") Then
		TrayTip("��ʾ","CAD�ֽ������Ѿ�����������",5)
		Sleep(5000)
		Exit
EndIf

Local $my_Version = "CAD�ֽ�����"
AutoItWinSetTitle($my_Version) ;д���ļ����⣬�������������ʶ��

HotKeySet("^{down}", "new")
HotKeySet("^{up}", "tuichu")
Global $i=1
TrayTip("��ʾ","��CAD��ѡ��ͼ�κ� Ctrl+��",5)

While 1
	Sleep(100)
WEnd

Func tuichu()
	TrayTip("��ʾ","CAD�ֽ����ּ����رգ�",5)
	Sleep(5000)
	Exit
EndFunc

Func new()
	WinActivate("AutoCAD 2011")
	WinMenuSelectItem("AutoCAD 2011", "", "�༭", "����")
	WinMenuSelectItem("AutoCAD 2011", "", "�ļ�", "�½�")
	WinWait("ѡ������")
	ControlClick("ѡ������", "", "[CLASS:Button; INSTANCE:10]")
	While WinExists("ѡ������")
		ControlClick("ѡ������", "", "[CLASS:Button; INSTANCE:10]")
		Sleep(100)
	WEnd
	WinMenuSelectItem("AutoCAD 2011", "", "�༭", "ճ����ԭ����")
	WinMenuSelectItem("AutoCAD 2011", "", "��ͼ", "����","��Χ")
	WinMenuSelectItem("AutoCAD 2011", "", "�ļ�", "���Ϊ")
	WinWait("ͼ�����Ϊ")
	ControlCommand("ͼ�����Ϊ", "", "[CLASS:ComboBox; INSTANCE:1]", "SelectString", '����')
	ControlSetText("ͼ�����Ϊ", "", "[CLASS:Edit; INSTANCE:1]", StringFormat("%03s",$i))
	ControlCommand("ͼ�����Ϊ","","[CLASS:ComboBox; INSTANCE:3]","SetCurrentSelection", 3)
	ControlClick("ͼ�����Ϊ", "", "[CLASS:Button; INSTANCE:10]")
	While WinExists("ͼ�����Ϊ")
		ControlClick("ͼ�����Ϊ", "", "[CLASS:Button; INSTANCE:10]")
		Sleep(100)
	WEnd
	WinMenuSelectItem("AutoCAD 2011", "", "�ļ�", "�ر�")
	
	TrayTip("��ʾ","�ɹ������洴�����ļ� " & StringFormat("%03s",$i) & ".dwg" ,5)
	$i=$i+1
	
EndFunc   ;==>new






