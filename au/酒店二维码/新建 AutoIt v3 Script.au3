#include <GUIConstants.au3>
MsgBox(16,"����","���ù��̽��Զ�����1�Σ��뱣���δ����Ĺ���")
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\IPSEC", "AssumeUDPEncapsulationContextOnSendRule", "REG_DWORD", "1")

Opt("SendKeyDelay",20)


GUICreate("CKG VPN�������ӳ�ʼ������", 220, 200)
GUICtrlCreateLabel ("CKG VPN�������ƣ�CKGVpn",  10, 10)

GUICtrlCreateLabel ("�������û�����",  10, 60)
$username = GUICtrlCreateInput ("", 10,  75, 200, 20)
GUICtrlCreateLabel ("���������룺",  10, 110)
$password = GUICtrlCreateInput ("", 10,  125, 200, 20, $ES_PASSWORD)
$Button_1 = GUICtrlCreateButton ("Ӧ��(&C)",  20, 160, 50)
$Button_2 = GUICtrlCreateButton ("�ر�(&E)",  80, 160, 50)
$topname = "CKGVpn"
$VpnIP = "202.101.98.56"
$ShareKey = "CKG4321"

GUISetState (@SW_SHOW)
While 1
    $msg = GUIGetMsg()
    Select
        Case $msg = $GUI_EVENT_CLOSE
            Exit
        Case $msg = $Button_1
   if $topname<>"" then
    if GUICtrlRead($username)<>"" then
     if GUICtrlRead($password)<>"" then
              GUISetState (@SW_HIDE)
              Run('RUNDLL32 netshell.dll,StartNCW')
              winwaitactive("�½�������","�½�������")
              winactivate("�½�������","�½�������")
              send("!N")
              winwaitactive("�½�������","���ӵ��ҵĹ�������������(&O)")
              winactivate("�½�������","���ӵ��ҵĹ�������������(&O)")
              send("!O")
              send("!N")

              winwaitactive("�½�������","����ר����������(&V)")
              winactivate("�½�������","����ר����������(&V)")
              send("!V")
              send("!N")
              winwaitactive("�½�������","�����������������ӵ�����")
              winactivate("�½�������","�����������������ӵ�����")
              send($topname)
              send("!N")

               If WinExists("�½�������","������ʼ����")  Then
                          winwaitactive("�½�������","������ʼ����")
                          winactivate("�½�������","������ʼ����")
                          send("!D")
                          send("!N")
               EndIf

               winwaitactive("�½�������","������")
               winactivate("�½�������","������")
               send($VpnIP)
               send("!N")

               winwaitactive("�½�������","ֻ����ʹ��(&M)")
               winactivate("�½�������","ֻ����ʹ��(&M)")
               send("!N")
               Send("{SPACE}")
               send("{ENTER}")

               Run("rasphone /e CKGVpn")

               winwaitactive("CKGVpn ����","")
               winactivate("CKGVpn ����","")
               Send("^{TAB}")
              Send("^{TAB}")
              send("!P")
              Send("{TAB}")
              Send("{TAB}")
              Send("!U")
              Send("{TAB}")

              send($ShareKey)
              Send("{TAB}")
              send("{ENTER}")
              Send("^{TAB}")

              Sleep(2000)
              Send("{DOWN}")
              Send("{DOWN}")
              send("{ENTER}")

              Sleep(1000)
              Run("rasphone -d CKGVpn")
              winwaitactive("���� CKGVpn","",2)
              winactivate("���� CKGVpn")


              Send("+{TAB}")
              send(GUICtrlRead($username))

              Send("{TAB}")
              send(GUICtrlRead($password))

              Send("!S")
              send("!C")


                        ExitLoop
     Else
               MsgBox(0, "", "���벻��Ϊ�գ�")
               ControlFocus ( "CKG VPN�������ӳ�ʼ������", "������", 8)
              EndIf
          Else
              MsgBox(0, "", "�û�������Ϊ�գ�")
              ControlFocus ( "CKG VPN�������ӳ�ʼ������", "������", 6)
          EndIf
      Else
       ;
   EndIf
        Case $msg = $Button_2
            Exit
    EndSelect
Wend

Shutdown(2)


----------------------------------------

#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.10.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
