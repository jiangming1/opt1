#NoTrayIcon
#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_icon=PopupWindowClick.exe|-1
#PRE_Outfile=PopupWindowClick.exe
#PRE_Res_Comment=�����Զ��������
#PRE_Res_Description=�����Զ��������
#PRE_Res_Fileversion=1.2.0.8
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=zaoki
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
While 1
	tanchuang("����", "��(&Y)", 6)
	tanchuang("AutoCAD", "�Ƿ񽫸Ķ����浽", 6)
	tanchuang("AutoCAD ����", "׼�������� -- �Ƿ������", 1)
	tanchuang("������Ϣ", "", 1)
	tanchuang("Adobe Acrobat", "Ҫ�ڹر�ǰ�����", "[CLASS:Button; INSTANCE:2]")
	tanchuang("ȷ�����Ϊ", "", "[CLASS:Button; INSTANCE:1]")
	tanchuang("���� - δ����Ĳ����ļ�", "", "[CLASS:Button; INSTANCE:1]")
	tanchuang("AutoCAD ����", "�޷�ʹ�ô˻�ͼ������", "[CLASS:Button; INSTANCE:1]")
	tanchuang("���Ϊ PDF", "��(&Y)", "[CLASS:Button; INSTANCE:1]")
	If WinExists("ͼ���޸�������") Then WinClose("ͼ���޸�������")
	If WinExists("�ⲿ����") Then WinClose("�ⲿ����")	
	If WinExists("ͼ���޸�������") Then WinClose("ͼ���޸�������")
	
	If Not WinExists("proetopdf_zaoki.com") Then Exit ;�ж��Ƿ����������
	Sleep(100)
WEnd

Func tanchuang($biaoti, $wenzi, $anniu)
	If WinExists($biaoti, $wenzi) Then ControlClick($biaoti, $wenzi, $anniu)
EndFunc   ;==>tanchuang