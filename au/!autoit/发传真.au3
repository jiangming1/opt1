#Include <Date.au3>
#include <IE.au3>
;#include <FTPEx.au3>  
;#include <SQLite.au3>  
;#include <SQLite.dll.au3>  
Global  $sname1="�����ƣ�"
HotKeySet("{F5}", "captureEsc")
While 1
    Sleep(500)
WEnd

Func captureEsc()
$file = FileOpen("������.txt", 0)
If $file = -1 Then
	MsgBox(0, "����", "���ܴ��ļ�.")
	Exit
EndIf
$stitle=WinGetTitle("[active]") 
$i=0
; ÿ�ζ�ȡһ���ı�,ֱ���ļ�����.
While 1
	$line = FileReadLine($file)
	If @error = -1 Then ExitLoop
$i=$i+1	
$as=StringSplit($line, ",",1)
$sfax=$as[2]
$sname=$as[1]
If $i>100 Then 
	$i=0
	MsgBox(0,"","")
EndIf
WinWait ($stitle)
WinActivate ($stitle)
Send("{home}")
Send("^h")
WinWait ("���Һ��滻")
Send($sname1);
Send("{TAB}");
Send("��"&$sname&"��");
$sname1="��"&$sname&"��";
Send("!a")
WinWait ("Microsoft Office Word")
Send("{esc}")
Send("{esc}")
Send("{esc}")
Send("^p")
WinWait ("��ӡ")
Send("{enter}")
WinWait ("���淢����")
Send("{enter}")
Send($sname)
Send("{TAB}")
Send("{TAB}")
Send($sfax)
Send("{enter}{space}{enter}{enter}{enter}")

Wend

FileClose($file)
EndFunc


