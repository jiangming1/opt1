While 1
	#NoTrayIcon
	tanchuang("����", "��(&Y)", 6)
	tanchuang("AutoCAD", "�Ƿ񽫸Ķ����浽", 6)
	tanchuang("AutoCAD ����", "׼�������� -- �Ƿ������", 1)
	tanchuang("������Ϣ", "", 1)
	tanchuang("Adobe Acrobat", "Ҫ�ڹر�ǰ�����", "[CLASS:Button; INSTANCE:2]")
	
	If WinExists("ͼ���޸�������") Then WinClose("ͼ���޸�������")
	
	If Not ProcessExists("AutoIt3.exe") Then Exit
	Sleep(100)
WEnd

Func tanchuang($biaoti, $wenzi, $anniu)
	If WinExists($biaoti, $wenzi) Then ControlClick($biaoti, $wenzi, $anniu)
EndFunc   ;==>tanchuang