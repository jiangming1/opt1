@echo off  
cls   
color 0A    
rem //���ñ���     
set Nic="��������"   
rem //���Ը��������Ҫ����,     
set Addr=192.168.0.248  
set Mask=255.255.255.0  
set Gway=192.168.0.1  
set Dns1=192.168.0.1  
set Dns2=192.168.0.1  
echo     1 ����Ϊ��̬IP     
echo     2 ����Ϊ��̬IP     
echo     3 �˳�     
echo ��������ѡ����Ŀ��س�     
set /p answer=     
if %answer%==1 goto 1     
if %answer%==2 goto 2     
if %answer%==3 goto 3     
:1     
echo ���ڽ��о�̬IP���ã����Ե�...     
echo I P ��ַ = %addr%     
echo �������� = %Mask%     
netsh interface ip set address name=%Nic% source=static addr=%addr% mask=%Mask% gateway=%Gway% gwmetric=1    
echo ��ѡ DNS = %Dns1%     
netsh interface ip set dns name=%Nic% source=static addr=%Dns1% register=PRIMARY     
echo ���� DNS = %Dns2%     
netsh interface ip add dns name=%Nic% addr=%Dns2% index=2     
echo ȫ���������!   
ipconfig /all   
pause     
goto end     
:2     
echo ���ڽ��ж�̬IP���ã����Ե�...     
echo. IP ��ַ���ڴ�DHCP�Զ���ȡ...     
netsh interface ip set address "��������" dhcp     
echo. DNS��ַ���ڴ�DHCP�Զ���ȡ...     
netsh interface ip set dns "��������" dhcp     
echo ----     
echo ȫ���������!     
pause     
:3     
:end
pause >null  
