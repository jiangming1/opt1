#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\ICO\��Լϵͳ����ͼ������22.ico
#PRE_Outfile=����Ļ.exe
#PRE_UseUpx=n
#PRE_UseX64=n
#PRE_Res_Comment=�Զ�����Ļ����
#PRE_Res_Description=ȡ��Ƶ�ļ��е�������������Ļ���Զ���ԭ��Ƶ�ļ������Ƶ������塣
#PRE_Res_Fileversion=0.0.0.6
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=ZaoKi
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#Include <Array.au3>
Local $gongfu[21],$a
Local $flag=0
Local $filename = FileOpenDialog("��ѡ����Ҫ�����Ļ����Ƶ�ļ�", "", "��Ƶ�ļ� (*.mkv;*.avi;*.mov;*.mpg;*.mp4)") ;����ѡ���ļ��Ի���
If @error Then Exit ;���û��ѡ���ѡ��������˳�
Local $array = StringSplit($filename, "\")
Local $name = $array[$array[0]]
Local $i = StringRegExp($name, "[\x{4e00}-\x{9fff}]+\d?", 3)
If @error Then
	ShellExecute("http://www.shooter.cn")
	TrayTip("��ʾ", "�ļ�����û�����ģ����ֶ�������", 5)
	Sleep(5000)
	Exit
EndIf
For $a=1 To 20
	$gongfu[$a]=IniRead(@ScriptDir&"\Subtitle Search.ini","���Թؼ���","�ؼ���"&$a,"��Ӱ")
Next
;_ArrayDisplay($gongfu)
For $a=1 To 20
	If $i[0]=$gongfu[$a] Then $flag=1
Next

If $flag Then
	ShellExecute("http://www.shooter.cn/search/" & $i[1])
Else
	ShellExecute("http://www.shooter.cn/search/" & $i[0])
EndIf
ClipPut(StringLeft($name, StringLen($name) - 4))