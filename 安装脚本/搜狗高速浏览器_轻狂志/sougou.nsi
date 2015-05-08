; �ýű�ʹ�� HM VNISEdit �ű��༭���򵼲���
;!include dtgamework.nsh
; ��װ�����ʼ���峣��
!define PRODUCT_NAME "�ѹ����������"
!define PRODUCT_VERSION "2.0.0.1097"
!define PRODUCT_PUBLISHER "My company, Inc."
!define PRODUCT_WEB_SITE "http://www.mycompany.com"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define TEMP1 $R0 ;Temp variable
SetCompressor lzma
BrandingText "�ѹ����������"
; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------
!include "MUI.nsh"

Var DLGITEM

ReserveFile "${NSISDIR}\Plugins\InstallOptions.dll"
ReserveFile "io.ini"

LangString PAGE_TITLE 2052 "ѡ�񸽼�����"
LangString PAGE_SUBTITLE 2052 "ѡ��ִ���ѹ������������װ������һЩ��������"


; MUI Ԥ���峣��
!define MUI_ABORTWARNING
!define MUI_ICON "sogou_explorer.ico"
!define MUI_UNICON "sogou_explorer.ico"


!define mui_headerimage
;!define mui_headerimage_right
!define mui_headerimage_bitmap "modern-header.bmp"

; ��ӭҳ��
!define mui_welcomepage_title '��ӭʹ�á��ѹ����������\r\n2.0.0.1097����װ��'
!define mui_welcomepage_text '����򵼽�ָ������ɡ��ѹ���������� 2.0.0.1097���İ�װ���̡�\r\n\r\n�ڿ�ʼ��װ֮ǰ�������ȹر���������Ӧ�ó����⽫\r\n������װ���򡱸���ָ����ϵͳ�ļ���������Ҫ����������ļ������\r\n\r\n���� [��һ��(N)] ������'
!define MUI_WELCOMEFINISHPAGE_BITMAP "modern-wizard.bmp"

;!define MUI_PAGE_CUSTOMFUNCTION_PRE WelcomePageSetupLinkPre
;!define MUI_PAGE_CUSTOMFUNCTION_SHOW WelcomePageSetupLinkShow

!insertmacro MUI_PAGE_WELCOME

!define mui_page_customfunction_show setcaption
!define mui_licensepage_text_top ""
!define mui_page_header_subtext '�ڰ�װ���ѹ���������� 2.0.0.1097��֮ǰ�����Ķ���Ȩ$\r$\nЭ�顣'
!insertmacro mui_page_license "license.txt"
; ��װĿ¼ѡ��ҳ��
!define mui_page_header_text "��ѡ��װĿ¼"
!define mui_page_header_subtext ""
!define mui_page_customfunction_show setcaption1
!insertmacro MUI_PAGE_DIRECTORY

Page custom component ;leave
; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��װ���ҳ��
!define MUI_PAGE_CUSTOMFUNCTION_PRE WelcomePageSetupLinkPre
!define MUI_PAGE_CUSTOMFUNCTION_SHOW ChageFONT
;!define mui_page_customfunction_leave ;leaves


!insertmacro MUI_PAGE_FINISH

; ��װж�ع���ҳ��
!insertmacro MUI_UNPAGE_INSTFILES

; ��װ�����������������
!insertmacro MUI_LANGUAGE "SimpChinese"
VIProductVersion "2.0.0.1097"

VIAddVersionKey /LANG=2052 "ProductName" "Sogou Explorer"
VIAddVersionKey /LANG=2052 "Comments" "�ѹ����������"
VIAddVersionKey /LANG=2052 "CompanyName" "Sogou.com"
VIAddVersionKey /LANG=2052 "LegalCopyright" "(C) Sogou.com Inc. All rights reserved."
VIAddVersionKey /LANG=2052 "FileDescription" "Sogou Explorer Setup"
VIAddVersionKey /LANG=2052 "FileVersion" "2.0.0.1097"
VIAddVersionKey /LANG=2052  "PrivateBuild" "000" ;�����ڲ�����˵��
VIAddVersionKey /LANG=2052  "SpecialBuild" "3326" ;�����ڲ�����˵��

; ��װԤ�ͷ��ļ�
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; ------ MUI �ִ����涨����� ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "sogou_explorer_2.0.0.1097_3326.exe"
InstallDir "$PROGRAMFILES\My application"
ShowInstDetails hide
ShowUnInstDetails show
BrandingText "�ѹ����������"





Section "MainSection" SEC01
;File "license.txt"
;Sleep 10000
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateDirectory "$SMPROGRAMS\My application"
  CreateShortCut "$SMPROGRAMS\My application\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\My application\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

/******************************
 *  �����ǰ�װ�����ж�ز���  *
 ******************************/
Function .onInit

  ;Extract InstallOptions files
  ;$PLUGINSDIR will automatically be removed when the installer closes

  InitPluginsDir
  File /oname=$PLUGINSDIR\io.ini "io.ini"
  FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"

  Delete "$SMPROGRAMS\My application\Uninstall.lnk"
  Delete "$SMPROGRAMS\My application\Website.lnk"

  RMDir "$SMPROGRAMS\My application"

  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
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
Function setcaption
SendMessage $hwndparent ${wm_settext} 0 "STR:�ѹ���������� 2.0.0.1097 ��װ�����֤Э��"
FunctionEnd
Function setcaption1
SendMessage $hwndparent ${wm_settext} 0 "STR:�ѹ���������� 2.0.0.1097 ��װ����װ�ļ���"
FunctionEnd
Function component
!insertmacro MUI_HEADER_TEXT $(PAGE_TITLE) $(PAGE_SUBTITLE)

 Push ${TEMP1}

    InstallOptions::dialog "$PLUGINSDIR\io.ini"
    Pop ${TEMP1}

  Pop ${TEMP1}
FunctionEnd
Function WelcomePageSetupLinkPre

!insertmacro MUI_INSTALLOPTIONS_READ $0 "ioSpecial.ini" "Settings" "Numfields"
IntOp $0 $0 + 8
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Settings" "Numfields" "$0"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 3" "Text" "�ѹ���������� 2.0.0.1097 �Ѱ�װ�����ϵͳ������[�ر�] �رմ��򵼡�"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 3" "Bottom" "65" ;��Сԭ�е����ֿ򣬱����ڸ�
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 4" "Type" "checkbox"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 4" "State" "1"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 4" "Text" "���������ѹ����������"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 4" "Left" "120"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 4" "Right" "262"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 4" "Top" "65"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 4" "Bottom" "85"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 5" "Type" "checkbox"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 5" "State" "0"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 5" "Text" "�鿴������־"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 5" "Left" "120"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 5" "Right" "262"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 5" "Top" "85"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 5" "Bottom" "105"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 6" "Type" "Label"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 6" "Text" "���������������ѹ�����������û�����Ľ��ƻ���"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 6" "Left" "120"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 6" "Right" "362"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 6" "Top" "110"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 6" "Bottom" "130"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 7" "Type" "Label"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 7" "Text" "ͨ�����Ĳ��룬�����ܹ���ȡ����ʹ��ϰ����Ϣ��Э$\r$\n����Ʒ�Ľ������ǲ����ȡ�κ���˽��ص���Ϣ����Ӱ����$\r$\n������ʹ�á�"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 7" "Left" "140"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 7" "Right" "362"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 7" "Top" "120"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 7" "Bottom" "130"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 8" "Type" "Label"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 8" "Text" "����Ʒ�Ľ������ǲ����ȡ�κ���˽��ص���Ϣ����Ӱ����"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 8" "Left" "120"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 8" "Right" "362"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 8" "Top" "130"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 8" "Bottom" "140"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 9" "Type" "Label"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 9" "Text" "������ʹ�á�"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 9" "Left" "120"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 9" "Right" "362"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 9" "Top" "140"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 9" "Bottom" "150"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 10" "Type" "Checkbox"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 10" "State" "0"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 10" "Text" "��Ը����������ѹ�����������Ĳ�Ʒ����"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 10" "Left" "120"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 10" "Right" "362"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 10" "Top" "155"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 10" "Bottom" "165"

!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 11" "Type" "label"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 11" "Text" "��������ʱ�ڡ��������˵���ѡ���˳��ƻ���"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 11" "Left" "160"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 11" "Right" "362"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 11" "Top" "165"
!insertmacro MUI_INSTALLOPTIONS_WRITE "ioSpecial.ini" "Field 11" "Bottom" "175"

FunctionEnd
function ChageFONT
!insertmacro MUI_INSTALLOPTIONS_READ $DLGITEM "ioSpecial.ini" "Field 2" "HWND"

  CreateFont $1 "$(^Font)" "$(^FontSize)" "400"
SendMessage $DLGITEM ${WM_SETFONT} $1 1

GetDlgItem $0 $MUI_HWND 1203
SetCtlColors $0 "000000" "FFFFFF"

GetDlgItem $0 $MUI_HWND 1204
SetCtlColors $0 "000000" "FFFFFF"

GetDlgItem $0 $MUI_HWND 1205
SetCtlColors $0 "000000" "FFFFFF"

GetDlgItem $0 $MUI_HWND 1207
SetCtlColors $0 "000000" "FFFFFF"


GetDlgItem $0 $MUI_HWND 1208
SetCtlColors $0 "000000" "FFFFFF"


GetDlgItem $0 $MUI_HWND 1209
SetCtlColors $0 "000000" "FFFFFF"


GetDlgItem $0 $MUI_HWND 1210
SetCtlColors $0 "000000" "FFFFFF"


GetDlgItem $0 $MUI_HWND 1206
SetCtlColors $0 "000000" "FFFFFF"


GetDlgItem $0 $HWNDPARENT  1
SendMessage $0 ${WM_SETTEXT} $1 "STR:�ر�"
functionend
;Function leaves
;MessageBox mb_ok "OVER"
;FunctionEnd
;Function leave
;messagebox MB_OK "leave"
;FunctionEnd
