#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=D:\GoogleCode\ICO\5.ico
#PRE_Outfile=�鵵�ǼǱ�.exe
#PRE_Compression=4
#PRE_UseX64=n
#PRE_Res_Comment=�����Զ����˷�CAD�ļ�
#PRE_Res_Description=���ļ����µ�CAD�ļ����Զ���Ϊ��д��ĸ������Ŀ¼�µ�CAD�ļ�д�뵽Word����С�
#PRE_Res_Fileversion=0.0.0.14
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
#include <String.au3>
#include <Word.au3>
Local $i, $uppername, $name, $memory
Local $inifile=@TempDir&"\�鵵�ǼǱ�.ini"
$memory = IniRead($inifile, "����Ŀ¼", "Ŀ¼", @DesktopCommonDir)
Local $caddir = FileSelectFolder("1.Ŀ¼�µ����е�CAD�ļ����ֽ�����Ϊ��д��ĸ��"&@CRLF&"2.Ŀ¼�µ�CAD�ļ����ֽ����͵�Word�ĵ���", "", 2, $memory)
If @error Then Exit
IniWrite($inifile, "����Ŀ¼", "Ŀ¼", $caddir)
Local $FileList = _FileListToArray($caddir, "*.dwg")
If @error = 1 Or @error = 4 Then
	MsgBox(4096, "", "û���ҵ�CAD�ļ���")
	Exit
EndIf
uper($FileList)
Word($FileList)
TrayTip("��ʾ", "���ĳɹ������Ƹ�����" & $FileList[0] & "���ļ���", 5)
Sleep(5000)

Func Word($FileList)
	Const $NUMBER_OF_ROWS = 1
	Const $NUMBER_OF_COLUMNS = 2
	$objWord = ObjCreate("Word.Application")
	$objWord.Visible = 1
	$objDoc = $objWord.Documents.Add()
	$objRange = $objDoc.Range()
	$objDoc.Tables.Add($objRange, $NUMBER_OF_ROWS, $NUMBER_OF_COLUMNS)
	$objTable = $objDoc.Tables(1)
	$objTable.Cell(1, 1).Range.Text = "���"
	$objTable.Cell(1, 2).Range.Text = "�ļ���"
	$x = 2
	For $i = 1 To $FileList[0]
		$FileList[$i] = _StringInsert($FileList[$i], ".", 3)
		$FileList[$i] = _StringInsert($FileList[$i], ".", 7)
		$objTable.ROWS.Add()
		$objTable.Cell($i + 1, 1).Range.Text = $i
		$objTable.Cell($i + 1, 2).Range.Text = $FileList[$i]
	Next
	$objTable.AutoFormat(9)
EndFunc   ;==>Word

Func uper($FileList)
	For $i = 1 To $FileList[0]
		$name = StringTrimRight($FileList[$i], 4)
		$uppername = StringUpper($name)
		FileMove($caddir & "\" & $FileList[$i], $caddir & "\" & $uppername & ".dwg", 9)
	Next
EndFunc   ;==>uper