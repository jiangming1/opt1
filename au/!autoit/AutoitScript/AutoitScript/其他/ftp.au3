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

#include <FTPEx.au3>
$FTP_Server = IniRead("x:\xms\config.txt", "TSPC_Checker_FTP", "SERVER", "unknow")
$user = IniRead("x:\xms\config.txt", "TSPC_Checker_FTP", "USERNAME", "unknow")
$Password = IniRead("x:\xms\config.txt", "TSPC_Checker_FTP", "PASSWORD", "unknow")
$FilePath = IniRead("x:\xms\config.txt", "TSPC_Checker_FTP", "FILE_PATH", "unknow")
$ret = _DownloadFileFromFTP($FTP_Server, $user, $Password, $FilePath, @ScriptName)
If Not @error Then MsgBox(0,0,"Download success")
                                
Func _DownloadFileFromFTP($iIP, $iUsername, $iPassword, $iFilePath, $iFilename)
        Local $Open = _FTP_Open('MyFTP Control')
        Local $Conn = _FTP_Connect($Open, $iIP, $iUsername, $iPassword, 0, "21")
 
        If $Conn Then
                $File_Get = _FTP_FileGet($Conn, $iFilePath & "\" & $iFilename, @ScriptDir & "\updated.exe")
                If Not @error Then
                        Return 1 ;���سɹ�
                Else
                        Return SetError(-1, -1, 0) ;����ʧ��
                EndIf
                _FTP_Close($Conn)
        Else
                Return SetError(-1, -1, -1) ;FTP����ʧ��,����ֵΪ-1��������ErrorΪ-1
        EndIf
 
EndFunc   ;==>_DownloadFileFromFTP