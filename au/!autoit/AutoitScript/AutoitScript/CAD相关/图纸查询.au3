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


#include <File.au3>
#include <String.au3>

$file = FileOpenDialog("��ѡ����Ҫ��ѯ��ͼֽ", "", "CAD�ļ� (*.dwg)")
If @error Then Exit

Dim $szDrive, $szDir, $szFName, $szExt
_PathSplit($file, $szDrive, $szDir, $szFName, $szExt)

If StringLeft($szFName, 1) = "F" Then
	$filename = _StringInsert($szFName, ".", 4)
	$filename = _StringInsert($filename, ".", 8)
Else
	$filename = _StringInsert($szFName, ".", 3)
	$filename = _StringInsert($filename, ".", 7)
EndIf
$filename = StringUpper($filename)
;~ MsgBox(0,"",$filename)

Run("C:\Program Files (x86)\���ͼֽ��ѯϵͳ\ͼֽ�����������ϵͳ.exe")
;~ WinWait("��¼����")
;~ While WinExists("��¼����") 
;~ 	ControlClick("��¼����", "", 4)
;~ 	Sleep(500)
;~ WEnd
WinWait("ͼֽ�����������ϵͳV2.0", "")
ControlCommand("ͼֽ�����������ϵͳV2.0", "", 27, "Check", "")
ControlSetText("ͼֽ�����������ϵͳV2.0", "", 28, $filename)
ControlClick("ͼֽ�����������ϵͳV2.0", "", 21)