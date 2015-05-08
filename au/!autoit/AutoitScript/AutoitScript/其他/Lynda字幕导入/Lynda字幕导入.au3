#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\..\ICO\Lync.ico
#PRE_Outfile=D:\GoogleCode\AutoitScript\����\Lynda��Ļ����\Lynda��Ļ����.exe
#PRE_Compression=4
#PRE_Res_Description=Lynda��Ƶ����Ļͬ�����Զ�����
#PRE_Res_Fileversion=0.0.0.2
#PRE_Res_Fileversion_AutoIncrement=y
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
Local $flag = 2 ;1������Ƶ���ֿ�����Ļ���֣�2������Ļ���ֿ�����Ƶ��
If FileExists(@DesktopDir & "\newsrt") Then DirRemove((@DesktopDir & "\newsrt"), 1)
Local $videodirlasttime = IniRead(@TempDir & "\lynda.ini", "��Ƶ", "�ϴε�ַ", "")
Local $srtdirlasttime = IniRead(@TempDir & "\lynda.ini", "��Ļ", "�ϴε�ַ", "")
Global $videodir = FileSelectFolder("��ѡ����Ƶ�ļ���", "", 2, $videodirlasttime)
If @error Then Exit
IniWrite(@TempDir & "\lynda.ini", "��Ƶ", "�ϴε�ַ", $videodir)
Global $srtdir = FileSelectFolder("��ѡ����Ļ�ļ���", "", 2, $srtdirlasttime)
If @error Then Exit
IniWrite(@TempDir & "\lynda.ini", "��Ļ", "�ϴε�ַ", $srtdir)
Global $videoFolderList = _FileListToArray($videodir, "*", 2) ;�п��ܴ�����ϰ�ļ���
Global $srtFolderList = _FileListToArray($srtdir, "*", 2)
If @error Then Exit ;������˳�����
;~ _ArrayDisplay($videoFolderList, "��Ƶ�ļ����б�")
;~ _ArrayDisplay($srtFolderList, "��Ļ�ļ����б�")
If $videoFolderList[0] = $srtFolderList[0] Or $videoFolderList[0] = $srtFolderList[0] + 1 Then
	TrayTip("��ʾ", "�ļ���ƥ��ɹ������������ļ������ļ�ƥ���顣", 2000)
Else
	TrayTip("��ʾ", "�ļ���ƥ��ʧ�ܣ������ǲ���ͬһ��Ƶ����Ļ��", 2000)
	Sleep(2000)
	Exit
EndIf

check()
changename()
TrayTip("��ϲ��", "��Ļ����Ƶ�����ƥ�䣬���Ҹ��Ƶ�����Ƶ�ļ��С�", 3000)
Sleep(3000)

Func check()
	For $i = 1 To $srtFolderList[0]
		Local $srtname = _FileListToArray($srtdir & "\" & $srtFolderList[$i])
;~ 		_ArrayDisplay($srtname, "��Ļ�ļ��б�")
		Local $videoname = _FileListToArray($videodir & "\" & $videoFolderList[$i])
;~ 		_ArrayDisplay($videoname, "��Ƶ�ļ��б�")
		If $srtname[0] <> $videoname[0] Then
			Local $shuzucd ;����ĳ���
			If $srtname[0] < $videoname[0] Then
				$shuzucd = $videoname[0]+1
			Else
				$shuzucd = $srtname[0]+1
			EndIf
			Local $bijiao[$shuzucd][2]
			For $s = 0 To $videoname[0]
				$bijiao[$s][0] = $videoname[$s]
			Next
			For $s = 0 To $srtname[0]
				$bijiao[$s][1] = $srtname[$s]
			Next
			TrayTip("��ʾ","�ļ����ڵ��ļ�������ƥ�䣬���飡",3000)
;~ 			_ArrayConcatenate($videoname, $srtname)
			_ArrayDisplay($bijiao, "��ƥ����ļ���@" & $videoFolderList[$i])
			Exit
		EndIf
	Next
EndFunc   ;==>check

Func changename()
	For $i = 1 To $srtFolderList[0]
		DirMove($srtdir & "\" & $srtFolderList[$i], $srtdir & "\" & $videoFolderList[$i])
		Local $srtname = _FileListToArray($srtdir & "\" & $videoFolderList[$i])
		Local $videoname = _FileListToArray($videodir & "\" & $videoFolderList[$i])
		For $n = 1 To $srtname[0]
			Local $szDrive, $szDir, $szFName, $szExt, $format
			If $flag = 1 Then
				_PathSplit($srtdir & "\" & $videoFolderList[$i] & "\" & $srtname[$n], $szDrive, $szDir, $szFName, $format) ;��ȡ��Ļ����
				_PathSplit($videodir & "\" & $videoFolderList[$i] & "\" & $videoname[$n], $szDrive, $szDir, $szFName, $szExt)
				Local $old = $srtdir & "\" & $videoFolderList[$i] & "\" & $srtname[$n]
				Local $new = $srtdir & "\" & $videoFolderList[$i] & "\" & $szFName & $format
			Else
				_PathSplit($videodir & "\" & $videoFolderList[$i] & "\" & $videoname[$n], $szDrive, $szDir, $szFName, $format) ;��ȡ��Ƶ����
				_PathSplit($srtdir & "\" & $videoFolderList[$i] & "\" & $srtname[$n], $szDrive, $szDir, $szFName, $szExt)
				Local $old = $videodir & "\" & $videoFolderList[$i] & "\" & $videoname[$n]
				Local $new = $videodir & "\" & $videoFolderList[$i] & "\" & $szFName & $format
			EndIf
			FileMove($old, $new)
		Next
	Next
	DirCopy($srtdir, $videodir, 1)
EndFunc   ;==>changename

