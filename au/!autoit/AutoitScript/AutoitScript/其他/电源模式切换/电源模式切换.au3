#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\..\..\ICO\1.ico
#PRE_Outfile=��Դģʽ�л�.exe
#PRE_Compression=4
#PRE_Res_Description=��Դģʽ�л�
#PRE_Res_Fileversion=0.0.0.1
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_LegalCopyright=zaoki
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#Region ACNԤ����������(���ò���)
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

Run('control.exe Powercfg.cpl')
WinWait("��Դѡ��","��Դ�ƻ���������󻯼���������ܻ��߽���")
If ControlCommand("��Դѡ��","��Դ�ƻ���������󻯼���������ܻ��߽���","[CLASS:Button; INSTANCE:1]","IsChecked", "") Then
	ControlCommand("��Դѡ��","��Դ�ƻ���������󻯼���������ܻ��߽���","[CLASS:Button; INSTANCE:3]","Check", "")
	TrayTip("��ʾ","�ɹ��л���ʡ��ģʽ��",3000)
Else
	ControlCommand("��Դѡ��","��Դ�ƻ���������󻯼���������ܻ��߽���","[CLASS:Button; INSTANCE:1]","Check", "")
	TrayTip("��ʾ","�ɹ��л���������ģʽ��",3000)
EndIf
WinClose("��Դѡ��","��Դ�ƻ���������󻯼���������ܻ��߽���")
Sleep(3000)

