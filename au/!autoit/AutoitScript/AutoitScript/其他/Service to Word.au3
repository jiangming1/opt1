#Region ACNԤ����������(���ò���)
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
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

Const $NUMBER_OF_ROWS = 1
Const $NUMBER_OF_COLUMNS = 3

$objWord = ObjCreate("Word.Application")
$objWord.Visible = 1
$objDoc = $objWord.Documents.Add()

$objRange = $objDoc.Range()
$objDoc.Tables.Add ($objRange, $NUMBER_OF_ROWS, $NUMBER_OF_COLUMNS)
$objTable = $objDoc.Tables(1)

$objTable.Cell(1, 1).Range.Text = "Service Name"
$objTable.Cell(1, 2).Range.Text = "Display Name"
$objTable.Cell(1, 3).Range.Text = "Service State"

$x = 2

$strComputer = "."

$objWMIService = _
                ObjGet("winmgmts:\\" & $strComputer & "\root\cimv2")
$colItems = $objWMIService.ExecQuery("Select * from Win32_Service")

For $objItem in $colItems
        $objTable.ROWS.Add()
        $objTable.Cell($x, 1).Range.Text = $objItem.Name
        $objTable.Cell($x, 2).Range.Text = $objItem.DisplayName
        $objTable.Cell($x, 3).Range.Text = $objItem.State
        $x = $x + 1
Next

$objTable.AutoFormat(9)