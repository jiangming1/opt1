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
	png3("�ܼ��������Ѱ�")
	png1("�ܼ��������Ѱ�")
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
Func _ImageResize($sInImage, $sOutImage, $iW, $iH)
    Local $hWnd, $hDC, $hBMP, $hImage1, $hImage2, $hGraphic, $CLSID, $i = 0
    $hWnd = _WinAPI_GetDesktopWindow()
    $hDC = _WinAPI_GetDC($hWnd)
    $hBMP = _WinAPI_CreateCompatibleBitmap($hDC, $iW, $iH)
    _WinAPI_ReleaseDC($hWnd, $hDC)
    _GDIPlus_Startup()
    $hImage1 = _GDIPlus_BitmapCreateFromHBITMAP ($hBMP)
    ;Load the image you want to resize.
    $hImage2 = _GDIPlus_ImageLoadFromFile($sInImage)
    ;Get the graphic context of the blank bitmap
    $hGraphic = _GDIPlus_ImageGetGraphicsContext ($hImage1)
    ;Draw the loaded image onto the blank bitmap at the size you want
    _GDIPLus_GraphicsDrawImageRect($hGraphic, $hImage2, 0, 0, $iW, $iW)
    ;Get the encoder of to save the resized image in the format you want.
    ;$CLSID = _GDIPlus_EncodersGetCLSID($Ext)
    ;Generate a number for out file that doesn't already exist, so you don't overwrite an existing image.
    ;Do
;        $i += 1
 ;   Until (Not FileExists($sOP & $i & "_" & $sOF))
    ;Prefix the number to the begining of the output filename
;    $sOutImage = $sOP & $i & "_" & $sOF
    ;Save the new resized image.
    _GDIPlus_ImageSaveToFileEx($hImage1, $sOutImage, $CLSID)
    ;Clean up and shutdown GDIPlus.
    _GDIPlus_ImageDispose($hImage1)
    _GDIPlus_ImageDispose($hImage2)
    _GDIPlus_GraphicsDispose ($hGraphic)
    _WinAPI_DeleteObject($hBMP)
    _GDIPlus_Shutdown()

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
    $hFont = _GDIPlus_FontCreate ($hFamily, 50, 1) ;����������� ($hFamily��������ľ��, 50��$iUnit����ָ���ĵ�λ�����������С, 0��������)
    $tLayout = _GDIPlus_RectFCreate (260+25*(11-5), 556, 0,0) ;����$tagGDIPRECTF�ṹ (350�������Ͻ�X����, 45�������Ͻ�Y����, 0���ο��, 0���θ߶�)
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
    $hFont = _GDIPlus_FontCreate ($hFamily, 7, 1) ;����������� ($hFamily��������ľ��, 50��$iUnit����ָ���ĵ�λ�����������С, 0��������)
    $tLayout = _GDIPlus_RectFCreate (10, 0, 0,0) ;����$tagGDIPRECTF�ṹ (350�������Ͻ�X����, 45�������Ͻ�Y����, 0���ο��, 0���θ߶�)
    $aInfo = _GDIPlus_GraphicsMeasureString ($hGraphic,""&$String1, $hFont, $tLayout, $hFormat) ;�����ַ����ߴ� ($hGraphicͼ�ζ�����, $String1Ҫ���Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $tLayout���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���)
    $hMatrix = _GDIPlus_MatrixCreate() ;��������ʼ�����Դ�������Matrix����
    $nAngle = 0
    _GDIPlus_MatrixRotate($hMatrix, $nAngle, "False") ;��ת���� ($hMatrix--Matrix������, $nAngle--��ת�ĽǶ�. ����ָ��ʱ�ӷ�����ת., "False"--True - ָ����ת����λ�����)
    _GDIPlus_GraphicsSetTransform($hGraphic, $hMatrix) ;��ȡGraphics������豸�����ľ�� ($hGraphic--ͼ�ζ�����, $hMatrix--ָ����������ռ�ľ������ľ��)
    _GDIPlus_GraphicsDrawStringEx ($hGraphic, ""&$string1, $hFont, $aInfo[0], $hFormat, $hBrush) ;�����ַ���($hGraphicͼ�ζ�����, $string1�������Ƶ��ַ���, $hFont�����ַ���ʹ�õ�����ľ��, $aInfo[0]���ַ�����$tagGDIPRECTF�ṹ, $hFormat�����ַ������ַ�����ʽ���, $hBrush�����ַ����Ļ�ˢ���)
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