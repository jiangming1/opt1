#cs ----------------------------------------------------------------------------
 AutoIt Version: 3.3.12.0
 Author:         ����
 Script Function:
	�ѻ��������ҳ���������Ƽ�������б� �ѻ������ͨ���ļ������ͨ���б�
#ce ----------------------------------------------------------------------------
#include <IE.au3>
#include "mysql.au3"
;user.newhua.com/?action=list&perpage=2500&type=0
_MySQL_InitLibrary()
$MysqlConn = _MySQL_Init()
$connected = _MySQL_Real_Connect($MysqlConn,"sql.caiwuhao.com","php","jmdjsj903291A","yourphp_www")
_MySQL_Set_Character_Set($MysqlConn, "GBK")
;���ݿ�Ϊutf8 ����au3��������Ϊgbk
$sdaisheng_html=gethtml("user.newhua.com/?action=list&perpage=2500&type=0")
$sdaisheng_txt=gettxt("user.newhua.com/?action=list&perpage=2500&type=0")
$sstart=StringInStr($sdaisheng_html,"����")
$sdaisheng_html=Stringmid($sdaisheng_html,$sstart,Stringlen($sdaisheng_html))
$sdaisheng_html = StringReplace($sdaisheng_html, Chr(13)&chr(10), "")
$sdaisheng_html = StringReplace($sdaisheng_html, "����", "�༭")

$aArray = StringRegExp($sdaisheng_html,"<TBODY><TR>.+?"">(.+?)&nbsp.+?</A></TD",3)
;��ѯԤ�����������
For $i = 0 To UBound($aArray) - 1
 $ssoftname=$aArray[$i]
 $sMySqlStatement="update `yourphp_softname` set hua=1 WHERE title = '"&$ssoftname&"';"
   ;�����ѯ��䳤��*2 gbkΪӢ���ַ���2��
   	  ConsoleWrite ($sMySqlStatement&@CRLF)
   If _MySQL_Real_Query($MysqlConn,$sMySqlStatement,StringLen($sMySqlStatement) * 2) <> $MYSQL_SUCCESS Then
	  ConsoleWrite ($sMySqlStatement&@CRLF)
   EndIf
Next
exit

while Stringlen($ssoftname)>2
   $sstart=StringInStr($sdaisheng_html,"�༭")
   $s1start=StringInStr($sdaisheng_txt,"<td><a href=""./?action=editsoft&amp;type=1&amp;slanguage=cn&amp;id=")
   $sdaisheng_html=Stringmid($sdaisheng_html,$sstart+2,Stringlen($sdaisheng_html))
   ;��ȡ
   $sdaisheng_txt=Stringmid($sdaisheng_txt,$s1start+67,Stringlen($sdaisheng_txt))
   ;��ȡ������Ľ�β �� Ϊ�߽�
   $send=StringInStr($sdaisheng_html," ")
   $ssoftname=Stringmid($sdaisheng_html,1, $send-1)
   ;��ѯ����������txt�ı��ضϵ��������
   $s=Stringmid($sdaisheng_html,$send,Stringlen($sdaisheng_html))

$sMySqlStatement="update `yourphp_softname` set hua=1 WHERE title = '"&$ssoftname&"';"
   ;�����ѯ��䳤��*2 gbkΪӢ���ַ���2��
   If _MySQL_Real_Query($MysqlConn,$sMySqlStatement,StringLen($sMySqlStatement) * 2) <> $MYSQL_SUCCESS Then
	  ConsoleWrite ($sMySqlStatement&@CRLF)
   EndIf
   $sMySqlStatement="update `yourphp_softname` set hua=1 WHERE title = '"&StringReplace($ssoftname,"��óͨ","")&"';"
   ;�����ѯ��䳤��*2 gbkΪӢ���ַ���2��
   If _MySQL_Real_Query($MysqlConn,$sMySqlStatement,StringLen($sMySqlStatement) * 2) <> $MYSQL_SUCCESS Then
   EndIf
   $sMySqlStatement="update `yourphp_softname` set hua=1 WHERE title = '"&StringReplace($ssoftname,"�ܼ���","")&"';"
   If _MySQL_Real_Query($MysqlConn,$sMySqlStatement,StringLen($sMySqlStatement) * 2) <> $MYSQL_SUCCESS Then
   EndIf
WEnd


$s=gethtml("user.newhua.com/?action=list&perpage=2500&type=0")
$s1=gettxt("user.newhua.com/?action=list&perpage=2500&type=0")
$sstart=StringInStr($s,"����")
$s=Stringmid($s,$sstart,Stringlen($s))
$s = StringReplace($s, Chr(13)&chr(10), "")
$s = StringReplace($s, "����", "����")
$ssoftname="aaaa"
while Stringlen($ssoftname)>2
   $sstart=StringInStr($s,"����")
   $s1start=StringInStr($s1,"<td><a href=""./?action=editsoft&amp;type=1&amp;slanguage=cn&amp;id=")
   $s=Stringmid($s,$sstart+2,Stringlen($s))
   ;��ȡ
   $s1=Stringmid($s1,$s1start+67,Stringlen($s1))
   ;��ȡ������Ľ�β �� Ϊ�߽�
   $send=StringInStr($s," ")
   $ssoftname=Stringmid($s,1, $send-1)
   ;��ѯ����������txt�ı��ضϵ��������
   $s=Stringmid($s,$send,Stringlen($s))
   ;��ȡid����
   $s1end=StringInStr($s1,""">")
   $ssoftnameid=Stringmid($s1,1, $s1end-1)
   ;��ȡ���id
   $sMySqlStatement="update `yourphp_softname` set hua="&$ssoftnameid&" WHERE title = '"&$ssoftname&"';"
   ;�����ѯ��䳤��*2 gbkΪӢ���ַ���2��
   If _MySQL_Real_Query($MysqlConn,$sMySqlStatement,StringLen($sMySqlStatement) * 2) <> $MYSQL_SUCCESS Then
	  	  ;ConsoleWrite ($sMySqlStatement&@CRLF)
   EndIf
   $sMySqlStatement="update `yourphp_softname` set hua="&$ssoftnameid&" WHERE title = '"&StringReplace($ssoftname,"��óͨ","")&"';"
   ;�����ѯ��䳤��*2 gbkΪӢ���ַ���2��
   If _MySQL_Real_Query($MysqlConn,$sMySqlStatement,StringLen($sMySqlStatement) * 2) <> $MYSQL_SUCCESS Then
   EndIf
   $sMySqlStatement="update `yourphp_softname` set hua="&$ssoftnameid&" WHERE title = '"&StringReplace($ssoftname,"�ܼ���","")&"';"
   If _MySQL_Real_Query($MysqlConn,$sMySqlStatement,StringLen($sMySqlStatement) * 2) <> $MYSQL_SUCCESS Then
   EndIf
WEnd
_MySQL_Close($MysqlConn)
_MySQL_EndLibrary()
Func gethtml($url)
$oIE = _IEcreate($url)
_IELoadWait($oie)
$s=_IEBodyReadhtml($oie)
_IEQuit($oie)
Return $s

;~ 	  $oHTTP=ObjCreate("microsoft.xmlhttp")
;~ 	  $oHTTP.Open("get",$url,false)
;~ 	  $oHTTP.Send()
;~ 	  Return $oHTTP.responseText
EndFunc 
Func gettxt($url)
$oIE = _IEcreate($url)
_IELoadWait($oie)
$s=_IEBodyReadtext($oie)
_IEQuit($oie)
Return $s
;~ 	  $oHTTP=ObjCreate("microsoft.xmlhttp")
;~ 	  $oHTTP.Open("get",$url,false)
;~ 	  $oHTTP.Send()
;~ 	  Return $oHTTP.responseText
EndFunc 