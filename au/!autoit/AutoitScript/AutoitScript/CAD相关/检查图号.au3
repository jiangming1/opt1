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
#include <Array.au3>

$filename = FileOpenDialog("��ѡ����Ҫ��ѯ��ͼֽ", "", "ͼ�� (*.dwg)", 4)
$spit = StringSplit($filename, "|") ;�ָ��ļ��������
Global $flag[100]
Local $i
Global $count = 1
$flag[0] = 0

If @error Then
	zhunbei()
	$single = $filename ;˵��ѡ����ǵ����ļ�
	chaxun($single)
	$spit[0] = 2
Else
	zhunbei()
	For $i = 2 To $spit[0] ;һ��һ����ת��PDF��ֱ��������
		$single = $spit[1] & "\" & $spit[$i]
		chaxun($single)
	Next
EndIf

If $flag[0] = 0 Then
	TrayTip("��ʾ", "�����ɣ�û�з����ļ��ų�ͻ��", 5)
	Sleep(5000)
Else
	_ArrayDisplay($flag, "��ͻͼ���б�")
EndIf

WinClose("ͼֽ�����������ϵͳV2.0", "")


Func zhunbei()
	If ProcessExists("ͼֽ�����������ϵͳ.exe") Then ProcessClose("ͼֽ�����������ϵͳ.exe")
	Run("C:\Program Files (x86)\���ͼֽ��ѯϵͳ\ͼֽ�����������ϵͳ.exe")
	WinWait("ͼֽ�����������ϵͳV2.0", "")
	ControlCommand("ͼֽ�����������ϵͳV2.0", "", 27, "Check", "")
EndFunc   ;==>zhunbei

Func chaxun($file)
	Local $szDrive, $szDir, $szFName, $szExt
	_PathSplit($file, $szDrive, $szDir, $szFName, $szExt)
	$filename = _StringInsert($szFName, ".", 3)
	$filename = _StringInsert($filename, ".", 7)
	$filename = StringUpper($filename)
	
	ControlSetText("ͼֽ�����������ϵͳV2.0", "", 28, $filename)
	ControlClick("ͼֽ�����������ϵͳV2.0", "", 21)
	Sleep(500)
	ControlClick("ͼֽ�����������ϵͳV2.0", "", 6)
	Sleep(500)
	
	WinWait("��ϸ��Ϣ","������Ϣ")
	If WinExists("��ϸ��Ϣ",".dwg") Then
		$flag[0] = 1
		$flag[$count] = $filename & ".dwg"
		$count = $count + 1
	EndIf
	WinClose("��ϸ��Ϣ","������Ϣ")

EndFunc   ;==>chaxun