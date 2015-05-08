#include <GDIPlus.au3>
#include <ScreenCapture.au3>

#include <IE.au3>

#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WindowsConstants.au3>


;����������ͼƬ
;http://books.google.com.hk/books?id=CHswO9obwk8C&pg=PR5&img=1&zoom=3&hl=zh-CN&sig=ACfU3U2fo1zQrISnmSnUuXmvCad8n9ygMA&w=1025
;���Ϊ��142k
;��������ȴ��526k
;Ϊʲô��

Opt('MustDeclareVars', 1)

Local $f = @ScriptDir & "\ask_test_1.html"
If FileExists($f) == 0 Then
        FileWrite($f, "<html> <head><title>Googlebook</title></head> <body> <img  border=1 src=http://books.google.com.hk/books?id=CHswO9obwk8C&pg=PR5&img=1&zoom=3&hl=zh-CN&sig=ACfU3U2fo1zQrISnmSnUuXmvCad8n9ygMA&w=1025  /> </body> </html>")
        Sleep(1000)
EndIf

Local $oIE = _IECreate($f)
Sleep(1000)

setClipboard()
Sleep(1000)
_Main()

Func _Main()
        Local $hBitmap, $hImage, $sCLSID, $tData, $tParams

        _GDIPlus_Startup()

        _ClipBoard_Open(0)
        $hImage = _ClipBoard_GetDataEx($CF_BITMAP);$CF_BITMAP ;$CF_METAFILEPICT
        If $hImage == 0 Then
                MsgBox(0, "", "ճ����û�ҵ�")
        Else
                $hImage = _GDIPlus_BitmapCreateFromHBITMAP($hImage)

                $sCLSID = _GDIPlus_EncodersGetCLSID("PNG")

                Local $tt = @ScriptDir & "\GDIPlus_Image2.jpg"
                ConsoleWrite($tt & @CRLF)
                _GDIPlus_ImageSaveToFileEx($hImage, $tt, $sCLSID)

                _ClipBoard_Close()
        EndIf

        _GDIPlus_Shutdown()
EndFunc   ;==>_Main


;����ճ����
Func setClipboard()
        Local $oIE = _IEAttach("Googlebook")
        If @error = 0 Then
                Local $oImgs = _IEImgGetCollection($oIE)
                For $oImg In $oImgs
                        ;����ͼƬ
                        Local $oPic = $oIE.Document.body.createControlRange()
                        $oPic.Add($oImg)
                        $oPic.execCommand("Copy")
                        MsgBox(0, "", "ͼƬ������", 2)

                        ExitLoop
                Next
        Else
                MsgBox(0, "", "html����ҳ��û�ҵ�", 2)
        EndIf
EndFunc   ;==>setClipboard