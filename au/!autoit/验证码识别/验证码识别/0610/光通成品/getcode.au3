#include <GDIPlus.au3>
#include <array.au3>
#include <file.au3>

;~ InetGet("http://passport.cdcgames.net/VerifyCode.aspx","code.jpg",1)

Global $TempNum=0
Global $FirstNum=0
Global $SecondNum=0
Global $ThirdNum=0
Global $FourthNum=0
Global $CodeNum=""

Global $Line1
Global $Line2
Global $Line22
Global $Line3
Global $Line33
Global $Line4
Global $Line44
Global $Line5
Global $Line55
Global $Line6
Global $Line66
Global $Line7
Global $Line77
Global $Line8
Global $Line88
Global $Line9
Global $Line99
Global $Line10
Global $Line102
Global $Line11
Global $Line112
Global $Line12

Global $ZeroNums12="000000000000"
Global $ZeroNums18="000000000000000000"
Global $ZeroNums24="000000000000000000000000"
Global $ZeroNums36="000000000000000000000000000000000000"
Global $ZeroNums48="000000000000000000000000000000000000000000000000"
Global $aRecords
Global $aRray[12]

Global $Row=0     ;��������
Global $Cro=0      ;����



;_ArrayDisplay($a_Image,"����������(һά����)")

Func myArrayChangeSC($func_array, $func_sc_type=0, $func_sc=0x777777, $func_bg=0xffffff);�����е���ɫֵ���ڰױ仯
        If Not IsArray($func_array) Or $func_sc_type<1 Or $func_sc_type>3 Or $func_sc_type=0 Then Return $func_array
        If UBound($func_array,2)>0 Then;��ά
                Local $i_width=UBound($func_array,1)
                Local $i_height=UBound($func_array,2)
                Local $a_return[$i_width][$i_height], $x, $y, $s
                For $y=0 To $i_height-1
                        For $x= 0 To $i_width-1
                                $a_return[$x][$y]= $func_array[$x][$y]
                                Select
                                Case $func_sc_type=1;�ڰ�
                                        If $a_return[$x][$y]>=$func_sc Then
                                                $a_return[$x][$y]=$func_bg
                                        Else
                                                $a_return[$x][$y]=0
                                        EndIf
                                Case $func_sc_type=2;����ڰ�
                                        If $a_return[$x][$y]<$func_sc Then
                                                $a_return[$x][$y]=$func_bg
                                        Else
                                                $a_return[$x][$y]=0
                                        EndIf
                                Case $func_sc_type=3;�൱��=1,����ɫ��ԭɫ����(���Ǳ���ԭɫ)
                                        If $a_return[$x][$y]>=$func_sc Then
                                                $a_return[$x][$y]=$func_bg
                                        EndIf
                                EndSelect
                        Next
                Next
        Else
                Local $i_height=UBound($func_array)
                Local $a_return[$i_height], $y
                For $y=0 To $i_height-1
                        $a_return[$y] = myChangeRegExpSC($func_array[$y], $func_sc_type, $func_sc, $func_bg);����仯
                Next
        EndIf
        Return $a_return
EndFunc

;���������������ǹ�myArrayChangeSCʹ�õ�,������ϸ������
Func myChangeRegExpSC($func_string, $func_sc_type=0, $func_sc=0xeeeeee, $func_bg=0xffffff);�������ڰױ仯
        If $func_string="" Or $func_sc_type<1 Or $func_sc_type>3 Or Mod(StringLen($func_string),6)<>0 Then Return $func_string
        $func_string = StringRegExpReplace($func_string, ".{6}", "$0,")
        $func_sc = myGetRegExpSC($func_sc)
        ;ConsoleWrite($func_sc&@CRLF)
        $func_string = StringRegExpReplace($func_string,$func_sc,"______")
        Select
        Case $func_sc_type=1
                $func_string = StringRegExpReplace($func_string,"[0-9A-F]{6},","000000")
                $func_string = StringReplace($func_string,"______,",Hex($func_bg,6))
        Case $func_sc_type=2
                $func_string = StringRegExpReplace($func_string,"[0-9A-F]{6},",Hex($func_bg,6))
                $func_string = StringReplace($func_string,"______,","000000")
        Case $func_sc_type=3
                $func_string = StringReplace($func_string,"______,",Hex($func_bg,6))
                $func_string = StringReplace($func_string,",", "")
        EndSelect 
        Return $func_string
EndFunc
Func myGetRegExpSC($func_sc=0x777777);��ȡ�仯�ڰ��ٽ�ֵ��������ʽ,��myChangeRegExpSC����
        $func_sc=Hex($func_sc,6)
        Local $i,$s,$s_RegExp
        For $i=1 To 6
                $s=StringLeft($func_sc,$i)
                If StringRight($s,1)<>"F" Then
                        Select
                        Case $i=6
                                $s_RegExp &= myRegExp(StringLeft($s,5)) & myRegExp(StringRight($s,1))
                        Case $i=5
                                $s_RegExp &=myRegExp(Hex(Number("0x"&$s)+1,$i))&"[0-9A-F]|"
                        Case Else
                                $s_RegExp &=myRegExp(Hex(Number("0x"&$s)+1,$i)) & "[0-9A-F]{"&6-$i&"}|"
                        EndSelect
                EndIf
        Next
        If StringRight($s_RegExp,1)="|" Then $s_RegExp=StringTrimRight($s_RegExp,1)
        Return $s_RegExp
EndFunc
Func myRegExp($func_string);��myGetRegExpSC����,���ַ�ת����
        If $func_string="" Then Return ""
        Local $s_RegExp="", $s_tmp=""
        For $i=1 To StringLen($func_string)
                $s_tmp=Number("0x"&StringMid($func_string, $i,1))
                Select
                Case $s_tmp<9
                        $s_RegExp &="["&$s_tmp &"-9A-F]"
                Case $s_tmp=9
                        $s_RegExp &="[9A-F]"
                Case $s_tmp=0xF
                        $s_RegExp &="[F]"
                Case Else
                        $s_RegExp &="["&Hex($s_tmp,1)&"-F]"
                EndSelect
        Next
        Return $s_RegExp
EndFunc

;����Ϊǰ���Ѿ�˵�����ĺ���,��ͼ���ļ������ά����
;-----------------------------------------------------------------------------------------------

Func myReadImageToArray($s_ImageFile, $b_Array2d=False);�ɹ��򷵻�����.ʧ�ܷ���0.$b_Array2d=True���ض�ά����,=False����һά����
    Local $hBitmap, $BitmapData, $i_width, $i_height, $Scan0, $pixelData, $s_BMPData, $i_Stride
        _GDIPlus_Startup()

        $hBitmap = _GDIPlus_BitmapCreateFromFile($s_ImageFile)
        If @error Then 
                _GDIPlus_ShutDown ()
                Return 0;��Ч��ͼ���ļ���δ�ҵ����ļ�
        EndIf
        
        $i_width = _GDIPlus_ImageGetWidth($hBitmap)
        $Row=$i_width
        $i_height = _GDIPlus_ImageGetHeight($hBitmap)
        $Cro=$i_height
        
    $BitmapData = _GDIPlus_BitmapLockBits($hBitmap, 0, 0, $i_width, $i_height, $GDIP_ILMREAD, $GDIP_PXF24RGB)
        ;MsgBox(0,$hBitmap,$BitmapData)
        ;If @error Then ......;
    $i_Stride = DllStructGetData($BitmapData, "Stride");Stride - Offset, in bytes, between consecutive scan lines of the bitmap. If the stride is positive, the bitmap is top-down. If the stride is negative, the bitmap is bottom-up.
    $Scan0 = DllStructGetData($BitmapData, "Scan0");Scan0 - Pointer to the first (index 0) scan line of the bitmap.
    $pixelData = DllStructCreate("ubyte lData[" & (Abs($i_Stride) * $i_height) & "]", $Scan0)
        ;��Ҫʹ�ùٷ���̳���ṩ��Abs($i_Stride) * $i_height-1,�����޷���ȷ����gif���������
        ;MsgBox(0,"",$pixelData)
    $s_BMPData = DllStructGetData($pixelData, "lData")
        
    $s_BMPData = StringTrimLeft($s_BMPData,2);ȥ��ͷ��"0x"
    _GDIPlus_BitmapUnlockBits($hBitmap, $BitmapData)
        
    _GDIPlus_ImageDispose($hBitmap)
        _WinAPI_DeleteObject ($hBitmap)
        _GDIPlus_Shutdown()
        
        If $b_Array2d Then;Ҫ�󷵻ض�ά����
                Local $a_return[$i_width][$i_height], $x, $y, $s
                For $y=0 To $i_height-1
                        $s=StringMid($s_BMPData, $y*($i_Stride*2)+1, $i_width*6)
                        ;��Ҫʹ��һЩ�����������$s=StringMid($s_BMPData, $y*($i_width*6)+1, $i_width*6),��ʵ�ʲ���,�÷�ʽ�޷���ȷ����:
                        ;GIF����,���������ݵ�ͼ���ļ�(һ�����ݼ��ܷ�ʽ),���߶�ҳͼ���ļ�,��Ȼ��Щ���αȽ��ټ�,��ͬ
                        For $x= 0 To $i_width-1
                                $a_return[$x][$y]= Number("0x"&StringMid($s,$x*6+1 ,6))
                        Next
                Next
        Else;Ҫ�󷵻�һά����
                Local $a_return[$i_height], $y
                For $y=0 To $i_height-1
                        $a_return[$y]=StringMid($s_BMPData, $y*($i_Stride*2)+1, $i_width*6)
                        ;����˵��
                Next
        EndIf
        Return $a_return
EndFunc  ;==>myReadImageToArray

        
Func ReadFirstNum()   ;��ȡ��һ���ַ�

      CheckNum1()
      CheckNum2()
      CheckNum3()
      CheckNum4()
      CheckNum5()
      CheckNum6()
      CheckNum7()
      CheckNum8()
      CheckNum9()
      CheckNum0()
      $FirstNum=$TempNum
EndFunc

Func ReadSecondNum()   ;��ȡ �ڶ����ַ�
for $m=1 to $aRecords[0] Step 1    ;�� �ַ�������������60���ַ�
    $aRecords[$m]=StringTrimLeft($aRecords[$m],60)
Next

      CheckNum1()
      CheckNum2()
      CheckNum3()
      CheckNum4()
      CheckNum5()
      CheckNum6()
      CheckNum7()
      CheckNum8()
      CheckNum9()
      CheckNum0()
$SecondNum=$TempNum
EndFunc

Func ReadThirdNum()   ;��ȡ�������ַ�
for $m=1 to $aRecords[0] Step 1   ;���ַ������ٴ����� ����60λ
    $aRecords[$m]=StringTrimLeft($aRecords[$m],60)
Next
      CheckNum1()
      CheckNum2()
      CheckNum3()
      CheckNum4()
      CheckNum5()
      CheckNum6()
      CheckNum7()
      CheckNum8()
      CheckNum9()
      CheckNum0()
$ThirdNum=$TempNum
EndFunc

Func ReadFourthNum()  ;��ȡ���ĸ��ַ�
for $m=1 to $aRecords[0] Step 1  ;�ٴ�����60
    $aRecords[$m]=StringTrimLeft($aRecords[$m],60)
Next
      CheckNum1()
      CheckNum2()
      CheckNum3()
      CheckNum4()
      CheckNum5()
      CheckNum6()
      CheckNum7()
      CheckNum8()
      CheckNum9()
      CheckNum0()
$FourthNum=$TempNum
EndFunc

Func ChuShiHua()   ;��ʼ������
$Line1=""
$Line2=""
$Line22=""
$Line3=""
$Line33=""
$Line4=""
$Line44=""
$Line5=""
$Line55=""
$Line6=""
$Line66=""
$Line7=""
$Line77=""
$Line8=""
$Line88=""
$Line9=""
$Line99=""
$Line10=""
$Line102=""
$Line11=""
$Line112=""
$Line12=""

EndFunc


Func CheckNum1()     ;�ж�����1
;������Ϣ;~ 1=��һ�� 43-54 �ڶ��� 31-54 ���� �� �� �� �� �� �� ʮ ʮһ ʮ���� 43-54
ChuShiHua()
                $Line1=StringLeft(StringTrimLeft($aRecords[1],42),12)
                $Line2=StringLeft(StringTrimLeft($aRecords[2],30),24)                
                $Line3=StringLeft(StringTrimLeft($aRecords[3],42),12)                
                $Line4=StringLeft(StringTrimLeft($aRecords[4],42),12)                
                $Line5=StringLeft(StringTrimLeft($aRecords[5],42),12)                
                $Line6=StringLeft(StringTrimLeft($aRecords[6],42),12)                
                $Line7=StringLeft(StringTrimLeft($aRecords[7],42),12)                
                $Line8=StringLeft(StringTrimLeft($aRecords[8],42),12)                
        $Line9=StringLeft(StringTrimLeft($aRecords[9],42),12)                
                $Line10=StringLeft(StringTrimLeft($aRecords[10],42),12)                
                $Line11=StringLeft(StringTrimLeft($aRecords[11],42),12)
                $Line12=StringLeft(StringTrimLeft($aRecords[12],42),12)
;MsgBox(0,"check1",$Line1&"|"&$Line2&"|"&$Line22&"|"&$Line3&"|"&$Line33&"|"&$Line4&"|"&$Line44&"|"&$Line5&"|"&$Line55&"|"&$Line6&"|"&$Line66&"|"&$Line7&"|"&$Line77&"|"&$Line8&"|"&$Line88&"|"&$Line9&"|"&$Line99&"|"&$Line10&"|"&$Line102&"|"&$Line11&"|"&$Line112&"|"&$Line12)
                if $Line1=$ZeroNums12 And $Line3=$ZeroNums12 And $Line4=$ZeroNums12 And $Line5=$ZeroNums12 And $Line6=$ZeroNums12 And $Line7=$ZeroNums12 And $Line8=$ZeroNums12 And $Line9=$ZeroNums12 And $Line10=$ZeroNums12 And $Line11=$ZeroNums12 And $Line12=$ZeroNums12 And $Line2=$ZeroNums24 Then
                        $TempNum="1"
                EndIf

                
        EndFunc
        

Func CheckNum2()     ;�ж�����2
;������Ϣ ;~ 2=��һ�� 37-60 �ڶ��� 31-42 �� 55-66 ������ 25-36 �� 61-72 ���� ���� 61-72 ������ 55-66 ������ 49-60 �ڰ��� 43-54 �ھ��� 37-48 ��ʮ�� 31-42 ��ʮһ�� 25-36 ��ʮ���� 25-72
ChuShiHua()                
        $Line1=StringLeft(StringTrimLeft($aRecords[1],36),12)
                $Line2=StringLeft(StringTrimLeft($aRecords[2],30),12)        
                $Line22=StringLeft(StringTrimLeft($aRecords[2],54),12)
                $Line3=StringLeft(StringTrimLeft($aRecords[3],24),12)
                $Line33=StringLeft(StringTrimLeft($aRecords[3],60),12)                
                $Line4=StringLeft(StringTrimLeft($aRecords[4],60),12)                        
                $Line5=StringLeft(StringTrimLeft($aRecords[5],60),12)                        
                $Line6=StringLeft(StringTrimLeft($aRecords[6],54),12)                        
                $Line7=StringLeft(StringTrimLeft($aRecords[7],48),12)                
                $Line8=StringLeft(StringTrimLeft($aRecords[8],42),12)                
        $Line9=StringLeft(StringTrimLeft($aRecords[9],36),12)                
                $Line10=StringLeft(StringTrimLeft($aRecords[10],30),12)                
                $Line11=StringLeft(StringTrimLeft($aRecords[11],24),12)
                $Line12=StringLeft(StringTrimLeft($aRecords[12],24),48)
;MsgBox(0,"Check2",$Line1&"|"&$Line2&"|"&$Line22&"|"&$Line3&"|"&$Line33&"|"&$Line4&"|"&$Line44&"|"&$Line5&"|"&$Line55&"|"&$Line6&"|"&$Line66&"|"&$Line7&"|"&$Line77&"|"&$Line8&"|"&$Line88&"|"&$Line9&"|"&$Line99&"|"&$Line10&"|"&$Line102&"|"&$Line11&"|"&$Line112&"|"&$Line12)

                if $Line1=$ZeroNums12 And $Line2=$ZeroNums12 And $Line3=$ZeroNums12 And $Line22=$ZeroNums12 And $Line33=$ZeroNums12 And $Line4=$ZeroNums12 And $Line5=$ZeroNums12 And $Line6=$ZeroNums12 And $Line7=$ZeroNums12 And $Line8=$ZeroNums12 And $Line9=$ZeroNums12 And $Line10=$ZeroNums12 And $Line11=$ZeroNums12 And $Line12=$ZeroNums48 Then
                        $TempNum="2"
                EndIf

                
        EndFunc

Func CheckNum3()     ;�ж�����3
;������Ϣ;~ 3=��һ ʮ���� 37-60  �ڶ� ʮһ��  31-42 �� 55-66 ���� ʮ�� 25-36 �� 61-72  ���� �� ���� 61-72 ���� ���� 55-66 ������ 43-60 
ChuShiHua()
                $Line1=StringLeft(StringTrimLeft($aRecords[1],36),24)
                $Line2=StringLeft(StringTrimLeft($aRecords[2],30),12)        
                $Line22=StringLeft(StringTrimLeft($aRecords[2],54),12)
                $Line3=StringLeft(StringTrimLeft($aRecords[3],24),12)
                $Line33=StringLeft(StringTrimLeft($aRecords[3],60),12)                
                $Line4=StringLeft(StringTrimLeft($aRecords[4],60),12)                        
                $Line5=StringLeft(StringTrimLeft($aRecords[5],54),12)                        
                $Line6=StringLeft(StringTrimLeft($aRecords[6],42),18)                        
                $Line7=StringLeft(StringTrimLeft($aRecords[7],54),12)                
                $Line8=StringLeft(StringTrimLeft($aRecords[8],60),12)                        
        $Line9=StringLeft(StringTrimLeft($aRecords[9],60),12)                        
                $Line10=StringLeft(StringTrimLeft($aRecords[10],24),12)        
            $Line102=StringLeft(StringTrimLeft($aRecords[10],60),12)                
                $Line11=StringLeft(StringTrimLeft($aRecords[11],30),12)
        $Line112=StringLeft(StringTrimLeft($aRecords[11],54),12)
                $Line12=StringLeft(StringTrimLeft($aRecords[12],36),24)

;MsgBox(0,"check3",$Line1&"|"&$Line2&"|"&$Line22&"|"&$Line3&"|"&$Line33&"|"&$Line4&"|"&$Line44&"|"&$Line5&"|"&$Line55&"|"&$Line6&"|"&$Line66&"|"&$Line7&"|"&$Line77&"|"&$Line8&"|"&$Line88&"|"&$Line9&"|"&$Line99&"|"&$Line10&"|"&$Line102&"|"&$Line11&"|"&$Line112&"|"&$Line12)

                if  $Line1=$ZeroNums24 And $Line12=$ZeroNums24 And $Line2=$ZeroNums12 And $Line22=$ZeroNums12 And $Line3=$ZeroNums12 And $Line33=$ZeroNums12 And $Line4=$ZeroNums12 And $Line5=$ZeroNums12 And $Line7=$ZeroNums12 And $Line8=$ZeroNums12 And $Line9=$ZeroNums12 And $Line10=$ZeroNums12 And $Line102=$ZeroNums12 And $Line11=$ZeroNums12 And $Line112=$ZeroNums12 And $Line6=$ZeroNums18 Then
                        $TempNum="3"
                EndIf

        EndFunc

Func CheckNum4()     ;�ж�����4
;������Ϣ;~ 4=��һ�� 55-66 �ڶ� ���� 49-66 ������ 43-66 ���� ���� 37-48 �� 55-66 ������ 31-42 �� 55-66 �ڰ��� 25-36 �� 55-66 �ھ��� 25-72 ��ʮ ʮһ ʮ���� 55-66
ChuShiHua()
                $Line1=StringLeft(StringTrimLeft($aRecords[1],54),12)
                $Line2=StringLeft(StringTrimLeft($aRecords[2],48),18)        
                $Line3=StringLeft(StringTrimLeft($aRecords[3],48),18)                
                $Line4=StringLeft(StringTrimLeft($aRecords[4],42),24)                        
                $Line5=StringLeft(StringTrimLeft($aRecords[5],36),12)        
                $Line55=StringLeft(StringTrimLeft($aRecords[5],54),12)        
                $Line6=StringLeft(StringTrimLeft($aRecords[6],36),12)        
        $Line66=StringLeft(StringTrimLeft($aRecords[6],54),12)                        
                $Line7=StringLeft(StringTrimLeft($aRecords[7],30),12)        
            $Line77=StringLeft(StringTrimLeft($aRecords[7],54),12)
                $Line8=StringLeft(StringTrimLeft($aRecords[8],24),12)        
        $Line88=StringLeft(StringTrimLeft($aRecords[8],54),12)        
        $Line9=StringLeft(StringTrimLeft($aRecords[9],24),48)                
                $Line10=StringLeft(StringTrimLeft($aRecords[10],54),12)                
                $Line11=StringLeft(StringTrimLeft($aRecords[11],54),12)
                $Line12=StringLeft(StringTrimLeft($aRecords[12],54),12)

;MsgBox(0,"check4",$Line1&"|"&$Line2&"|"&$Line22&"|"&$Line3&"|"&$Line33&"|"&$Line4&"|"&$Line44&"|"&$Line5&"|"&$Line55&"|"&$Line6&"|"&$Line66&"|"&$Line7&"|"&$Line77&"|"&$Line8&"|"&$Line88&"|"&$Line9&"|"&$Line99&"|"&$Line10&"|"&$Line102&"|"&$Line11&"|"&$Line112&"|"&$Line12)

                if $Line1=$ZeroNums12 And $Line5=$ZeroNums12 And $Line55=$ZeroNums12 And $Line6=$ZeroNums12 And $Line66=$ZeroNums12 And $Line7=$ZeroNums12 And $Line77=$ZeroNums12 And $Line8=$ZeroNums12 And $Line88=$ZeroNums12 And $Line10=$ZeroNums12 And $Line11=$ZeroNums12 And $Line12=$ZeroNums12 And $Line9=$ZeroNums48 And $Line2=$ZeroNums18 And $Line3=$ZeroNums18 And $Line4=$ZeroNums24 Then
                        $TempNum="4"
                EndIf

                
        EndFunc        

Func CheckNum5()     ;�ж�����5
;������Ϣ;~ 5=��һ�� 25-72 �ڶ� �� ���� 25-36 ������ 25-60 ������ 25-42 �� 55-66 ���� �� ���� 61-72 ��ʮ�� 25-36 �� 61-72 ��ʮһ�� 31-42 �� 55-66 ��ʮ���� 37-60
ChuShiHua()
                $Line1=StringLeft(StringTrimLeft($aRecords[1],24),48)
                $Line2=StringLeft(StringTrimLeft($aRecords[2],24),12)        
                $Line3=StringLeft(StringTrimLeft($aRecords[3],24),12)                
                $Line4=StringLeft(StringTrimLeft($aRecords[4],24),12)                        
                $Line5=StringLeft(StringTrimLeft($aRecords[5],24),36)        
                $Line6=StringLeft(StringTrimLeft($aRecords[6],24),18)        
        $Line66=StringLeft(StringTrimLeft($aRecords[6],54),12)                        
                $Line7=StringLeft(StringTrimLeft($aRecords[7],60),12)        
                $Line8=StringLeft(StringTrimLeft($aRecords[8],60),12)                
        $Line9=StringLeft(StringTrimLeft($aRecords[9],60),12)                
                $Line10=StringLeft(StringTrimLeft($aRecords[10],24),12)        
            $Line102=StringLeft(StringTrimLeft($aRecords[10],60),12)        
                $Line11=StringLeft(StringTrimLeft($aRecords[11],30),12)
                $Line112=StringLeft(StringTrimLeft($aRecords[11],54),12)        
                $Line12=StringLeft(StringTrimLeft($aRecords[12],36),24)
;MsgBox(0,"check5",$Line1&"|"&$Line2&"|"&$Line22&"|"&$Line3&"|"&$Line33&"|"&$Line4&"|"&$Line44&"|"&$Line5&"|"&$Line55&"|"&$Line6&"|"&$Line66&"|"&$Line7&"|"&$Line77&"|"&$Line8&"|"&$Line88&"|"&$Line9&"|"&$Line99&"|"&$Line10&"|"&$Line102&"|"&$Line11&"|"&$Line112&"|"&$Line12)

                if $Line6=$ZeroNums18 And $Line1=$ZeroNums48 And $Line5=$ZeroNums36 And $Line2=$ZeroNums12 And $Line3=$ZeroNums12 And $Line4=$ZeroNums12 And $Line66=$ZeroNums12 And $Line7=$ZeroNums12 And $Line102=$ZeroNums12 And $Line8=$ZeroNums12 And $Line112=$ZeroNums12 And $Line9=$ZeroNums12 And $Line10=$ZeroNums12 And $Line11=$ZeroNums12 And  $Line12=$ZeroNums24 Then
                        
                        $TempNum="5"
                EndIf
        EndFunc        

Func CheckNum6()     ;�ж�����6
;������Ϣ;~ 6=��һ ʮ���� 37-60  �ڶ� ʮһ�� 31-42�� 55-66 ���� �� �� �� ʮ�� 25-36 �� 61-72 ������ 25-36 ������ 25-60 ������ 25-42 �� 55-66
ChuShiHua()
                $Line1=StringLeft(StringTrimLeft($aRecords[1],36),24)
                $Line2=StringLeft(StringTrimLeft($aRecords[2],30),12)        
        $Line22=StringLeft(StringTrimLeft($aRecords[2],54),12)
                $Line3=StringLeft(StringTrimLeft($aRecords[3],24),12)
        $Line33=StringLeft(StringTrimLeft($aRecords[3],60),12)                
                $Line4=StringLeft(StringTrimLeft($aRecords[4],24),12)                        
                $Line5=StringLeft(StringTrimLeft($aRecords[5],24),36)        
                $Line6=StringLeft(StringTrimLeft($aRecords[6],24),18)        
        $Line66=StringLeft(StringTrimLeft($aRecords[6],54),12)                        
                $Line7=StringLeft(StringTrimLeft($aRecords[7],24),12)
        $Line77=StringLeft(StringTrimLeft($aRecords[7],60),12)        
                $Line8=StringLeft(StringTrimLeft($aRecords[8],24),12)
        $Line88=StringLeft(StringTrimLeft($aRecords[8],60),12)                        
                $Line9=StringLeft(StringTrimLeft($aRecords[9],24),12)
        $Line99=StringLeft(StringTrimLeft($aRecords[9],60),12)                
                $Line10=StringLeft(StringTrimLeft($aRecords[10],24),12)        
            $Line102=StringLeft(StringTrimLeft($aRecords[10],60),12)        
                $Line11=StringLeft(StringTrimLeft($aRecords[11],30),12)
                $Line112=StringLeft(StringTrimLeft($aRecords[11],54),12)        
                $Line12=StringLeft(StringTrimLeft($aRecords[12],36),24)
;MsgBox(0,"check6",$Line1&"|"&$Line2&"|"&$Line22&"|"&$Line3&"|"&$Line33&"|"&$Line4&"|"&$Line44&"|"&$Line5&"|"&$Line55&"|"&$Line6&"|"&$Line66&"|"&$Line7&"|"&$Line77&"|"&$Line8&"|"&$Line88&"|"&$Line9&"|"&$Line99&"|"&$Line10&"|"&$Line102&"|"&$Line11&"|"&$Line112&"|"&$Line12)

                if $Line6=$ZeroNums18 And $Line5=$ZeroNums36 And $Line2=$ZeroNums12 And $Line22=$ZeroNums12 And $Line3=$ZeroNums12 And $Line33=$ZeroNums12 And $Line4=$ZeroNums12 And $Line66=$ZeroNums12 And $Line7=$ZeroNums12 And $Line77=$ZeroNums12 And $Line8=$ZeroNums12 And $Line88=$ZeroNums12 And $Line9=$ZeroNums12 And $Line99=$ZeroNums12 And $Line10=$ZeroNums12 And $Line102=$ZeroNums12 And $Line11=$ZeroNums12 And $Line112=$ZeroNums12 And  $Line1=$ZeroNums24 And $Line12=$ZeroNums24 Then
                        $TempNum=6
                EndIf                
        EndFunc        

Func CheckNum7()     ;�ж�����7
;������Ϣ;~ 7=��һ�� 25-72 �ڶ� ���� 61-72 ���� �� ���� 55-66 ���� �� ���� 49-60 ��ʮ ʮһ ʮ���� 43-54
ChuShiHua()
                $Line1=StringLeft(StringTrimLeft($aRecords[1],24),48)
                $Line2=StringLeft(StringTrimLeft($aRecords[2],60),12)        
                $Line3=StringLeft(StringTrimLeft($aRecords[3],60),12)                
                $Line4=StringLeft(StringTrimLeft($aRecords[4],54),12)                        
                $Line5=StringLeft(StringTrimLeft($aRecords[5],54),12)        
                $Line6=StringLeft(StringTrimLeft($aRecords[6],54),12)                        
                $Line7=StringLeft(StringTrimLeft($aRecords[7],48),12)        
                $Line8=StringLeft(StringTrimLeft($aRecords[8],48),12)                
        $Line9=StringLeft(StringTrimLeft($aRecords[9],48),12)                
                $Line10=StringLeft(StringTrimLeft($aRecords[10],42),12)        
                $Line11=StringLeft(StringTrimLeft($aRecords[11],42),12)        
                $Line12=StringLeft(StringTrimLeft($aRecords[12],42),12)
;MsgBox(0,"check7",$Line1&"|"&$Line2&"|"&$Line22&"|"&$Line3&"|"&$Line33&"|"&$Line4&"|"&$Line44&"|"&$Line5&"|"&$Line55&"|"&$Line6&"|"&$Line66&"|"&$Line7&"|"&$Line77&"|"&$Line8&"|"&$Line88&"|"&$Line9&"|"&$Line99&"|"&$Line10&"|"&$Line102&"|"&$Line11&"|"&$Line112&"|"&$Line12)

                if $Line1=$ZeroNums48 And $Line2=$ZeroNums12 And $Line3=$ZeroNums12 And $Line4=$ZeroNums12 And $Line5=$ZeroNums12 And $Line6=$ZeroNums12 And $Line7=$ZeroNums12 And $Line8=$ZeroNums12 And $Line9=$ZeroNums12 And $Line10=$ZeroNums12 And $Line11=$ZeroNums12 And $Line12=$ZeroNums12 Then
                        $TempNum="7"
                EndIf
        EndFunc        

Func CheckNum8()     ;�ж�����8
;������Ϣ;~ 8=��һ ʮ���� 37-60 �ڶ� �� �� ʮһ�� 31-42 �� 55-66 ���� �� �� �� ʮ�� 25-36 �� 61-72 ������ 37-60 
ChuShiHua()
                $Line1=StringLeft(StringTrimLeft($aRecords[1],36),24)
                $Line2=StringLeft(StringTrimLeft($aRecords[2],30),12)        
                $Line22=StringLeft(StringTrimLeft($aRecords[2],54),12)
                $Line3=StringLeft(StringTrimLeft($aRecords[3],24),12)        
                $Line33=StringLeft(StringTrimLeft($aRecords[3],60),12)        
                $Line4=StringLeft(StringTrimLeft($aRecords[4],24),12)        
                $Line44=StringLeft(StringTrimLeft($aRecords[4],60),12)                        
                $Line5=StringLeft(StringTrimLeft($aRecords[5],30),12)
                $Line55=StringLeft(StringTrimLeft($aRecords[5],54),12)
                $Line6=StringLeft(StringTrimLeft($aRecords[6],36),24)                        
                $Line7=StringLeft(StringTrimLeft($aRecords[7],30),12)        
                $Line77=StringLeft(StringTrimLeft($aRecords[7],54),12)
                $Line8=StringLeft(StringTrimLeft($aRecords[8],24),12)                
                $Line88=StringLeft(StringTrimLeft($aRecords[8],60),12)        
        $Line9=StringLeft(StringTrimLeft($aRecords[9],24),12)        
                $Line99=StringLeft(StringTrimLeft($aRecords[9],60),12)
                $Line10=StringLeft(StringTrimLeft($aRecords[10],24),12)        
                $Line102=StringLeft(StringTrimLeft($aRecords[10],60),12)
                $Line11=StringLeft(StringTrimLeft($aRecords[11],30),12)
                $Line112=StringLeft(StringTrimLeft($aRecords[11],54),12)
                $Line12=StringLeft(StringTrimLeft($aRecords[12],36),24)
;MsgBox(0,"check8",$Line1&"|"&$Line2&"|"&$Line22&"|"&$Line3&"|"&$Line33&"|"&$Line4&"|"&$Line44&"|"&$Line5&"|"&$Line55&"|"&$Line6&"|"&$Line66&"|"&$Line7&"|"&$Line77&"|"&$Line8&"|"&$Line88&"|"&$Line9&"|"&$Line99&"|"&$Line10&"|"&$Line102&"|"&$Line11&"|"&$Line112&"|"&$Line12)

                if $Line1=$ZeroNums24 And $Line12=$ZeroNums24 And $Line6=$ZeroNums24 And $Line9=$ZeroNums12 And $Line2=$ZeroNums12 And $Line22=$ZeroNums12 And $Line3=$ZeroNums12 And $Line33=$ZeroNums12 And $Line4=$ZeroNums12 And $Line44=$ZeroNums12 And $Line5=$ZeroNums12 And $Line55=$ZeroNums12 And $Line7=$ZeroNums12 And $Line77=$ZeroNums12 And $Line8=$ZeroNums12 And $Line88=$ZeroNums12 And $Line9=$ZeroNums12 And $Line10=$ZeroNums12 And $Line102=$ZeroNums12 And $Line11=$ZeroNums12 And $Line112=$ZeroNums12 Then
                        $TempNum="8"
                EndIf
        EndFunc        

Func CheckNum9()     ;�ж�����7
;������Ϣ;~ 9=��һ ʮ���� 37-60 �ڶ� ʮһ�� 31-42 �� 55-66 ���� �� �� �� ʮ�� 25-36 �� 61-72 ������ 31-42 �� 55-72 �ڰ��� 37-72 �ھ��� 61-72
ChuShiHua()
                $Line1=StringLeft(StringTrimLeft($aRecords[1],36),24)
                $Line2=StringLeft(StringTrimLeft($aRecords[2],30),12)        
                $Line22=StringLeft(StringTrimLeft($aRecords[2],54),12)
                $Line3=StringLeft(StringTrimLeft($aRecords[3],24),12)        
                $Line33=StringLeft(StringTrimLeft($aRecords[3],60),12)        
                $Line4=StringLeft(StringTrimLeft($aRecords[4],24),12)        
                $Line44=StringLeft(StringTrimLeft($aRecords[4],60),12)                        
                $Line5=StringLeft(StringTrimLeft($aRecords[5],24),12)                
            $Line55=StringLeft(StringTrimLeft($aRecords[5],60),12)                
                $Line6=StringLeft(StringTrimLeft($aRecords[6],24),12)                        
                $Line66=StringLeft(StringTrimLeft($aRecords[6],60),12)                
                $Line7=StringLeft(StringTrimLeft($aRecords[7],30),12)        
                $Line77=StringLeft(StringTrimLeft($aRecords[7],54),18)        
                $Line8=StringLeft(StringTrimLeft($aRecords[8],36),36)                
        $Line9=StringLeft(StringTrimLeft($aRecords[9],60),12)                
                $Line10=StringLeft(StringTrimLeft($aRecords[10],24),12)        
                $Line102=StringLeft(StringTrimLeft($aRecords[10],60),12)                
                $Line11=StringLeft(StringTrimLeft($aRecords[11],30),12)                
                $Line112=StringLeft(StringTrimLeft($aRecords[11],54),12)
                $Line12=StringLeft(StringTrimLeft($aRecords[12],36),24)
;MsgBox(0,"check9",$Line1&"|"&$Line2&"|"&$Line22&"|"&$Line3&"|"&$Line33&"|"&$Line4&"|"&$Line44&"|"&$Line5&"|"&$Line55&"|"&$Line6&"|"&$Line66&"|"&$Line7&"|"&$Line77&"|"&$Line8&"|"&$Line88&"|"&$Line9&"|"&$Line99&"|"&$Line10&"|"&$Line102&"|"&$Line11&"|"&$Line112&"|"&$Line12)

                if $Line8=$ZeroNums36 And $Line1=$ZeroNums24 And $Line12=$ZeroNums24 And $Line77=$ZeroNums18 And $Line2=$ZeroNums12 And $Line22=$ZeroNums12 And $Line3=$ZeroNums12 And $Line33=$ZeroNums12 And $Line4=$ZeroNums12 And $Line44=$ZeroNums12 And $Line5=$ZeroNums12 And $Line55=$ZeroNums12 And $Line6=$ZeroNums12 And $Line66=$ZeroNums12 And $Line7=$ZeroNums12 And $Line9=$ZeroNums12 And $Line10=$ZeroNums12 And $Line102=$ZeroNums12 And $Line11=$ZeroNums12 And $Line112=$ZeroNums12 Then
                        $TempNum="9"
                EndIf
        EndFunc        

Func CheckNum0()     ;�ж�����0
;������Ϣ;~ 0=��һ ʮ���� 37-60  �ڶ� �� ʮ ʮһ��  31-42 �� 55-66  ���� �� �� �� �� ���� 25-36 �� 61-72 
ChuShiHua()
                $Line1=StringLeft(StringTrimLeft($aRecords[1],36),24)
                $Line2=StringLeft(StringTrimLeft($aRecords[2],30),12)        
                $Line22=StringLeft(StringTrimLeft($aRecords[2],54),12)
                $Line3=StringLeft(StringTrimLeft($aRecords[3],30),12)        
                $Line33=StringLeft(StringTrimLeft($aRecords[3],54),12)        
                $Line4=StringLeft(StringTrimLeft($aRecords[4],24),12)        
                $Line44=StringLeft(StringTrimLeft($aRecords[4],60),12)                        
                $Line5=StringLeft(StringTrimLeft($aRecords[5],24),12)
                $Line55=StringLeft(StringTrimLeft($aRecords[5],60),12)
                $Line6=StringLeft(StringTrimLeft($aRecords[6],24),12)        
                $Line66=StringLeft(StringTrimLeft($aRecords[6],60),12)                        
                $Line7=StringLeft(StringTrimLeft($aRecords[7],24),12)
                $Line77=StringLeft(StringTrimLeft($aRecords[7],60),12)
                $Line8=StringLeft(StringTrimLeft($aRecords[8],24),12)                
                $Line88=StringLeft(StringTrimLeft($aRecords[8],60),12)        
        $Line9=StringLeft(StringTrimLeft($aRecords[9],24),12)        
                $Line99=StringLeft(StringTrimLeft($aRecords[9],60),12)
                $Line10=StringLeft(StringTrimLeft($aRecords[10],30),12)        
                $Line102=StringLeft(StringTrimLeft($aRecords[10],54),12)
                $Line11=StringLeft(StringTrimLeft($aRecords[11],30),12)
                $Line112=StringLeft(StringTrimLeft($aRecords[11],54),12)
                $Line12=StringLeft(StringTrimLeft($aRecords[12],36),24)
;MsgBox(0,"check0",$Line1&"|"&$Line2&"|"&$Line22&"|"&$Line3&"|"&$Line33&"|"&$Line4&"|"&$Line44&"|"&$Line5&"|"&$Line55&"|"&$Line6&"|"&$Line66&"|"&$Line7&"|"&$Line77&"|"&$Line8&"|"&$Line88&"|"&$Line9&"|"&$Line99&"|"&$Line10&"|"&$Line102&"|"&$Line11&"|"&$Line112&"|"&$Line12)

                if $Line1=$ZeroNums24 And $Line12=$ZeroNums24 And $Line2=$ZeroNums12 And $Line22=$ZeroNums12 And $Line3=$ZeroNums12 And $Line33=$ZeroNums12 And $Line4=$ZeroNums12 And $Line44=$ZeroNums12 And $Line5=$ZeroNums12 And $Line55=$ZeroNums12 And $Line6=$ZeroNums12 And $Line66=$ZeroNums12 And $Line7=$ZeroNums12 And $Line77=$ZeroNums12 And $Line8=$ZeroNums12 And $Line88=$ZeroNums12 And $Line9=$ZeroNums12 And $Line99=$ZeroNums12 And $Line10=$ZeroNums12 And $Line102=$ZeroNums12 And $Line11=$ZeroNums12 And $Line112=$ZeroNums12 Then
                        $TempNum="0"
                EndIf
        EndFunc        
;~ StartReadCode();������
;������ִ�еĴ���---��ʼ
Func StartReadCode()

$a_Image = myReadImageToArray("code.jpg")
$a_Image = myArrayChangeSC($a_Image, 1, 0x777777, 0xffffff)


if FileExists("code.txt") Then                
        FileDelete("code.txt")
EndIf

for $line=5 to $Cro-4 Step 1

FileWriteLine("code.txt",$a_Image[$line])

Next

If Not _FileReadToArray("code.txt",$aRecords) Then
   MsgBox(4096,"Error", " Error reading log to Array     error:" & @error)
   Exit
EndIf

ReadFirstNum()
ReadSecondNum()
ReadThirdNum()
ReadFourthNum()
$CodeNum=$FirstNum&$SecondNum&$ThirdNum&$FourthNum
Return $CodeNum
EndFunc

;������ִ�еĴ���---����
;~ 60��120��180


;������Ϣ
;~ [����������]
;~ 1=��һ�� 43-54 �ڶ��� 31-54 ���� �� �� �� �� �� �� ʮ ʮһ ʮ���� 43-54
;~ 2=��һ�� 37-60 �ڶ��� 31-42 �� 55-66 ������ 25-36 �� 61-72 ���� ���� 61-72 ������ 55-66 ������ 49-60 �ڰ��� 43-54 �ھ��� 37-48 ��ʮ�� 31-42 ��ʮһ�� 25-36 ��ʮ���� 25-72
;~ 3=��һ ʮ���� 37-60  �ڶ� ʮһ��  31-42 �� 55-66 ���� ʮ�� 25-36 �� 61-72  ���� �� ���� 61-72 ���� ���� 55-66 ������ 43-60 
;~ 4=��һ�� 55-66 �ڶ� ���� 49-66 ������ 43-66 ���� ���� 37-48 �� 55-66 ������ 31-42 �� 55-66 �ڰ��� 25-36 �� 55-66 �ھ��� 25-72 ��ʮ ʮһ ʮ���� 55-66
;~ 5=��һ�� 25-72 �ڶ� �� ���� 25-36 ������ 25-60 ������ 25-42 �� 55-66 ���� �� ���� 61-72 ��ʮ�� 25-36 �� 61-72 ��ʮһ�� 31-42 �� 55-66 ��ʮ���� 37-60
;~ 6=��һ ʮ���� 37-60  �ڶ� ʮһ�� 31-42�� 55-66 ���� �� �� �� ʮ�� 25-36 �� 61-72 ������ 25-36 ������ 25-60 ������ 25-42 �� 55-66
;~ 7=��һ�� 25-72 �ڶ� ���� 61-72 ���� �� ���� 55-66 ���� �� ���� 49-60 ��ʮ ʮһ ʮ���� 43-54
;~ 8=��һ ʮ���� 37-60 �ڶ� �� �� ʮһ�� 31-42 �� 55-66 ���� �� �� �� ʮ�� 25-36 �� 61-72 ������ 37-60 
;~ 9=��һ ʮ���� 37-60 �ڶ� ʮһ�� 31-42 �� 55-66 ���� �� �� �� ʮ�� 25-36 �� 61-72 ������ 31-42 �� 55-72 �ڰ��� 37-72 �ھ��� 61-72
;~ 0=��һ ʮ���� 37-60  �ڶ� �� ʮ ʮһ��  31-42 �� 55-66  ���� �� �� �� �� ���� 25-36 �� 61-72
