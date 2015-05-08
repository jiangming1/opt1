#include <Word.au3>

Local $sPath = @ScriptDir & "\"
Local $search = FileFindFirstFile($sPath & "*.jpg")

; ��������Ƿ�ɹ�
If $search = -1 Then
	MsgBox(4096, "Error", "No images found")
	Exit
EndIf

Local $oWordApp = _WordCreate()
Local $oDoc = _WordDocGetCollection($oWordApp, 0)

While 1
	Local $file = FileFindNextFile($search)
	If @error Then ExitLoop
	Local $oShape = _WordDocAddPicture($oDoc, $sPath & $file, 0, 1)
	If Not @error Then $oShape.Range.InsertAfter(@CRLF)
WEnd
$odoc.Range.InsertAfter( "��óͨ����Ʊ" & @CRLF _
						 & "ȡƱ��֤�룺" & @CRLF _
						 & "����" & @MON & "��" & @MDAY & "��ǰʹ����Ч")
; �ر��������
FileClose($search)