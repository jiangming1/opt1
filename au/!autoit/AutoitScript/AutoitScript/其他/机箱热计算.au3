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
#include <Array.au3>
#include <Excel.au3>
Local $s
Local $array[130][4]
Local $T
For $s = -40 To 85
	$T = tem($s)
	$array[$s + 40][0] = $s
	$array[$s + 40][1] = $T[1]
	$array[$s + 40][2] = $T[2]
	$array[$s + 40][3] = $T[3]
Next
;~ _ArrayDisplay($array)

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�
Sleep(1000)
_ExcelWriteSheetFromArray($oExcel, $array, 1, 1, 0, 0) ;���� 0 ��ʼ���������

Func tem($T0)
	Local $Q = 150 ;�����ܷ�����
	Local $T[4] ;�����¶����鷵��ֵ
	Local $T1, $T2, $T3 ;�ֱ��Ӧ��������¶ȣ������ڿ����¶ȣ��ڲ������¶�
	Local $h1 = 15 ;�����ⲿ��������ϵ��
	Local $h2 = 10 ;�����ڲ���������ϵ��
	Local $A = 0.7395 ;������Ƕ�����Ч���
	Const $e = 0.33 * 5.67 * 0.00000001 ;������Ǻڶ�*������䳣��
	Local $A1 = 0.9474 ;������Ƿ�����Ч���
	Local $l = 0.003 ;�����ڱ���������洫������
	Local $k = 0156 ;�������ĵ���ϵ��
	Local $m = 2 * (0.4318 * 0.158 + 0.158 * 0.2985 + 0.4318 * 0.2985);�����ڱ������
	For $T1 = $T0 To 500 Step 0.001
		$Q = ($T1 - $T0) * $h1 * $A + ($T1 ^ 4 - $T0 ^ 4) * $e * $A1
		If $Q - 150 < 0.1 And $Q - 150 > 0 Then
			ExitLoop
		EndIf
	Next
	
	$T2 = $Q * $l / $k / $m + $T1
	
	$T3 = $Q / $m / $h2 + $T2
	
	$T[1] = $T1
	$T[2] = $T2
	$T[3] = $T3
	Return $T
EndFunc   ;==>tem