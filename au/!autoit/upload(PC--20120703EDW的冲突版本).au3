upload()
Func upload()
   $CmdLin1="ѡ��Ҫ"
   WinWaitActive($CmdLin1,'',10)
   WinActivate($CmdLin1,'')
   ControlSetText($CmdLin1,'',1148,$CmdLine[1])
   Send("!o")
EndFunc
Func upload1()
   $CmdLin1="ѡ��Ҫ���ص��ļ�"
   WinWaitActive($CmdLin1,'',10)
   WinActivate($CmdLin1,'')
   ControlSetText($CmdLin1,'',1148,$CmdLine[1])
   Send("!o")
EndFunc