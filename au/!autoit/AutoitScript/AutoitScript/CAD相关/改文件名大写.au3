#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\ICO\��Լϵͳ����ͼ������2.ico
#PRE_Outfile=���ļ�����д.exe
#PRE_Compression=4
#PRE_UseX64=n
#PRE_Res_Comment=�����Զ����˷�CAD�ļ�
#PRE_Res_Description=���ļ����µ�CAD�ļ����Զ���Ϊ��д��ĸ
#PRE_Res_Fileversion=0.0.0.13
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=chen
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
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

#include <File.au3>
#include <Array.au3>
Local $i, $uppername, $name,$memory
$memory=IniRead(@TempDir&"\���ļ�����д.ini","����Ŀ¼","Ŀ¼",@DesktopCommonDir)
Local $caddir = FileSelectFolder("��ѡ��һ���ļ���", "", 2,$memory)
If @error Then Exit
IniWrite(@TempDir&"\���ļ�����д.ini","����Ŀ¼","Ŀ¼",$caddir)
Local $FileList = _FileListToArray($caddir,"*.dwg")
If @error = 1 Or @error=4 Then
	MsgBox(4096, "", "û���ҵ�CAD�ļ���")
	Exit
EndIf
;_ArrayDisplay($FileList, "$FileList")

For $i = 1 To $FileList[0]
	$name = StringTrimRight($FileList[$i],4)
	$uppername = StringUpper($name)
	FileMove($caddir & "\" & $FileList[$i], $caddir & "\" & $uppername & ".dwg", 9)
Next
TrayTip("��ʾ", "���ĳɹ������Ƹ�����"&$FileList[0]&"���ļ���", 5)
Sleep(5000)