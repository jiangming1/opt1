#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\ICO\��Լϵͳ����ͼ������8.ico
#PRE_Outfile=D:\GoogleCode\AutoitScript\�ֻ�FTP����\AVPlayer����.exe
#PRE_Compression=4
#PRE_UseX64=n
#PRE_Res_Description=AVPlayer��Ӱ����
#PRE_Res_Fileversion=0.0.0.4
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=zaoki
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#Region ACNԤ����������(���ò���)
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
#include <IE.au3> 
Local $i,$flag
For $i=0 To 9
	Local $oIE = _IECreate("http://192.168.1.10"&$i&":8080",0,0)
	$s=_IEBodyReadHTML ($oIE)
	If StringInStr($s,"AVPlayer's Folder") Or StringInStr($s,"Index of") Then 
		$flag=1
		ExitLoop
	EndIf	
	_IEQuit($oIE)
Next
If $flag=1 Then
	_IECreate("http://192.168.1.10"&$i&":8080",0,1)
	WinSetState("AVPlayer's Folder","",@SW_MAXIMIZE)
Else
	TrayTip("����","���ƺ���û�д�AVPlayer����WIFI����",5000)
	Sleep(5000)
EndIf

