#RequireAdmin
#Region ;**** ���������� AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=D:\ͼ��\3.ico
#AutoIt3Wrapper_outfile=vpn���Ӵ�������.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseAnsi=y
#AutoIt3Wrapper_Res_Comment=������Ӵ�������
#AutoIt3Wrapper_Res_Description=������Ӵ�������
#AutoIt3Wrapper_Res_Fileversion=1.0.0.2
#AutoIt3Wrapper_Res_LegalCopyright=GCH
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#Region ;**** ���������� ACNWrapper_GUI ****
#EndRegion ;**** ���������� ACNWrapper_GUI ****
;#NoTrayIcon
Opt("WinWaitDelay", 100)
Opt("WinTitleMatchMode", 4)
Opt("WinDetectHiddenText", 1)
Opt("MouseCoordMode", 0)
Opt("WinSearchChildren", 1)
Opt("WinTextMatchMode", 2)

If WinExists("��������", "") Then
ProcessClose("rundll32.exe")
TrayTip("", "VPN�����Ѵ��ڣ�", 15, 1)
Sleep(1000)
Exit
EndIf

Run("rundll32.exe netshell.dll,StartNCW")
WinWait("�½�������", "��ӭʹ���½�������")
WinSetState("�½�������", "��ӭʹ���½�������", @SW_SHOW)
ControlClick("[LAST]", "", 12324)
WinWait("�½�������", "���ӵ��ҵĹ�������")
ControlClick("[LAST]", "", 22126)
ControlClick("[LAST]", "", 12324)
WinWait("�½�������", "����ר����������")
ControlClick("[LAST]", "", 22119)
ControlClick("[LAST]", "", 12324)
WinWait("�½�������", "��˾��")
ControlSetText("[LAST]", "", 1680, "gongsi")
ControlClick("[LAST]", "", 12324)
If winwait("�½�������", "������ʼ����") then
ControlClick("[LAST]", "", 1509)
ControlClick("[LAST]", "", 12324)
EndIf
WinWait("�½�������", "�����������ӵ�")
ControlSetText("[LAST]", "", 1433, "60.60.60.8")
ControlClick("[LAST]", "", 12324)
WinWait("�½�������", "���ҵ����������һ��")
ControlClick("[LAST]", "", 21005)
ControlClick("[LAST]", "", 12325)
Sleep(500)
AdlibDisable()
WinWait("����", "�û���")
ControlSetText("[LAST]", "", 1104, "zhou")
ControlSetText("[LAST]", "", 1103, "zhou")
ControlClick("[LAST]", "", 1101)
ControlClick("[LAST]", "", 1623)
ControlClick("[LAST]", "", 1590)
ProcessClose("rundll32.exe")
TrayTip("", "VPN�����ѳɹ�������", 15, 1)
Sleep(2000)
FileMove(@AppDataCommonDir & "\Microsoft\Network\Connections\Pbk\rasphone.pbk", @AppDataCommonDir & "\Microsoft\Network\Connections\Pbk\rasphone.ini", 9)
IniWrite(@AppDataCommonDir & "\Microsoft\Network\Connections\Pbk\rasphone.ini", "chinaunicom", "AuthRestrictions", "856")
Sleep(50)
FileMove(@AppDataCommonDir & "\Microsoft\Network\Connections\Pbk\rasphone.ini", @AppDataCommonDir & "\Microsoft\Network\Connections\Pbk\rasphone.pbk", 9)
RegWrite ('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Cached',"{2559A1F4-21D7-11D4-BDAF-00C04F60B9F0} {000214E6-0000-0000-C000-000000000046} 0x401","REG_BINARY",'0000000031003000B0C5021CD0F3C801')
RegWrite ('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Cached',"{2559A1F5-21D7-11D4-BDAF-00C04F60B9F0} {000214E6-0000-0000-C000-000000000046} 0x401","REG_BINARY",'00000000310030009C26241CD0F3C801')
Sleep(50)
Exit

