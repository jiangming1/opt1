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

#Include <File.au3>
#include <Array.au3>

Local $i
Local $movesplit[4]
Local $srtsplit[4]
Local $moviename[1]
$inidir=IniRead(@TempDir&"\moviedir.ini","��Ƶ�ļ���","Ĭ��",@DesktopDir)
$moviedir= FileSelectFolder("��ѡ����Ƶ�ļ���","",2,$inidir)
If @error Then Exit
_Find($moviedir, ".mkv", 0,$moviename)
$srtdir= FileSelectFolder("��ѡ����Ļ�ļ���","",2)
If @error Then Exit
$srtname=_FileListToArray($srtdir)
If $moviename[0]<>$srtname[0] Then
	MsgBox(0,"","��Ļ��������Ƶ������һ��")
	Exit
EndIf
$flag=MsgBox(4,"��ѡ��","��Ļ�ļ�ʱ��Ҫ�Ӻ�׺��")
IniWrite(@TempDir&"\moviedir.ini","��Ƶ�ļ���","Ĭ��",$moviedir)
For $i=1 To $moviename[0]
	_PathSplit($moviename[$i],$movesplit[0],$movesplit[1],$movesplit[2],$movesplit[3])
	_PathSplit($srtname[$i],$srtsplit[0],$srtsplit[1],$srtsplit[2],$srtsplit[3])
	If $flag=7 Then FileMove($srtdir&"\"&$srtname[$i],$moviedir&"\"&$movesplit[2]&$srtsplit[3])   ;eng
	If $flag=6 Then FileMove($srtdir&"\"&$srtname[$i],$moviedir&"\"&$movesplit[2]&"_gb"&$srtsplit[3])  ;gb
Next
TrayTip("��ʾ","��Ļ�ļ������޸���ɣ�",5)
Sleep(5000)

#cs
============================================================================================
�ض������ļ�����
Version    : 1.0
Written by : С�������� 
Date       : 2009.04.20
email    :226xb_tu@163.com
============================================================================================
_Find($path, $type, $flag,ByRef $result)
============================================================================================
����˵����
 
$path  
��ʾҪ������λ�ã���"E:\abc",��ʾE���µ�abc�ļ��У�·����ĩβ�����б�ܣ�
 
$type  
��ʾ�ļ����ͣ���".exe"��һ��Ҫ���㣻
 
$flag
ֵΪ0�������������Ŀ¼,��������Ŀ¼;
ֵΪ1������������Ŀ¼�������µ�������Ŀ¼��
 
$result
��ʾҪ���õ����飬�������������������ȳ�ʼ��Ҫ���õ�����Ϊֻӵ��һ��Ԫ��,��  Dim $get[1]
 
ע��$result[0]��ֵΪ��������ƥ�����
============================================================================================
============================================================================================
����
============================================================================================
Example1----------------����e�̵�new�ļ����µ�����txt�ı��ļ���������Ŀ¼
============================================================================================
Dim $get[1]
_Find("E:\new", ".txt", 1,$get)
_ArrayDisplay($get)
============================================================================================
============================================================================================
Example2----------------����e�̵�new�ļ����µ�����txt�ı��ļ�����������Ŀ¼
============================================================================================
Dim $get[1]
_Find("E:\new", ".txt", 0,$get)
_ArrayDisplay($get)
============================================================================================
#ce
 
Func _Find($path, $type, $flag,ByRef $result)
        $FileList = _FileListToArray($path)
        If Not @error Then
                For $i = 1 To $FileList[0] Step 1
                        If StringRight($FileList[$i],4)=$type then
                                _ArrayAdd($result,$path & "\" & $FileList[$i])
                                $result[0]=UBound($result)-1
                        Else
                                If $flag == 1 Then
                                        _Find($path & "\" & $FileList[$i], $type, $flag,$result)
                                EndIf
                        EndIf
                Next
        EndIf
EndFunc   ;==>_Find
