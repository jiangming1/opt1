#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         jm

 Script Function:
	�ύ���������

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <IE.au3>
#include <MsgBoxConstants.au3>
Local $aArray = FileReadToArray("�Զ�����.txt")
Local $aArray1 = FileReadToArray("newhua�Զ�����url.txt")
For $i = 0 To UBound($aArray1) - 1 ; Loop through the array.
   $submiturl=$aArray1[$i]
   $soft_id=StringMid ( $submiturl, 32 ,6 )
   Local $oIE = _IECreate($submiturl)
   Local $ovalue= _IEGetObjByName($oIE, "content")
   $oramdom= $aArray[Random(0,  UBound($aArray1) - 1, 1)]
   $ovalue.value=$oramdom
   Local $ovalue= _IEGetObjByName($oIE, "soft_id")
   $ovalue.value=$soft_id

   Local $ovalue= _IEGetObjById($oIE, "commentForm")
   $ovalue.submit()
   sleep(Random(1, 36,1)*36000)
   _IEQuit($oie)
Next
