#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <IE.au3>


;Run("�Զ�ȷ��.exe")
Local $oIE = _IECreateEmbedded()
GUICreate("Embedded Web control Test", 1000, 580, 0, 0, _
		$WS_OVERLAPPEDWINDOW + $WS_VISIBLE + $WS_CLIPSIBLINGS + $WS_CLIPCHILDREN)
GUICtrlCreateObj($oIE, 0, 40, 1000, 560)

GUISetState() ;Show GUI
Local $file = FileOpen("�Զ�����.txt", 0)
If $file = -1 Then
	MsgBox(0, "Error", "Unable to open file.")
	Exit
EndIf
While 1
	$pingjia = FileReadLine($file)
	If @error = -1 Then ExitLoop
'�ܼ�����ʤ
	_IENavigate($oIE, "http://www.onlinedown.net/soft/117854.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ��Ų���
	_IENavigate($oIE, "http://www.onlinedown.net/soft/117858.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ��Źܵ���
	_IENavigate($oIE, "http://www.onlinedown.net/soft/118112.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ��Ź���ʤ
	_IENavigate($oIE, "http://www.onlinedown.net/soft/118112.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)

'�ܼ�������ά��
	_IENavigate($oIE, "http://www.onlinedown.net/soft/117859.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ��ų���
	_IENavigate($oIE, "http://www.onlinedown.net/soft/307499.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ��Ž�����
	_IENavigate($oIE, "http://www.onlinedown.net/soft/117862.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ�����𽨲�
	_IENavigate($oIE, "http://www.onlinedown.net/soft/307497.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ��ŷ�װ��ҵerp
	_IENavigate($oIE, "http://www.onlinedown.net/soft/117837.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'http://www.onlinedown.net/soft/117837.htm
'�ܼ�����ʤ�ܼҸ߼�ERP��Ѱ�
	_IENavigate($oIE, "http://www.onlinedown.net/soft/307565.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ���ϵ��_��װЬñ�߼������� 5.2.1
	_IENavigate($oIE, "http://www.onlinedown.net/soft/307495.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ���ϵ��-��ʤ�ܼҸ߼���ó��Ѱ�
_IENavigate($oIE, "http://www.onlinedown.net/soft/307493.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ���ϵ��_ʳƷ��ҵ�߼�������
_IENavigate($oIE, "http://www.onlinedown.net/soft/307496.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ�����Ƭ����ϵͳ 4.2.8
_IENavigate($oIE, "http://www.onlinedown.net/soft/118427.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ���ϵ��_��ʤ�ܼҸ߼���ó��Ѱ� 5.2.1
_IENavigate($oIE, "http://www.onlinedown.net/soft/307492.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ���ϵ��_��ʤ�ܼҸ߼���ó��Ѱ� 5.2.1
_IENavigate($oIE, "http://www.onlinedown.net/soft/307492.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ���ϵ��_�ͻ���ϵ����ϵͳ
_IENavigate($oIE, "http://www.onlinedown.net/soft/537490.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ�����Ѳֿ���������ɫ�� 5.15
_IENavigate($oIE, "http://www.onlinedown.net/soft/530145.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ�����Ѳֿ���������ɫ����ɢ����
_IENavigate($oIE, "http://www.onlinedown.net/soft/117833.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼҿյ�
_IENavigate($oIE, "http://www.onlinedown.net/soft/117855.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ���-������Ա����ϵͳ 2.0
_IENavigate($oIE, "http://www.onlinedown.net/soft/522144.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ����콢���������Ѱ� 2.00
_IENavigate($oIE, "http://www.onlinedown.net/soft/564231.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�ܼ����콢���������Ѱ� 2.00
_IENavigate($oIE, "http://www.onlinedown.net/soft/564231.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'�齫��
_IENavigate($oIE, "http://www.onlinedown.net/soft/522143.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)
'����erp
_IENavigate($oIE, "http://www.onlinedown.net/soft/117838.htm")
	_IELoadWait($oIE)
	$ouname = _IEGetObjById($oIE, "content")
	$ouname.value = $pingjia
    $ouname = _IEGetObjById($oIE, "soft_id")
	$ouname.value = 	117854
	$ouname = _IEGetObjById($oIE, "commentForm")
	$ouname.submit()
	Sleep(500)
	_IELoadWait($oIE)

'http://www.onlinedown.net/soft/117838.htm
'http://www.onlinedown.net/soft/522143.htm
http://www.onlinedown.net/soft/537490.htm
WEnd
;http://www.onlinedown.net/soft/118174.htm
; Waiting for user to close the window
; Waiting for user to close the window
While 1
	Local $msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			ExitLoop

	EndSelect
WEnd

GUIDelete()

Exit