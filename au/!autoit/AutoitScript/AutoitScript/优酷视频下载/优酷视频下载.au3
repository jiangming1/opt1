#region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\ICO\rss (2).ico
#PRE_Outfile=�ſ���Ƶ����.exe
#PRE_Compression=4
#PRE_Res_Comment=�ſ�ר����������
#PRE_Res_Description=��������������ſ�ר��
#PRE_Res_Fileversion=0.0.0.57
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_requestedExecutionLevel=None
#endregion ;**** ���������� ACNWrapper_GUI ****
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
	
	Au3 �汾:http://v.youku.com/v_show/id_XMTE4MDY1MTgw.html?f=3744460
	�ű�����:http://v.youku.com/v_show/id_XMTE4MDY3Mzky.html?f=3744460
	�����ʼ�:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#include <IE.au3>
#include <Array.au3>
#include <myImageSearch.au3>
Global $lastlink ;�����һ�εĵ�ַ�������ظ�
Local $youkulogo, $chongshi ;ͼƬ�������ꡢ�Ƿ�����
_MyProExists() ;����Ƿ��ظ����С�
HotKeySet("{ESC}", tuichu)
AdlibRegister("_Quit", 1000 * 10) ;����10s����һ�Σ�����ſ�ͻ����Ƿ���ڣ�
FileInstall("��������.PNG", @TempDir & "\��������.PNG", 1)
FileInstall("YouKu Playlist Analysis.exe", @TempDir & "\YouKu Playlist Analysis.exe", 1)

If ProcessExists("YoukuDesktop.exe") = 0 Then  ;����ͻ��˲����ڣ��Ǿ�Ҫ�����ͻ����ˣ�
	TrayTip("��ʾ��", "���������ſ�ͻ��ˣ����Ժ�", 3000)
	Run("C:\Program Files\YouKu\YoukuClient\YoukuDesktop.exe") ;����ſ�ͻ���
	WinWait("�ſ�ͻ���")
	Sleep(20*1000) ;��ͣ20s���ȴ��ͻ�����ȫ������
EndIf
;~ WinSetState("�ſ�ͻ���", "", @SW_SHOW)
WinActivate("�ſ�ͻ���")
Global $xy = WinGetPos("�ſ�ͻ���") ;��ȡ�ſ�ͻ��˴�������
MouseClick("left", $xy[0] + 265, $xy[1] + $xy[3] - 30)  ;�������
Sleep(500)
MouseClick("left", $xy[0] + 265, $xy[1] + $xy[3] - 30)  ;�ٵ��һ�Σ�
WinSetState("�ſ�ͻ���", "", @SW_MINIMIZE)
ClipPut("") ;��ռ��а�
TrayTip("��ʾ��", "�ſ�ͻ����Ѿ�׼���������������ӵ�ַ�����������ء�", 3000)
While 1
	If StringInStr(ClipGet(), "http://v.youku.com/v_show/") = 1 And StringCompare($lastlink, ClipGet()) <> 0 Then
		TrayTip("��ʾ��", "��⵽һ���ſᲥ��ҳ��ַ�������������أ�", 3000)
		$lastlink = ClipGet()
		$chongshi = youku()
		If $chongshi = 1 Then
			TrayTip("���ӳ�ʱ��", "����׼�����ԣ�", 3000)
			youku() ;�����ظ�һ�Σ�
		EndIf
		WinSetState("�ſ�ͻ���", "", @SW_MINIMIZE)
		TrayTip("��ϲ��", "���а��ַ��Ƶ�ɹ���ӵ���YouKu���أ�", 3000)
	EndIf
	If StringInStr(ClipGet(), "http://www.youku.com/playlist_show/") = 1 And StringCompare($lastlink, ClipGet()) Then ;�����ר���������Զ�ģʽ��
		TrayTip("��ʾ��", "��⵽һ���ſ�ר��ҳ��ַ�����ڽ����ļ�ҳ��ַ�����Ժ�", 3000)
		$lastlink = ClipGet()
		zhuanji()
	EndIf
	Sleep(1000)
WEnd

Func _Quit()
	If Not ProcessExists("YoukuDesktop.exe") Then
		TrayTip("��ʾ", "û�м�⵽�ſ������򣬼����Զ��˳���", 3000)
		Sleep(3000)
		Exit
	EndIf
EndFunc   ;==>_Quit

Func tuichu() ;�ֶ��˳�
	TrayTip("��ʾ��", "�ſ��������ּ����Զ��˳���", 3000)
	Sleep(3000)
	Exit
EndFunc   ;==>tuichu

Func _MyProExists()
	Local $my_Version = "Youku downloader"
	If WinExists($my_Version) Then
		TrayTip("��ʾ", "�����Ѿ������ˣ�", 3000)
		Sleep(3000)
		Exit
	EndIf
	AutoItWinSetTitle($my_Version)
EndFunc   ;==>_MyProExists

Func zhuanji()
	Local $arraytxt = @TempDir & "\YouKu Playlist Analysis.txt" ;The file dir
	If FileExists($arraytxt) Then FileDelete($arraytxt) ;If Exist Then Delet The TXT file.
	Local $Analysis = "YouKu Playlist Analysis.exe"
	Local $playlistadress = ClipGet() ;����ר��ҳ��ĵ�ַ��
	TrayTip("��ʾ", "���ڻ�ȡר��ҳ����Ƶ���ŵ�ַ�������Ժ�", 3000)
	Run(@TempDir & "\" & $Analysis)
	Local $counttime = 0 ;����ʱ�ж���
	While 1
		If ProcessExists($Analysis) Then
			Sleep(1000)
			$counttime = $counttime + 1
		EndIf
		
		If FileExists($arraytxt) And Not ProcessExists($Analysis) Then
			ExitLoop
		EndIf
		
		If $counttime = 10 Then ;10s�ˣ�˵����ʱ��������һ���ˣ�
			TrayTip("��ʾ", "��ȡ�����������ԣ�", 3000)
			ProcessClose($Analysis)
			Sleep(1000)
			Run(@TempDir & "\" & $Analysis) ;����
			$counttime = 0
		EndIf
	WEnd
	If FileReadLine($arraytxt, 1) = 1 Then
		TrayTip("��ʾ��", "�ƺ����ҳ���Ѿ�û���ſ���Ƶ��", 3000)
	Else
		TrayTip("��Ƶ��ַ��ȡ��ϣ�", "����ȡ��" & FileReadLine($arraytxt, 1) - 1 & "����Ƶ��ַ������������ǵ��ſ����أ�", 3000)
	EndIf
	Local $num = 2
	While $num <= FileReadLine($arraytxt, 1)
		ClipPut(FileReadLine($arraytxt, $num))
		If ClipGet() = "" Then ExitLoop
		$chongshi = youku()
		If $chongshi = 1 Then
			TrayTip("���ӳ�ʱ����ʧ�ܣ�", "����׼�����ԣ����Ժ�", 3000)
		Else
			TrayTip("��" & FileReadLine($arraytxt, 1) - 1 & "����Ƶ", "�Ѿ������" & $num - 1 & "����Ƶ��", 3000)
			$num = $num + 1
		EndIf
	WEnd
	TrayTip("��ϲ", "ר��ҳ�湲" & FileReadLine($arraytxt, 1) - 1 & "����Ƶ�Ѿ�����ӵ������أ�", 3000)

	If FileReadLine($arraytxt, 1) = 21 Then ;������ڵ�ҳ����20����Ƶ��˵���п��ܴ�����һҳ��
		Local $nextpageadress ;��һ��ר��ҳ�ĵ�ַ
		If StringInStr($playlistadress, "_page_") Then
			Local $playlistsplit = StringSplit($playlistadress, "_page_", 1)
			If $playlistsplit[0] = 2 Then
				Local $splitnum = StringSplit($playlistsplit[2], ".", 1)
				$nextpageadress = $playlistsplit[1] & "_page_" & $splitnum[1] + 1 & "." & $splitnum[2]
			EndIf
		Else
			Local $playlistsplit = StringSplit($playlistadress, ".", 1)
			If $playlistsplit[0] = 4 Then
				$nextpageadress = $playlistsplit[1] & "." & $playlistsplit[2] & "." & $playlistsplit[3] & "_page_2." & $playlistsplit[4]
			EndIf
		EndIf
		If $nextpageadress = "" Then
			TrayTip("����", "ר��ҳ����һ��ҳ���ַ��ȡ�������ֶ��������أ�", 3000)
		Else
			ClipPut($nextpageadress)
			TrayTip("��ʾ", "ר�����ܴ�����һҳ������������һ�����أ�", 3000)
			Sleep(3000)
		EndIf
	Else
		ClipPut($lastlink)  ;�����ظ��İ�ť��
		TrayTip("��ʾ", "���ר���������ļ����Ѿ���ӵ������ض��У�", 3000)
	EndIf
EndFunc   ;==>zhuanji

Func youku()
	WinActivate("�ſ�ͻ���")
	MouseClick("left", $xy[0] + 50, $xy[1] + 70)
	Sleep(500)
	Local $pos = myImageSearch_Desktop(@TempDir & "\��������.PNG", 0, 0, @DesktopWidth, @DesktopHeight, "", True)
	If @error Then
		Sleep(1000)
		SetError(0)
		$pos = myImageSearch_Desktop(@TempDir & "\��������.PNG", 0, 0, @DesktopWidth, @DesktopHeight, "", True)
		If @error Then
			TrayTip("��ʾ", "����������󣬱����ֶ���������򼴽��Զ��˳���", 3000)
			Sleep(3000)
			Exit
		EndIf
	EndIf
	MouseClick("", $pos[0] + 20, $pos[1] - 235)
	MouseClick("", $pos[0] + 20, $pos[1] - 20)
	Local $time = 0
	While PixelGetColor($pos[0], $pos[1]) <> 4042723 ;ͨ�������ɫ�ж��Ƿ���Ե�����أ�
		Sleep(1000)
		If $time = 20 Then ExitLoop ;20������Ӧ���˳�ѭ����
		$time = $time + 1
	WEnd
	If $time = 20 Then
		MouseClick("", $pos[0] + 468, $pos[1] - 293) ;��ʱ����رհ�ť
		Return 1
	Else
		MouseClick("", $pos[0] + 60, $pos[1] + 20) ;������������أ�
		Return 0
	EndIf
EndFunc   ;==>youku