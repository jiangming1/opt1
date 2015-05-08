
; ��װ�����ʼ���峣��
!define PRODUCT_NAME "�����и���������۽�����������"
!define PRODUCT_VERSION "14.07.30"
!define PRODUCT_PUBLISHER "My company, Inc."
!define PRODUCT_WEB_SITE "http://www.mycompany.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\AppMainExe.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
SetCompressor /SOLID lzma
SetCompressorDictSize 32

; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------
!include "MUI.nsh"

; MUI Ԥ���峣��
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; ��ӭҳ��
!insertmacro MUI_PAGE_WELCOME
; ���Э��ҳ��
!insertmacro MUI_PAGE_LICENSE "embedded\License.txt"
; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY
; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��װ���ҳ��
!define MUI_FINISHPAGE_RUN "$INSTDIR\�����и���������۽�����������.exe"
;!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\embedded\InfoBefore.txt"
!insertmacro MUI_PAGE_FINISH

; ��װж�ع���ҳ��
!insertmacro MUI_UNPAGE_INSTFILES

; ��װ�����������������
!insertmacro MUI_LANGUAGE "SimpChinese"

; ��װԤ�ͷ��ļ�
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; ------ MUI �ִ����涨����� ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Output\�����и���������۽�����������.exe"
InstallDir "$PROGRAMFILES\�����и���������۽�����������"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
ShowInstDetails show
ShowUnInstDetails show
BrandingText "aaaaaa"

Section "����" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "�ܵ���(���)\My.exe"
  Rename $INSTDIR\my.exe $INSTDIR\�����и���������۽�����������.exe
  CreateDirectory "$SMPROGRAMS\�����и���������۽�����������"
  CreateShortCut "$SMPROGRAMS\�����и���������۽�����������\�����и���������۽�����������.lnk" "$INSTDIR\�����и���������۽�����������.exe"
  CreateShortCut "$DESKTOP\�����и���������۽�����������.lnk" "$INSTDIR\�����и���������۽�����������.exe"
  File "�ܵ���(���)\data.dat.exe"
  File "�ܵ���(���)\back.bmp"
  File "�ܵ���(���)\Bmpcli32.dll"
  File "�ܵ���(���)\ButtonSkin.dll"
  SetOutPath "$INSTDIR\data"
  File "�ܵ���(���)\data\peijian.mdb"
  SetOutPath "$INSTDIR"
  File "�ܵ���(���)\diskser.dll"
  File "�ܵ���(���)\dw2xls.pbd"
  SetOutPath "$INSTDIR\images"
  File "�ܵ���(���)\images\1.bmp"
  File "�ܵ���(���)\images\101.bmp"
  File "�ܵ���(���)\images\102.bmp"
  File "�ܵ���(���)\images\123.jpg"
  File "�ܵ���(���)\images\201.bmp"
  File "�ܵ���(���)\images\202.bmp"
  File "�ܵ���(���)\images\203.bmp"
  File "�ܵ���(���)\images\204.bmp"
  File "�ܵ���(���)\images\205.bmp"
  File "�ܵ���(���)\images\206.bmp"
  File "�ܵ���(���)\images\4.jpg"
  File "�ܵ���(���)\images\403.bmp"
  File "�ܵ���(���)\images\Background-4.jpg"
  File "�ܵ���(���)\images\dl.bmp"
  File "�ܵ���(���)\images\EXIT.BMP"
  File "�ܵ���(���)\images\gys.bmp"
  File "�ܵ���(���)\images\kh.bmp"
  File "�ܵ���(���)\images\lb.bmp"
  File "�ܵ���(���)\images\lb_add.bmp"
  File "�ܵ���(���)\images\lb_del.bmp"
  File "�ܵ���(���)\images\lb_hide.bmp"
  File "�ܵ���(���)\images\lb_modify.bmp"
  File "�ܵ���(���)\images\lb_refresh.bmp"
  File "�ܵ���(���)\images\sp.bmp"
  File "�ܵ���(���)\images\table_delete.bmp"
  File "�ܵ���(���)\images\table_find.bmp"
  File "�ܵ���(���)\images\tj.bmp"
  File "�ܵ���(���)\images\xs.bmp"
  File "�ܵ���(���)\images\xz.bmp"
  File "�ܵ���(���)\images\yh.bmp"
  File "�ܵ���(���)\images\��Ա����.bmp"
  File "�ܵ���(���)\images\Э��.bmp"
  File "�ܵ���(���)\images\�ͻ�.bmp"
  File "�ܵ���(���)\images\�ύ.bmp"
  File "�ܵ���(���)\images\��׼.bmp"
  File "�ܵ���(���)\images\����.bmp"
  File "�ܵ���(���)\images\��������.bmp"
  File "�ܵ���(���)\images\����.bmp"
  SetOutPath "$INSTDIR"
  File "�ܵ���(���)\libjcc.dll"
  File "�ܵ���(���)\libjsybheap.dll"
  File "�ܵ���(���)\Md5.dll"
  File "�ܵ���(���)\ntwdblib.DLL"
  File "�ܵ���(���)\pbdwe90.dll"
  File "�ܵ���(���)\pbmss90.dll"
  File "�ܵ���(���)\pbodb90.dll"
  File "�ܵ���(���)\pbvm90.dll"
  File "�ܵ���(���)\pj.dll"
  File "�ܵ���(���)\pj.pbd"
  File "�ܵ���(���)\pjjxc.ini"
  File "�ܵ���(���)\skinppwtl.dll"
  File "�ܵ���(���)\total.pbd"
  File "�ܵ���(���)\ttf16.ocx"
  File "�ܵ���(���)\uo.pbd"
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\�����и���������۽�����������\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\�����и���������۽�����������\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\AppMainExe.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\AppMainExe.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

/******************************
 *  �����ǰ�װ�����ж�ز���  *
 ******************************/

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\�ܵ���(���).exe"
  Delete "$INSTDIR\ͼƬ������.au3"
  Delete "$INSTDIR\wxd_ll.bmp"
  Delete "$INSTDIR\wxd_add.bmp"
  Delete "$INSTDIR\wav\XOC.WAV"
  Delete "$INSTDIR\wav\TOCA.WAV"
  Delete "$INSTDIR\wav\system.wav"
  Delete "$INSTDIR\wav\peijian.mdb"
  Delete "$INSTDIR\wav\Notify.wav"
  Delete "$INSTDIR\wav\muff.wav"
  Delete "$INSTDIR\wav\msg.wav"
  Delete "$INSTDIR\wav\finish.wav"
  Delete "$INSTDIR\wav\error.wav"
  Delete "$INSTDIR\wav\close.WAV"
  Delete "$INSTDIR\wav\CHIMES.WAV"
  Delete "$INSTDIR\wav\Button.wav"
  Delete "$INSTDIR\wav\Blip.wav"
  Delete "$INSTDIR\uo.pbd"
  Delete "$INSTDIR\ttf16.ocx"
  Delete "$INSTDIR\total.pbd"
  Delete "$INSTDIR\skinppwtl.dll"
  Delete "$INSTDIR\skin\Royale.ssk"
  Delete "$INSTDIR\skin\PixOS.ssk"
  Delete "$INSTDIR\pjjxc.ini"
  Delete "$INSTDIR\pj.pbd"
  Delete "$INSTDIR\pj.dll"
  Delete "$INSTDIR\pbvm90.dll"
  Delete "$INSTDIR\pbodb90.dll"
  Delete "$INSTDIR\pbmss90.dll"
  Delete "$INSTDIR\pbdwe90.dll"
  Delete "$INSTDIR\ntwdblib.DLL"
  Delete "$INSTDIR\Md5.dll"
  Delete "$INSTDIR\logo.ico"
  Delete "$INSTDIR\Login.bmp"
  Delete "$INSTDIR\libjsybheap.dll"
  Delete "$INSTDIR\libjcc.dll"
  Delete "$INSTDIR\kp2003_2M.bmp"
  Delete "$INSTDIR\jxc.ico"
  Delete "$INSTDIR\images\����.bmp"
  Delete "$INSTDIR\images\��������.bmp"
  Delete "$INSTDIR\images\����.bmp"
  Delete "$INSTDIR\images\��׼.bmp"
  Delete "$INSTDIR\images\�ύ.bmp"
  Delete "$INSTDIR\images\�ͻ�.bmp"
  Delete "$INSTDIR\images\Э��.bmp"
  Delete "$INSTDIR\images\��Ա����.bmp"
  Delete "$INSTDIR\images\yh.bmp"
  Delete "$INSTDIR\images\xz.bmp"
  Delete "$INSTDIR\images\xs.bmp"
  Delete "$INSTDIR\images\tj.bmp"
  Delete "$INSTDIR\images\table_find.bmp"
  Delete "$INSTDIR\images\table_delete.bmp"
  Delete "$INSTDIR\images\sp.bmp"
  Delete "$INSTDIR\images\lb_refresh.bmp"
  Delete "$INSTDIR\images\lb_modify.bmp"
  Delete "$INSTDIR\images\lb_hide.bmp"
  Delete "$INSTDIR\images\lb_del.bmp"
  Delete "$INSTDIR\images\lb_add.bmp"
  Delete "$INSTDIR\images\lb.bmp"
  Delete "$INSTDIR\images\kh.bmp"
  Delete "$INSTDIR\images\gys.bmp"
  Delete "$INSTDIR\images\EXIT.BMP"
  Delete "$INSTDIR\images\dl.bmp"
  Delete "$INSTDIR\images\Background-4.jpg"
  Delete "$INSTDIR\images\403.bmp"
  Delete "$INSTDIR\images\4.jpg"
  Delete "$INSTDIR\images\206.bmp"
  Delete "$INSTDIR\images\205.bmp"
  Delete "$INSTDIR\images\204.bmp"
  Delete "$INSTDIR\images\203.bmp"
  Delete "$INSTDIR\images\202.bmp"
  Delete "$INSTDIR\images\201.bmp"
  Delete "$INSTDIR\images\123.jpg"
  Delete "$INSTDIR\images\102.bmp"
  Delete "$INSTDIR\images\101.bmp"
  Delete "$INSTDIR\images\1.bmp"
  Delete "$INSTDIR\Icon_xp_083.ico"
  Delete "$INSTDIR\embedded\WizardSmallImage.bmp"
  Delete "$INSTDIR\embedded\WizardImage.bmp"
  Delete "$INSTDIR\embedded\License1.txt"
  Delete "$INSTDIR\embedded\License.txt"
  Delete "$INSTDIR\embedded\InfoBefore1.txt"
  Delete "$INSTDIR\embedded\InfoBefore.txt"
  Delete "$INSTDIR\embedded\demo.txt"
  Delete "$INSTDIR\embedded\chinesesimp.isl"
  Delete "$INSTDIR\dw2xls.pbd"
  Delete "$INSTDIR\diskser.dll"
  Delete "$INSTDIR\data\peijian.mdb"
  Delete "$INSTDIR\ButtonSkin.dll"
  Delete "$INSTDIR\Bmpcli32.dll"
  Delete "$INSTDIR\Background-4.jpg"
  Delete "$INSTDIR\back1.bmp"
  Delete "$INSTDIR\back.bmp"
  Delete "$INSTDIR\Arrow.bmp"
  Delete "$INSTDIR\Example.file"
  Delete "$INSTDIR\AppMainExe.exe"

  Delete "$SMPROGRAMS\�����и���������۽�����������\Uninstall.lnk"
  Delete "$SMPROGRAMS\�����и���������۽�����������\Website.lnk"
  Delete "$DESKTOP\�����и���������۽�����������.lnk"
  Delete "$SMPROGRAMS\�����и���������۽�����������\�����и���������۽�����������.lnk"

  RMDir "$SMPROGRAMS\�����и���������۽�����������"
  RMDir "$INSTDIR\wav"
  RMDir "$INSTDIR\skin"
  RMDir "$INSTDIR\images"
  RMDir "$INSTDIR\embedded"
  RMDir "$INSTDIR\data"

  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��ȷʵҪ��ȫ�Ƴ� $(^Name) ���������е������" IDYES +2
  Abort
FunctionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش����ļ�����Ƴ���"
FunctionEnd
