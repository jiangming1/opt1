#region AutoIt3Wrapper Ԥ�������(���ò���)
#AutoIt3Wrapper_Icon=D:\ico\3444\2222.ico ;ͼ��,֧��EXE,DLL,ICO
#AutoIt3Wrapper_OutFile=GetIp_Sendmail.exe ;����ļ���
#AutoIt3Wrapper_OutFile_Type=exe ;�ļ�����
#AutoIt3Wrapper_Compression=4 ;ѹ���ȼ�
#AutoIt3Wrapper_UseUpx=y ;ʹ��ѹ��
#AutoIt3Wrapper_Res_Comment= ;ע��
#AutoIt3Wrapper_Res_Description= ;��ϸ��Ϣ
#AutoIt3Wrapper_Res_Fileversion= ;�ļ��汾
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=p ;�Զ����°汾
#AutoIt3Wrapper_Res_LegalCopyright= ;��Ȩ
#AutoIt3Wrapper_Change2CUI=N ;�޸�����ĳ���ΪCUI(����̨����)
;#AutoItAutoIt3Wrapper_Res_Field=AutoIt Version|%AutoItVer% ;�Զ�����Դ��
;#AutoIt3Wrapper_Run_Tidy= ;�ű�����
;#AutoIt3Wrapper_Run_Obfuscator= ;�����Ի�
;#AutoIt3Wrapper_Run_AU3Check= ;�﷨���
;#AutoIt3Wrapper_Run_Before= ;����ǰ
;#AutoIt3Wrapper_Run_After= ;���к�
#endregion AutoIt3Wrapper Ԥ�������(���ò���)
#include <file.au3>
#include <Inet.au3>
#include <Date.au3>
;��ֹ�ظ����С�
$g_szVersion = '��ȡ����IP�����͵�ָ������'
If WinExists($g_szVersion) Then
Exit
EndIf
AutoItWinSetTitle($g_szVersion)

;�����¼�
Opt("TrayOnEventMode", 1);�����¼�֪ͨ
Opt("TrayMenuMode", 1) ; Ĭ�ϲ˵���Ŀ (�ű���ͣ��/�˳�)(Script Paused/Exit) ��������ʾ.
TrayCreateItem("����")
TrayItemSetOnEvent(-1,'_Sendmail')
$exititem = TrayCreateItem("�˳�����")
TrayItemSetOnEvent($exititem, "_Exit")
TraySetClick(16) ; ֻ�е����ڶ�����갴��(Ĭ���Ҽ�)�Ż���ʾ���̲˵�
TraySetToolTip('��ȡ����IP�����͵�ָ������')
TraySetState()

Global $testIp
Global $oMyRet[2]
;Global $oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")

$s_ToAddress = IniRead(@ScriptDir & "\Config.ini", '�ռ���', '�ռ���ַ', '-1');�ռ��˵�ַ
$s_Subject = IniRead(@ScriptDir & "\Config.ini", '�ռ���', '�ʼ�����', '-1');�ʼ�����
TrayTip("׼������", "�ռ��˵�ַ:" & $s_ToAddress _
& @CRLF & "�ʼ�����:" & $s_Subject, 5, 1)
$aArray = FileReadToArray("���䷢��.txt")
$i1=-1
_Sendmail();�����ʼ�

;AdlibRegister('_ReduceMemory', 1000 * 10);10������һ���ڴ�

AdlibRegister('_Sendmail',60000*15);1xiaoshi fa yici

While 1
Sleep(3000)
WEnd

Func _Exit()
Exit
EndFunc ;==>_Exit

;�����ʼ�====================================================================
Func _Sendmail()
$i1=$i1+1
;$s_SmtpServer = "smtp.163.com" ;SMTP������
$s_SmtpServer = "smtp.qq.com" ;SMTP������
;$s_FromName = "ontimer@163.com"
$s_FromName = "99806761@qq.com"
;$s_FromAddress = "ontimer@163.com"
$s_FromAddress = "99806761@qq.com"
$s_ToAddress =  $aArray[$i1] ;�ռ��˵�ַ
$s_Subject = "����ύ���ܼ�����Ѳֿ�������";"AU3�ʼ����Ͳ���" ;�ʼ�����
Local $hFileOpen = FileOpen("�ٶ��ύ���1.ini")
    If $hFileOpen = -1 Then
        MsgBox($MB_SYSTEMMODAL, "", "An error occurred when reading the file.")
        Return False
    EndIf
    Local $sFileRead = FileRead($hFileOpen)

;Do
;$Getip = _GetIP();����IP
;Sleep(300)
;TrayTip("��ʾ", '���ڻ�ȡ����IP', 5, 1)
;Until $Getip <> -1

;If $testIp <> $Getip Then
;TrayTip("��ʾ", '����IP���ϴη��͵���ͬ' & @CRLF & '���򽫲��ظ�����.', 5, 1)
;Return ;MsgBox(0,'',$Getip)
;EndIf
;$testIp = $Getip
$as_Body =$sFileRead;
$s_AttachFiles = "" ;������ַ
$s_CcAddress = "" ;���͵�ַ
$s_BccAddress = "" ;�ܼ����͵�ַ
;$s_Username = "ontimer@163.com"
$s_Username = "99806761@qq.com"
;$s_Password = "903291"
$s_Password = "jmdjsj903291A"
$IPPort = 25 ;���Ͷ˿ڣ�Gmailʹ�õķ��Ͷ˿�Ϊ465
$ssl = 0
$rc = _INetSmtpMailCom($s_SmtpServer, $s_FromName, $s_FromAddress, $s_ToAddress, $s_Subject, $as_Body, $s_AttachFiles, $s_CcAddress, $s_BccAddress, $s_Username, $s_Password, $IPPort, $ssl)
If @error Then
_FileWriteLog(@ScriptDir & "\MailSendlog.log", "�ʼ�����ʧ�� �������:" & @error & " ����:" & $rc)
TrayTip("�ʼ�����ʧ��", "�������:" & @error _
& @CRLF & "����:" & $rc, 5, 1)
Else
_FileWriteLog(@ScriptDir & "\MailSendlog.log", "�ʼ����ͳɹ� �ռ��˵�ַ: " & $s_ToAddress & " �ʼ�����: " & $s_Subject & " �ʼ�����:" & $as_Body)
TrayTip("�ʼ����ͳɹ�", "�ռ��˵�ַ: " & $s_ToAddress _
& @CRLF & "�ʼ�����: " & $s_Subject _
& @CRLF & "�ʼ�����:" & $as_Body, 5, 1)
EndIf

EndFunc ;==>_Sendmail

Func _INetSmtpMailCom($s_SmtpServer, $s_FromName, $s_FromAddress, $s_ToAddress, $s_Subject = "", $as_Body = "", $s_AttachFiles = "", $s_CcAddress = "", $s_BccAddress = "", $s_Username = "", $s_Password = "", $IPPort = 25, $ssl = 0)
$objEmail = ObjCreate("CDO.Message")
$objEmail.From = '"' & $s_FromName & '" <' & $s_FromAddress & '>'
$objEmail.To = $s_ToAddress
Local $i_Error = 0
Local $i_Error_desciption = ""
If $s_CcAddress <> "" Then $objEmail.Cc = $s_CcAddress
If $s_BccAddress <> "" Then $objEmail.Bcc = $s_BccAddress
$objEmail.Subject = $s_Subject
If StringInStr($as_Body, "<") And StringInStr($as_Body, ">") Then
$objEmail.HTMLBody = $as_Body
Else
$objEmail.Textbody = $as_Body & @CRLF
EndIf
If $s_AttachFiles <> "" Then
Local $S_Files2Attach = StringSplit($s_AttachFiles, ",");�ļ��ָ��
For $x = 1 To $S_Files2Attach[0]
$S_Files2Attach[$x] = _PathFull($S_Files2Attach[$x])
If FileExists($S_Files2Attach[$x]) Then
$objEmail.AddAttachment($S_Files2Attach[$x])
Else
$i_Error_desciption = $i_Error_desciption & @LF & 'File not found to attach: ' & $S_Files2Attach[$x]
SetError(1)
Return 0
EndIf
Next
EndIf
$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = $s_SmtpServer
$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = $IPPort
;Authenticated SMTP
If $s_Username <> "" Then
$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = $s_Username
$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = $s_Password
EndIf
If $ssl Then
$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
EndIf
;Update settings
$objEmail.Configuration.Fields.Update
; Sent the Message
$objEmail.Send
If @error Then
SetError(2)
Return $oMyRet[1]
EndIf
EndFunc ;==>_INetSmtpMailCom
; Com Error Handler
Func MyErrFunc()
$HexHexNumber = Hex($oMyError.number, 8)
$oMyRet[0] = $HexNumber
$oMyRet[1] = StringStripWS($oMyError.description, 3)
ConsoleWrite("### COM Error ! Number: " & $HexNumber & " ScriptLine: " & $oMyError.scriptline & " Description:" & $oMyRet[1] & @LF)
SetError(1); something to check for when this function returns
Return
EndFunc ;==>MyErrFunc
;�����ʼ�����====================================================================

;�����ڴ�
Func _ReduceMemory()
$I_PID = @AutoItPID
Local $ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', $I_PID)
Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', $ai_Handle[0])
DllCall('kernel32.dll', 'int', 'CloseHandle', 'int', $ai_Handle[0])
Return $ai_Return[0]
EndFunc ;==>_ReduceMemory
