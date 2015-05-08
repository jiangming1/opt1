#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\ICO\full.ico
#PRE_Outfile=license.exe
#PRE_Compression=4
#PRE_UseX64=n
#PRE_Res_Comment=�����Զ���������������ַ�滻.dat�ļ��е�������ַ��
#PRE_Res_Description=�Զ�����Proe License�ļ�
#PRE_Res_Fileversion=1.0.3.9
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=zaoki
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
	�ű�����:1.����MAC��ַΪ��ǰ���Ե�MAC��ַ
	2.�Զ����.dat�ļ�Ϊlicence.dat�ļ���
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�


#include <Array.au3>
#include <ACN_NET.au3>
#include <File.au3>
Local $FileList = _FileListToArray(@ScriptDir, "*.dat")
If @error = 1 Or @error = 4 Then
	TrayTip("��ʾ", "�ļ�����û��dat���͵��ļ���", 5, 1)
	Sleep(5000)
	Exit
EndIf
;_ArrayDisplay($FileList, "$FileList")
For $i = 1 To $FileList[0]
	update($i)
Next

Func update($i)
	$license = FileRead(@ScriptDir & "\" & $FileList[$i])
	If @error = 1 Then
		TrayTip("��ʾ", "License�ļ���ȡ���ִ���", 5, 1)
		Sleep(5000)
		Exit
	EndIf
	$mac = StringRegExp($license, "\w{2}-\w{2}-\w{2}-\w{2}-\w{2}-\w{2}", 1)
	If @error = 1 Then
		TrayTip("��ʾ", "��ȡ�ļ��е�Mac��ַʧ�ܣ��ļ����ڿ��ܴ����������͵�.dat�ļ���", 5, 1)
		Sleep(5000)
		Exit
	EndIf
	$macip = StringReplace(_API_Get_NetworkAdapterMAC(@IPAddress1), ":", "-")
	$num = _ReplaceStringInFile(@ScriptDir & "\" & $FileList[$i], $mac[0], $macip)
	If $num = -1 Then
		TrayTip("��ʾ", "����" & $FileList[$i] & "ʧ��,�뱣֤���ļ��ǿ�д�ģ�", 5, 1)
		Sleep(5000)
	Else
		TrayTip("��ʾ", "����" & $FileList[$i] & "�ļ��ɹ������滻���ļ���" & $num & "��MAC��ַ" & @CRLF & "ԭ�ļ��е�MAC��ַΪ��" & $mac[0] & @CRLF & "���ĺ��MAC��ַΪ��" & $macip, 5)
		Sleep(5000)
	EndIf
EndFunc   ;==>update