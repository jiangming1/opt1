#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         jm

 Script Function:
	�Զ����밲װ�����ϴ���down�ļ���

#ce ----------------------------------------------------------------------------
Global Const $key[27]=['߹','��','��','��','��','��','��','��','آ','آ','��','��','��','��','Ŷ','ſ','��','Ȼ','��','��','��','��','��','��','Ѿ','��','��']
$server = 'www.caiwuhao.com'
$username = 'username1'
$pass = 'jmdjsj903291A'
#include <GDIPlus.au3>
#include <Inet.au3>
#include <IE.au3>
#include <File.au3>
#include <FTPEx.au3>
#include <Date.au3>
#include <Word.au3>

;makensis.exe /V1 myscript.nsi
$oie=_IECreate("http://www.caiwuhao.com/s")
$oid=_IEGetObjById($oie,"t11")

$keyword=StringSplit($oid.innertext, ",")
_IEQuit($oie)
$keywordcount=UBound($keyword)-2
For $i1 = 1 To $keywordcount
	$appname=StringSplit($keyword[$i1], ":")
	IniWrite("�ܵ���(���)/Example.ini", "General", "type", $appname[1])
;����ͳ��
	;createword($appname[2])
	Local $aArray = FileReadToArray("embedded/InfoBefore1.txt")
	For $i = 0 To UBound($aArray) - 1 ; Loop through the array.
		$aArray[$i]=StringReplace($aArray[$i],"�ܼ���",$appname[2])
	Next
	_FileWriteFromArray("embedded/InfoBefore.txt", $aArray, 1)

	Local $aArray = FileReadToArray("embedded/License1.txt")
	For $i = 0 To UBound($aArray) - 1 ; Loop through the array.
		$aArray[$i]=StringReplace($aArray[$i],"���ݹܼ������",$appname[2])
	Next
	_FileWriteFromArray("embedded/License.txt", $aArray, 1)

	Local $aArray = FileReadToArray("��д��װ����.au3.nsi")
	For $i = 0 To UBound($aArray) - 1 ; Loop through the array.
		$aArray[$i]=StringReplace($aArray[$i],"My application",$appname[2])
		;$aArray[$i]=StringReplace($aArray[$i],"{app}\��ʤ�ܼҲ���˵����.doc","{app}\"&$appname[2]&".doc")
		$aArray[$i]=StringReplace($aArray[$i],"1.0",StringReplace(StringReplace(_DateTimeFormat(_NowCalc(), 2),"-","."),"2014","14"))
	Next
	_FileWriteFromArray($appname[2]&".nsi", $aArray, 1)
if FileExists ( "Output/"&$appname[2]&".exe")=1 Then
	$Open = _FTP_Open('MyFTP Control')
	$Conn = _FTP_Connect($Open, $server, $username, $pass)
	png1($appname[2]&"��Ѱ�")
	png2($appname[2]&"��Ѱ�")
	png3($appname[2]&"��Ѱ�")
	;$FilePut = _FTP_FilePut($Conn, "��д��װ����1.png","www/"&c($appname[2])&"1.png")
	;$FilePut = _FTP_FilePut($Conn, "��д��װ����2.png","www/"&c($appname[2])&"2.png")
	;$FilePut = _FTP_FilePut($Conn, "��д��װ����3.png","www/"&c($appname[2])&"3.png")
	filecopy("��д��װ����1.png","Output/"&c($appname[2])&"1.png")
	filecopy("��д��װ����2.png","Output/"&c($appname[2])&"2.png")
	filecopy("��д��װ����3.png","Output/"&c($appname[2])&"3.png")
	filecopy("Output/"&$appname[2]&".exe","Output/"&c($appname[2])&".exe")
	;$FilePut = _FTP_FilePut($Conn, "Output/"&$keyword[$i1]&".exe", "www/"&c($keyword[$i1])&".exe")
	FileDelete($appname[2]&".nsi")
Else
	changeMainbmp($appname[2])
	RunWait("C:\Program Files\NSIS\makensis.exe "&$appname[2]&".nsi")
	FileDelete($appname[2]&".nsi")
	$Open = _FTP_Open('MyFTP Control')
	$Conn = _FTP_Connect($Open, $server, $username, $pass)
	png1($appname[2]&"��Ѱ�")
	png2($appname[2]&"��Ѱ�")
	png3($appname[2]&"��Ѱ�")
	filecopy("Output/"&$appname[2]&".exe","Output/"&c($appname[2])&".exe")
	filecopy("��д��װ����1.png","Output/"&c($appname[2])&"1.png")
	filecopy("��д��װ����2.png","Output/"&c($appname[2])&"2.png")
	filecopy("��д��װ����3.png","Output/"&c($appname[2])&"3.png")
	;$FilePut = _FTP_FilePut($Conn, "��д��װ����1.png",c("www/"&$appname[2]&"1.png"))
	;$FilePut = _FTP_FilePut($Conn, "��д��װ����2.png",c("www/"&$appname[2]&"2.png"))
	;$FilePut = _FTP_FilePut($Conn, "��д��װ����3.png",c("www/"&$appname[2]&"3.png"))
	;$FilePut = _FTP_FilePut($Conn, "Output/"&$keyword[$i1]&".exe", "down/"&$keyword[$i1]&".exe")
endif
;_INetMail("1614706254@qq.com", "�����������"&$keyword[$i1]&" ����", "����")
;greenxf��qq.com
;Sleep(1000)
;send("!s")
next
Func createword($name)
	if FileExists ( "{app}/"&$name&".doc")=1 Then
	else
	Local $oWord = _Word_Create(false)
	Local $oDoc = _Word_DocOpen($oWord, @ScriptDir & "\{app}\˵����.doc", Default, Default, True)
	_Word_DocFindReplace($oDoc, "��ʤ�ܼ�", $name)
	_Word_DocSaveAs($oDoc, @ScriptDir & "\{app}\"&$name&".doc")
	_Word_Quit($oWord)
	endif
;�޸�word
EndFunc
Func png3($string1)
    Local $hBitmap1, $hBitmap2, $hImage1, $hImage2, $hGraphic, $width, $height
    _GDIPlus_Startup() ;��ʼ��Microsoft Windows GDI+

    $hImage1 = _GDIPlus_BitmapCreateFromFile("��д��װ����0003.png");
    $hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage1) ;��ȡͼ���ͼ�γ��� $hImage1---ͼ�������
    $hBrush = _GDIPlus_BrushCreateSolid (0xFFffffff) ;����ʵ�Ļ�ˢ����
    $hFormat = _GDIPlus_StringFormatCreate () ;�����ַ�����ʽ����
    $hFamily = _GDIPlus_FontFamilyCreate ("����") ;������������� Times New Roman--------����������
    $hFont = _GDIPlus_FontCreate ($hFamily, 12, 1) ;����������� ($hFamily��������ľ��, 50��$iUnit����ָ���ĵ�λ�����������С, 0��������)
    $tLayout = _GDIPlus_RectFCreate (20, 6, 0,0) ;����$tagGDIPRECTF�ṹ (350�������Ͻ�X����, 45�������Ͻ�Y����, 0���ο��, 0���θ߶�)
    $aInfo = _GDIPlus_GraphicsMeasureString ($hGraphic, $String1, $hFont, $tLayout, $hFormat) ;�����ַ����ߴ� ($hGraphicͼ�ζ�����, $String1Ҫ���Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $tLayout���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���)
    $hMatrix = _GDIPlus_MatrixCreate() ;��������ʼ�����Դ�������Matrix����
    $nAngle = 0
    _GDIPlus_MatrixRotate($hMatrix, $nAngle, "False") ;��ת���� ($hMatrix--Matrix������, $nAngle--��ת�ĽǶ�. ����ָ��ʱ�ӷ�����ת., "False"--True - ָ����ת����λ�����)
    _GDIPlus_GraphicsSetTransform($hGraphic, $hMatrix) ;��ȡGraphics������豸�����ľ�� ($hGraphic--ͼ�ζ�����, $hMatrix--ָ����������ռ�ľ������ľ��)
    _GDIPlus_GraphicsDrawStringEx ($hGraphic, $string1, $hFont, $aInfo[0], $hFormat, $hBrush) ;�����ַ���($hGraphicͼ�ζ�����, $string1�������Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $aInfo[0]���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���, $hBrush�����ַ����Ļ�ˢ���)
	    $hBrush = _GDIPlus_BrushCreateSolid (0xFF000000) ;����ʵ�Ļ�ˢ����
    $hFormat = _GDIPlus_StringFormatCreate () ;�����ַ�����ʽ����
    $hFamily = _GDIPlus_FontFamilyCreate ("΢���ź�") ;������������� Times New Roman--------����������
    $hFont = _GDIPlus_FontCreate ($hFamily, 30, 1) ;����������� ($hFamily��������ľ��, 50��$iUnit����ָ���ĵ�λ�����������С, 0��������)
    $tLayout = _GDIPlus_RectFCreate (170+15*(11-5), 556, 0,0) ;����$tagGDIPRECTF�ṹ (350�������Ͻ�X����, 45�������Ͻ�Y����, 0���ο��, 0���θ߶�)
    $aInfo = _GDIPlus_GraphicsMeasureString ($hGraphic, $String1, $hFont, $tLayout, $hFormat) ;�����ַ����ߴ� ($hGraphicͼ�ζ�����, $String1Ҫ���Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $tLayout���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���)
    $hMatrix = _GDIPlus_MatrixCreate() ;��������ʼ�����Դ�������Matrix����
    $nAngle = 0
    _GDIPlus_MatrixRotate($hMatrix, $nAngle, "False") ;��ת���� ($hMatrix--Matrix������, $nAngle--��ת�ĽǶ�. ����ָ��ʱ�ӷ�����ת., "False"--True - ָ����ת����λ�����)
    _GDIPlus_GraphicsSetTransform($hGraphic, $hMatrix) ;��ȡGraphics������豸�����ľ�� ($hGraphic--ͼ�ζ�����, $hMatrix--ָ����������ռ�ľ������ľ��)
    _GDIPlus_GraphicsDrawStringEx ($hGraphic, $string1, $hFont, $aInfo[0], $hFormat, $hBrush) ;�����ַ���($hGraphicͼ�ζ�����, $string1�������Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $aInfo[0]���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���, $hBrush�����ַ����Ļ�ˢ���)
	;_GDIPLus_GraphicsDrawImageRect($hGraphic, $hImage2, 0, 0, 500, 320)
	$hImage1 = _GDIPlus_ImageResize($hImage1, 500,320) ;resize image
	;500 347
	_GDIPlus_ImageSaveToFile($hImage1, "��д��װ����3.png")
    _GDIPlus_ImageDispose($hImage1)
    _GDIPlus_ImageDispose($hImage2)
    _WinAPI_DeleteObject($hBitmap1)
    _WinAPI_DeleteObject($hBitmap2)
    _GDIPlus_Shutdown()
	;_ImageResize("��д��װ����13.png", "��д��װ����3.png", 500, 420)
EndFunc ;==>_Main

Func png1($string1)
    Local $hBitmap1, $hBitmap2, $hImage1, $hImage2, $hGraphic, $width, $height
    _GDIPlus_Startup() ;��ʼ��Microsoft Windows GDI+

    $hImage1 = _GDIPlus_BitmapCreateFromFile("��д��װ����.png");
    $hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage1) ;��ȡͼ���ͼ�γ��� $hImage1---ͼ�������
    $hBrush = _GDIPlus_BrushCreateSolid (0xFFffffff) ;����ʵ�Ļ�ˢ����
    $hFormat = _GDIPlus_StringFormatCreate () ;�����ַ�����ʽ����
    $hFamily = _GDIPlus_FontFamilyCreate ("����") ;������������� Times New Roman--------����������
    $hFont = _GDIPlus_FontCreate ($hFamily, 11, 1) ;����������� ($hFamily��������ľ��, 50��$iUnit����ָ���ĵ�λ�����������С, 0��������)
    $tLayout = _GDIPlus_RectFCreate (20, 6, 0,0) ;����$tagGDIPRECTF�ṹ (350�������Ͻ�X����, 45�������Ͻ�Y����, 0���ο��, 0���θ߶�)
    $aInfo = _GDIPlus_GraphicsMeasureString ($hGraphic, $String1, $hFont, $tLayout, $hFormat) ;�����ַ����ߴ� ($hGraphicͼ�ζ�����, $String1Ҫ���Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $tLayout���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���)
    $hMatrix = _GDIPlus_MatrixCreate() ;��������ʼ�����Դ�������Matrix����
    $nAngle = 0
    _GDIPlus_MatrixRotate($hMatrix, $nAngle, "False") ;��ת���� ($hMatrix--Matrix������, $nAngle--��ת�ĽǶ�. ����ָ��ʱ�ӷ�����ת., "False"--True - ָ����ת����λ�����)
    _GDIPlus_GraphicsSetTransform($hGraphic, $hMatrix) ;��ȡGraphics������豸�����ľ�� ($hGraphic--ͼ�ζ�����, $hMatrix--ָ����������ռ�ľ������ľ��)
    _GDIPlus_GraphicsDrawStringEx ($hGraphic, $string1, $hFont, $aInfo[0], $hFormat, $hBrush) ;�����ַ���($hGraphicͼ�ζ�����, $string1�������Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $aInfo[0]���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���, $hBrush�����ַ����Ļ�ˢ���)
	$hImage1 = _GDIPlus_ImageResize($hImage1, 500,347) ;resize image
	;500 347

	_GDIPlus_ImageSaveToFile($hImage1, "��д��װ����1.png")
    _GDIPlus_ImageDispose($hImage1)
    _GDIPlus_ImageDispose($hImage2)
    _WinAPI_DeleteObject($hBitmap1)
    _WinAPI_DeleteObject($hBitmap2)
    _GDIPlus_Shutdown()
EndFunc ;==>_Main
Func png2($string1)
    Local $hBitmap1, $hBitmap2, $hImage1, $hImage2, $hGraphic, $width, $height
    _GDIPlus_Startup() ;��ʼ��Microsoft Windows GDI+
    $hImage1 = _GDIPlus_BitmapCreateFromFile("��д��װ����02.png");
    $hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage1) ;��ȡͼ���ͼ�γ��� $hImage1---ͼ�������
    $hBrush = _GDIPlus_BrushCreateSolid (0xFFffffff) ;����ʵ�Ļ�ˢ����
    $hFormat = _GDIPlus_StringFormatCreate () ;�����ַ�����ʽ����
    $hFamily = _GDIPlus_FontFamilyCreate ("����") ;������������� Times New Roman--------����������
    $hFont = _GDIPlus_FontCreate ($hFamily, 11, 1) ;����������� ($hFamily��������ľ��, 50��$iUnit����ָ���ĵ�λ�����������С, 0��������)
    $tLayout = _GDIPlus_RectFCreate (20, 5, 0,0) ;����$tagGDIPRECTF�ṹ (350�������Ͻ�X����, 45�������Ͻ�Y����, 0���ο��, 0���θ߶�)
    $aInfo = _GDIPlus_GraphicsMeasureString ($hGraphic,"��װ - "&$String1, $hFont, $tLayout, $hFormat) ;�����ַ����ߴ� ($hGraphicͼ�ζ�����, $String1Ҫ���Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $tLayout���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���)
    $hMatrix = _GDIPlus_MatrixCreate() ;��������ʼ�����Դ�������Matrix����
    $nAngle = 0
    _GDIPlus_MatrixRotate($hMatrix, $nAngle, "False") ;��ת���� ($hMatrix--Matrix������, $nAngle--��ת�ĽǶ�. ����ָ��ʱ�ӷ�����ת., "False"--True - ָ����ת����λ�����)
    _GDIPlus_GraphicsSetTransform($hGraphic, $hMatrix) ;��ȡGraphics������豸�����ľ�� ($hGraphic--ͼ�ζ�����, $hMatrix--ָ����������ռ�ľ������ľ��)
    _GDIPlus_GraphicsDrawStringEx ($hGraphic, "��װ - "&$string1, $hFont, $aInfo[0], $hFormat, $hBrush) ;�����ַ���($hGraphicͼ�ζ�����, $string1�������Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $aInfo[0]���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���, $hBrush�����ַ����Ļ�ˢ���)
	$hBrush = _GDIPlus_BrushCreateSolid (0xFF000000) ;����ʵ�Ļ�ˢ����
    $hFormat = _GDIPlus_StringFormatCreate () ;�����ַ�����ʽ����
    $hFamily = _GDIPlus_FontFamilyCreate ("����") ;������������� Times New Roman--------����������
    $hFont = _GDIPlus_FontCreate ($hFamily, 12, 1) ;����������� ($hFamily��������ľ��, 50��$iUnit����ָ���ĵ�λ�����������С, 0��������)
    $tLayout = _GDIPlus_RectFCreate (162, 36, 0,0) ;����$tagGDIPRECTF�ṹ (350�������Ͻ�X����, 45�������Ͻ�Y����, 0���ο��, 0���θ߶�)
    $aInfo = _GDIPlus_GraphicsMeasureString ($hGraphic, "��ӭʹ��"&$string1, $hFont, $tLayout, $hFormat) ;�����ַ����ߴ� ($hGraphicͼ�ζ�����, $String1Ҫ���Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $tLayout���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���)
    $hMatrix = _GDIPlus_MatrixCreate() ;��������ʼ�����Դ�������Matrix����
    $nAngle = 0
    _GDIPlus_MatrixRotate($hMatrix, $nAngle, "False") ;��ת���� ($hMatrix--Matrix������, $nAngle--��ת�ĽǶ�. ����ָ��ʱ�ӷ�����ת., "False"--True - ָ����ת����λ�����)
    _GDIPlus_GraphicsSetTransform($hGraphic, $hMatrix) ;��ȡGraphics������豸�����ľ�� ($hGraphic--ͼ�ζ�����, $hMatrix--ָ����������ռ�ľ������ľ��)
    _GDIPlus_GraphicsDrawStringEx ($hGraphic, "��ӭʹ��"&$string1, $hFont, $aInfo[0], $hFormat, $hBrush) ;�����ַ���($hGraphicͼ�ζ�����, $string1�������Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $aInfo[0]���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���, $hBrush�����ַ����Ļ�ˢ���)
	_GDIPlus_ImageSaveToFile($hImage1, "��д��װ����2.png")
    _GDIPlus_ImageDispose($hImage1)
    _GDIPlus_ImageDispose($hImage2)
    _WinAPI_DeleteObject($hBitmap1)
    _WinAPI_DeleteObject($hBitmap2)
    _GDIPlus_Shutdown()
EndFunc

Func changeMainbmp($string1)
    Local $hBitmap1, $hBitmap2, $hImage1, $hImage2, $hGraphic, $width, $height
    _GDIPlus_Startup() ;��ʼ��Microsoft Windows GDI+
    $hImage1 = _GDIPlus_BitmapCreateFromFile("�ܵ���(���)\back1.BMP");
    $hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage1) ;��ȡͼ���ͼ�γ��� $hImage1---ͼ�������
    $hBrush = _GDIPlus_BrushCreateSolid (0xFF000000) ;����ʵ�Ļ�ˢ����
    $hFormat = _GDIPlus_StringFormatCreate () ;�����ַ�����ʽ����
    $hFamily = _GDIPlus_FontFamilyCreate ("΢���ź�") ;������������� Times New Roman--------����������
    $hFont = _GDIPlus_FontCreate ($hFamily, 50, 1) ;����������� ($hFamily��������ľ��, 50��$iUnit����ָ���ĵ�λ�����������С, 0��������)
    $tLayout = _GDIPlus_RectFCreate (260+25*(11-5), 476, 0,0) ;����$tagGDIPRECTF�ṹ (350�������Ͻ�X����, 45�������Ͻ�Y����, 0���ο��, 0���θ߶�)
    $aInfo = _GDIPlus_GraphicsMeasureString ($hGraphic, $String1, $hFont, $tLayout, $hFormat) ;�����ַ����ߴ� ($hGraphicͼ�ζ�����, $String1Ҫ���Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $tLayout���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���)
    $hMatrix = _GDIPlus_MatrixCreate() ;��������ʼ�����Դ�������Matrix����
    $nAngle = 0
    _GDIPlus_MatrixRotate($hMatrix, $nAngle, "False") ;��ת���� ($hMatrix--Matrix������, $nAngle--��ת�ĽǶ�. ����ָ��ʱ�ӷ�����ת., "False"--True - ָ����ת����λ�����)
    _GDIPlus_GraphicsSetTransform($hGraphic, $hMatrix) ;��ȡGraphics������豸�����ľ�� ($hGraphic--ͼ�ζ�����, $hMatrix--ָ����������ռ�ľ������ľ��)
    _GDIPlus_GraphicsDrawStringEx ($hGraphic, $string1, $hFont, $aInfo[0], $hFormat, $hBrush) ;�����ַ���($hGraphicͼ�ζ�����, $string1�������Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $aInfo[0]���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���, $hBrush�����ַ����Ļ�ˢ���)

	_GDIPlus_ImageSaveToFile($hImage1, "�ܵ���(���)\back.bmp")
    _GDIPlus_ImageDispose($hImage1)
    _GDIPlus_ImageDispose($hImage2)
    _WinAPI_DeleteObject($hBitmap1)
    _WinAPI_DeleteObject($hBitmap2)
    _GDIPlus_Shutdown()
EndFunc ;==>_Main

func C($str)
For $i = 1 To StringLen($str)
Local $L
	Switch Dec(StringTrimLeft(StringToBinary(StringMid($str,$i,1)),2))
        Case 32 To 127
                $L&=StringMid($str,$i,1)
        Case 33095 To 62289
                $L&=Chr(97+_C(StringMid($str,$i,1),0,26))
    EndSwitch
Next
Return $l
endfunc
Func _C($s,$f,$e)                                ;�Ľ�����ֵ��
                Local $mid=Int(($e-$f)/2)+$f
                If $mid=$f Then Return $f
            If StringCompare($s,$key[$mid])=0 Then
                    Return $mid
            ElseIf StringCompare($s,$key[$mid])>0 Then
                Return _C($s,$mid,$e)
            ElseIf StringCompare($s,$key[$mid])<0 Then
                Return _C($s,$f,$mid)
                EndIf
EndFunc