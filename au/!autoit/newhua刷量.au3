#include <IE.au3>
$aarray=FileReadToArray ("newhualist.txt")
for $i=1 to 999999999
;RunWait('rasdial /d')
;����ܼ���������1

;pc6 �Ƽ�  http://www.pc6.com/down.asp?id=98439
;Local $oIE2 = _IECreate("http://www.pc6.com/softview/SoftView_98439.html")
;$oIE2.document.parentWindow.execscript("")

for $i1=1 to 1

;$oIE2.document.parentWindow.eval_r("softCount(98439,149646);")

;�����Ƽ�
;Local $oIE2 = _IECreate("http://www.duote.com/soft/42789.html")
;_IELoadWait($oie2)
;$oIE2.document.parentWindow.execscript("pj(1,42789);tj('d11','');return false;")
;$oIE2.document.parentWindow.eval_r("softCount(98439,149646)")
;_IEQuit($oie2)
;onlinedown �Ƽ�

for $i=0 to UBound($aarray)-1
;   _IENavigate($oIE2,"http://www.onlinedown.net/soft/"&$aarray[$i]&".htm")
;   _IELoadWait($oIE2 )
;   _IENavigate($oIE2,"http://www.onlinedown.net/softdown/"&$aarray[$i]&"_2.htm")

   Local $oIE2 = _IECreate("http://count.newhua.com/stat.php?id="&$aarray[$i]&"&web_id="&$aarray[$i])
   _IELoadWait($oIE2 )
_IEQuit($oie2)

next

next

;http://www.duote.com/soft/42789.html
;$oIE2.document.parentWindow.execscript("digg(117854,1)")



Next
#cs
;sina
Local $oIE2 = _IECreate("http://down.tech.sina.com.cn/page/53464.html")
_IELinkClickByText ($oie2,"�ܺ�")
WinWait('Microsoft Internet Explorer')
ControlClick('Microsoft Internet Explorer', '', 'Button1')
_IEQuit($oie2)
WinKill ('�ļ�����')
;sina down
Local $oIE2 = _IECreate("http://down.tech.sina.com.cn/download/d_load.php?d_id=53464&down_id=2&ip=")
_IEQuit($oie2)
WinKill ('�ļ�����')
;sina ��ʤ�ܼ�
Local $oIE2 = _IECreate("http://down.tech.sina.com.cn/content/58941.html")
_IELinkClickByText ($oie2,"�ܺ�")
WinWait('Microsoft Internet Explorer')
ControlClick('Microsoft Internet Explorer', '', 'Button1')
_IEQuit($oie2)
WinKill ('�ļ�����')
;sina down
Local $oIE2 = _IECreate("http://down.tech.sina.com.cn/download/d_load.php?d_id=53464&down_id=2&ip=")
_IEQuit($oie2)
WinKill ('�ļ�����')

;onlinedown �Ƽ�
Local $oIE2 = _IECreate("http://www.onlinedown.net/soft/117854.htm")
_IELinkClickByText ($oie2,"�Ƽ�")
_IEQuit($oie2)
WinKill ('�ļ�����')
Local $oIE2 = _IECreate("http://www.pc6.com/down.asp?id=98439")
_IEQuit($oie2)
WinKill ('�ļ�����')
Local $oIE2 = _IECreate("http://www.doyo.cn/down/add_game?d=10251828&c=3100")
_IEQuit($oie2)
WinKill ('�ļ�����')
Local $oIE2 = _IECreate("http://www.crsky.com/soft/31171.html")
;550���ܼ�������ͨ��� v3.31 ������������
_IEQuit($oie2)
WinKill ('�ļ�����')
;http://xiazai.zol.com.cn/down.php?nn=304ce170cf3bcb0ae&softid=413376&subcateid=1006&site=10&server=10&isvip=1&rand=2720468

;29 http://www.onlinedown.net/softdown/522143_2.htm
Local $oIE2 = _IECreate("http://www.onlinedown.net/api/index2.php?ver=2.0&name=%E7%AE%A1%E5%AE%B6%E5%A9%86-%E9%BA%BB%E5%B0%86%E6%9C%BA%E5%8E%82%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F&id=522143&token=cd88e949df7cb1d8e6d5e945fbf9f121")
;�齫��
_IELoadWait($oie2)
_IEQuit($oie2)
WinKill ('�ļ�����')

;_IENavigate($oie1,"http://www.baidu.com")
;Local $oIE = _IECreate("http://www.onlinedown.net/soft/151968.htm")
;Local $oIE = _IECreate("http://www.pc6.com/softview/SoftView_111320.html")
;_IEQuit($oie)
;Local $oIE = _IECreate("http://www.duote.com/soft/10916.html")
;4
;_IEQuit($oie)


;Local $oIE = _IECreate("http://www.crsky.com/soft/31171.html")
;550���ܼ�������ͨ��� v3.31 ������������
;_IEQuit($oie)


;Local $oIE = _IECreate("http://down.tech.sina.com.cn/content/53464.html")
;130638�ܼ���
;_IEQuit($oie)


;www.onegreen.net
;4
;sleep(1000)
;_IENavigate($oie,"http://www.onlinedown.net/soft/565228.htm")
;_IELoadWait($oie)
;_IENavigate($oie,"http://www.onlinedown.net/softdown/151968_2.htm")
;_IELoadWait($oie)

;$oIE = _IEAttach("�ó�ͬ��������������֮�������ٷ�����|�ó�ͬ��������������֮������� 2014�����������")
;_IELinkClickByText ($oie, "�й�������������1")
;WinWait('�ļ�����')
;sleep(100)
;Send("!S")
;WinWait('���Ϊ')
;Send($i&".rar!S")

Next
#ce