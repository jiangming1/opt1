#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#Include <ScreenCapture.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#Include <GuiEdit.au3>
#include <GDIPlus.au3>
#include <file.au3>
#include <Array.au3>
#NoTrayIcon
;~ $Open2  ���ļ�����
;~ $CodeDB  �ַ���������Ϣ
;~ $Row  $Cro    ����������
;~ $aRecords  ��¼����
Global $Open2=0,$CodeDB="",$Cro=0 ,$Row=0,$aRecords="",$SetFlg=False
Global $ResPicPos[4][4]
;~ $BackCorlor  ���屳����ɫ
Global $BackCorlor=0x008080
;~  ���ݿ��ж����߶ȣ���ȣ� ɫ��
Global $iWidth=IniRead(@ScriptDir&"\set.db","set","iwth","10"),$iHeight=IniRead(@ScriptDir&"\set.db","set","ihth","10"),$ColorToRemove=IniRead(@ScriptDir&"\set.db","set","remcolor","0xcccccc")
;��ȡ�ַ��߿�����
Global $Top=0,$Left=0,$Jianju=0,$SetFlgLet="",$CreateMode=""
;�������ʼ��. ÿ���ַ�������
Func chushihua()
	;�϶˿հ���������
	$Top=IniRead(@ScriptDir&"\set.db","set","Top","0")
	;�ַ���ߵĿհ���������
	$Left=IniRead(@ScriptDir&"\set.db","set","Left","0")
	;�ַ����
	$Jianju=IniRead(@ScriptDir&"\set.db","set","Jianju","0")
	$ResPicPos[0][0]=$Left    ;��1���ָ�ͼƬ���Ͻ�X����
	$ResPicPos[0][1]=$Top   ;
	$ResPicPos[0][2]=$iWidth
	$ResPicPos[0][3]=$iHeight
	$ResPicPos[1][0]=$iWidth+$Left+$Jianju   ;��2���ָ�ͼƬ���Ͻ�X���� 
	$ResPicPos[1][1]=$Top  
	$ResPicPos[1][2]=$iWidth
	$ResPicPos[1][3]=$iHeight
	$ResPicPos[2][0]=$iWidth*2+$Left+$Jianju*2   ;��3���ָ�ͼƬ���Ͻ�X����
	$ResPicPos[2][1]=$Top
	$ResPicPos[2][2]=$iWidth
	$ResPicPos[2][3]=$iHeight
	$ResPicPos[3][0]=$iWidth*3+$Left+$Jianju*3   ;��4���ָ�ͼƬ���Ͻ�X����
	$ResPicPos[3][1]=$Top
	$ResPicPos[3][2]=$iWidth
	$ResPicPos[3][3]=$iHeight
EndFunc
chushihua()	
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=C:\Documents and Settings\Administrator\����\code\CodeRead.kxf
$Form1 = GUICreate("CodeReader", 520, 402, 92, 114)
GUISetBkColor($BackCorlor)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
$MainPic = GUICtrlCreatePic("", 24, 16, 160, 40)
$FirstPic = GUICtrlCreatePic("", 24, 80, 28, 28)
$LoadPic = GUICtrlCreateButton("����ͼƬ", 208, 24, 75, 25)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "LoadPicClick")
$MoveLef1 = GUICtrlCreateButton("<", 8, 85, 11, 17)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveLef1Click")
$MoveRight1 = GUICtrlCreateButton(">", 56, 85, 11, 17)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveRight1Click")
$MoveDown1 = GUICtrlCreateButton("\/", 28, 111, 19, 10)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveDown1Click")
$MoveUp1 = GUICtrlCreateButton("/\", 28, 66, 19, 10)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveUp1Click")
$SecondPic = GUICtrlCreatePic("", 96, 80, 28, 28)
$MoveDown2 = GUICtrlCreateButton("\/", 100, 111, 19, 10)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveDown2Click")
$MoveLeft2 = GUICtrlCreateButton("<", 80, 85, 11, 17)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveLeft2Click")
$MoveUp2 = GUICtrlCreateButton("/\", 100, 66, 19, 10)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveUp2Click")
$MoveRight2 = GUICtrlCreateButton(">", 128, 85, 11, 17)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveRight2Click")
$ThirdPic = GUICtrlCreatePic("", 168, 80, 28, 28)
$MoveDown3 = GUICtrlCreateButton("\/", 172, 111, 19, 10)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveDown3Click")
$MoveLeft3 = GUICtrlCreateButton("<", 152, 85, 11, 17)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveLeft3Click")
$MoveUp3 = GUICtrlCreateButton("/\", 172, 66, 19, 10)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveUp3Click")
$MoveRight3 = GUICtrlCreateButton(">", 200, 85, 11, 17)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveRight3Click")
$FourthPic = GUICtrlCreatePic("", 240, 80, 28, 28)
$MoveDown4 = GUICtrlCreateButton("\/", 244, 111, 19, 10)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveDown4Click")
$MoveLeft4 = GUICtrlCreateButton("<", 224, 85, 11, 17)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveLeft4Click")
$MoveUp4 = GUICtrlCreateButton("/\", 244, 66, 19, 10)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveUp4Click")
$MoveRight4 = GUICtrlCreateButton(">", 272, 85, 11, 17)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent(-1, "MoveRight4Click")
$LogList = GUICtrlCreateList("", 304, 24, 209, 370,BitOR($LBS_NOTIFY,$LBS_DISABLENOSCROLL,$WS_HSCROLL,$WS_VSCROLL,$WS_BORDER))
$LogListcontext = GUICtrlCreateContextMenu($LogList)
$ClearMenu = GUICtrlCreateMenuItem("��ռ�¼", $LogListcontext)
GUICtrlSetOnEvent(-1, "ClearMenuClick")
$LogListLb = GUICtrlCreateLabel("������¼", 375, 6, 52, 17)
$FirstInput = GUICtrlCreateInput("", 8, 136, 57, 21)
$SecondInput = GUICtrlCreateInput("", 80, 136, 57, 21)
$ThirdInput = GUICtrlCreateInput("", 152, 136, 57, 21)
$FourthInput = GUICtrlCreateInput("", 224, 136, 57, 21)
$FirstBt = GUICtrlCreateButton("1���", 8, 176, 59, 25)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent($FirstBt, "FirstClick")
$SecondBt = GUICtrlCreateButton("2���", 80, 176, 59, 25)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent($SecondBt, "SecondClick")
$ThirdBt = GUICtrlCreateButton("3���", 152, 176, 59, 25)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent($ThirdBt, "ThirdClick")
$FourthBt = GUICtrlCreateButton("4���", 224, 176, 59, 25)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent($FourthBt, "FourthClick")
$CodeEdit = GUICtrlCreateEdit("", 8, 208, 201, 185)
GUICtrlSetData(-1, "")
$reload = GUICtrlCreateButton("����", 224, 312, 59, 25)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent($reload, "reloadclick")
$quitbt = GUICtrlCreateButton("�˳�", 224, 352, 59, 25)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent($quitbt, "form1close")
$ReadBt = GUICtrlCreateButton("ʶ��", 224, 272, 59, 25)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent($ReadBt, "ReadBtClick")
$ResultLb = GUICtrlCreateLabel("���", 238, 232, 52, 17)
$SetBt = GUICtrlCreateButton(">>", 491, 0, 21, 25)
GUICtrlSetBkColor(-1, $BackCorlor)
GUICtrlSetOnEvent($SetBt, "SetBtClick")
;----���ô�����ʾ
$SetForm = GUICreate("SetForm", 338, 427, 618, 114,"","",WinGetHandle($form1))
GUISetBkColor(BitOR($BackCorlor,0X00FF00))
GUISetOnEvent($GUI_EVENT_CLOSE, "SetCancelClick")
$SetOK = GUICtrlCreateButton("ȷ��", 72, 341, 75, 25)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent($SetOK, "SetOKClick")
$SetCancel = GUICtrlCreateButton("ȡ��", 184, 341, 75, 25)
GUICtrlSetBkColor(-1, 0x008080)
GUICtrlSetOnEvent($SetCancel, "SetCancelClick")
$widthinput = GUICtrlCreateInput("", 48, 144, 41, 21)
$Heightinput = GUICtrlCreateInput("", 136, 144, 41, 21)
$widthlab = GUICtrlCreateLabel("���", 16, 147, 28, 17)
$Heightlab = GUICtrlCreateLabel("�߶�", 104, 147, 28, 17)
$Info = GUICtrlCreateGroup("��֤����Ϣ", 4, -2, 329, 109, BitOR($GUI_SS_DEFAULT_GROUP,$BS_CENTER))
$picwidth = GUICtrlCreateLabel("���:", 24, 37, 71, 17)
$picheight = GUICtrlCreateLabel("�߶�:", 119, 37, 71, 17)
$lettercount = GUICtrlCreateLabel("�ַ�����:", 224, 37, 87, 17)
$everywidth = GUICtrlCreateLabel("ÿ�ַ���:", 24, 84, 87, 17)
$everyheight = GUICtrlCreateLabel("ÿ�ַ���:", 119, 84, 87, 17)
$Label2 = GUICtrlCreateLabel("ÿ�ַ��߿�:", 223, 84, 87, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$msg = GUICtrlCreateLabel("����ÿ���ַ�����", 39, 117, 100, 17)
$ModeSelect = GUICtrlCreateCombo("ѡ��ģ��", 161, 114, 153, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData($ModeSelect, "��ͨ��֤��|ASP��֤��|ASP-II|��ɫ��֤��|��ϵͳ|��˶E��|���¸���|������б")
GUICtrlSetOnEvent($ModeSelect, "ModeSelectChange")
$Colorlab = GUICtrlCreateLabel("��ɫ", 16, 182, 28, 17)
$ColorInput = GUICtrlCreateInput("0XCCCCCC", 48, 178, 129, 21)
$CodeCreateModeCheckBox = GUICtrlCreateCheckbox("�Զ�ģʽ", 120, 208, 73, 17)
GUICtrlSetOnEvent(-1, "CodeCreateModeCheckClick")
$FlgLetterLab = GUICtrlCreateLabel("��־λ(F/0)", 208, 209, 93, 17)
$FlgLetterInput = GUICtrlCreateInput("0", 288, 204, 25, 21)
$ZoomPic = GUICtrlCreatePic("", 16, 210, 100, 100)
$ColorUdMsLab = GUICtrlCreateLabel("����µ���ɫ", 120, 294, 76, 17)
$MousePosLab = GUICtrlCreateLabel("����������", 120, 242, 76, 17)
$PosByPicLab = GUICtrlCreateLabel("���ͼƬ����", 208, 242, 76, 17)
$MousePos = GUICtrlCreateLabel("", 135, 264, 64, 17)
$MouseByPic = GUICtrlCreateLabel("", 212, 264, 64, 17)
$ColorUdMs = GUICtrlCreateLabel("", 208, 294, 64, 17)
$TopInput = GUICtrlCreateInput("0", 216, 144, 25, 21)
$LeftInput = GUICtrlCreateInput("0", 288, 144, 25, 21)
$jianjuInput = GUICtrlCreateInput("2", 216, 176, 25, 21)
$TopLab = GUICtrlCreateLabel("�ϱ�", 184, 147, 28, 17)
$LeftLab = GUICtrlCreateLabel("���", 256, 147, 28, 17)
$jianjuLab = GUICtrlCreateLabel("���", 184, 179, 28, 17)

;-----
GUISwitch($form1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	If $SetFlg= True Then
		Local $MousePosInSet=MouseGetPos()
		Local $Form1Pos=WinGetPos($Form1)
		Local $PosColor=""
		If $MousePosInSet[0]>$Form1Pos[0]+20 And $MousePosInSet[0]<$Form1Pos[0]+190 And $MousePosInSet[1]>$Form1Pos[1]+30 And $MousePosInSet[1]<$Form1Pos[1]+89 Then
			_ScreenCapture_Capture(@TempDir&"\undermouse.bmp",$MousePosInSet[0]-10,$MousePosInSet[1]-10,$MousePosInSet[0]+10,$MousePosInSet[1]+10,False)
	    	GUICtrlSetImage($ZoomPic,@TempDir&"\undermouse.bmp")
			$PosColor=PixelGetColor($MousePosInSet[0],$MousePosInSet[1])
			GUICtrlSetData($ColorUdMs,"0X"&StringTrimLeft(Hex($PosColor),2))
			GUICtrlSetData($MousePos,$MousePosInSet[0]&","&$MousePosInSet[1])
			GUICtrlSetData($MouseByPic,$MousePosInSet[0]-27-$Form1Pos[0]&","&$MousePosInSet[1]-38-$Form1Pos[1])
	    EndIf
		WinMove($SetForm,"",$Form1Pos[0]+$Form1Pos[2],$Form1Pos[1],Default,Default,1)
	EndIf
	Sleep(100)
WEnd
Func CodeCreateModeCheckClick()
	If GUICtrlRead($CodeCreateModeCheckBox)=$GUI_CHECKED Then
		GUICtrlSetData($CodeCreateModeCheckBox,"�ֶ�ģʽ")
		$CreateMode="Auto"
	Else
		GUICtrlSetData($CodeCreateModeCheckBox,"�Զ�ģʽ")
		$CreateMode="Hand"
	EndIf
EndFunc
Func ClearMenuClick()  ;�����ʷ��¼
	GUICtrlSetData($LogList,"")
EndFunc
Func Form1Close() ;����ر�  ɾ����ʱ�ļ�,�˳�.
	FileDelete(@ScriptDir&"\0.bmp")
	FileDelete(@ScriptDir&"\1.bmp")
	FileDelete(@ScriptDir&"\2.bmp")
	FileDelete(@ScriptDir&"\3.bmp")
	Exit
EndFunc
Func ModeSelectChange()
	Switch GUICtrlRead($ModeSelect)
		Case "ASP��֤��"
			GUICtrlSetData($LeftInput,2)
			GUICtrlSetData($TopInput,0)
			GUICtrlSetData($jianjuInput,4)
			GUICtrlSetData($Heightinput,10)
			GUICtrlSetData($widthinput,6)
			GUICtrlSetData($ColorInput,"0XCCCCCC")
			GUICtrlSetData($FlgLetterInput,"0")
		Case "��ͨ��֤��"
			GUICtrlSetData($LeftInput,4)
			GUICtrlSetData($TopInput,5)
			GUICtrlSetData($jianjuInput,2)
			GUICtrlSetData($Heightinput,12)
			GUICtrlSetData($widthinput,8)
			GUICtrlSetData($ColorInput,"0XCCCCCC")
			GUICtrlSetData($FlgLetterInput,"0")
		Case "ASP-II"
			GUICtrlSetData($LeftInput,5)
			GUICtrlSetData($TopInput,1)
			GUICtrlSetData($jianjuInput,1)
			GUICtrlSetData($Heightinput,8)
			GUICtrlSetData($widthinput,5)
			GUICtrlSetData($ColorInput,"0XCCCCCC")
			GUICtrlSetData($FlgLetterInput,"0")
		Case "��ɫ��֤��"
			GUICtrlSetData($LeftInput,6)
			GUICtrlSetData($TopInput,3)
			GUICtrlSetData($jianjuInput,5)
			GUICtrlSetData($Heightinput,13)
			GUICtrlSetData($widthinput,8)
			GUICtrlSetData($ColorInput,"0X999999")
			GUICtrlSetData($FlgLetterInput,"0")
		Case "��ϵͳ"
			GUICtrlSetData($LeftInput,0)
			GUICtrlSetData($TopInput,0)
			GUICtrlSetData($jianjuInput,4)
			GUICtrlSetData($Heightinput,10)
			GUICtrlSetData($widthinput,6)
			GUICtrlSetData($ColorInput,"0XEEEEEE")
			GUICtrlSetData($FlgLetterInput,"0")
		Case "��˶E��"
			GUICtrlSetData($LeftInput,5)
			GUICtrlSetData($TopInput,4)
			GUICtrlSetData($jianjuInput,1)
			GUICtrlSetData($Heightinput,11)
			GUICtrlSetData($widthinput,8)
			GUICtrlSetData($ColorInput,"0X777777")
			GUICtrlSetData($FlgLetterInput,"F")
		Case "���¸���"
			GUICtrlSetData($LeftInput,6)
			GUICtrlSetData($TopInput,1)
			GUICtrlSetData($jianjuInput,4)
			GUICtrlSetData($Heightinput,19)
			GUICtrlSetData($widthinput,9)
			GUICtrlSetData($ColorInput,"0X777777")
			GUICtrlSetData($FlgLetterInput,"0")
		Case "������б"
			GUICtrlSetData($LeftInput,4)
			GUICtrlSetData($TopInput,5)
			GUICtrlSetData($jianjuInput,1)
			GUICtrlSetData($Heightinput,10)
			GUICtrlSetData($widthinput,10)
			GUICtrlSetData($ColorInput,"0X777777")
			GUICtrlSetData($FlgLetterInput,"F")
	EndSwitch
EndFunc

Func SetOKClick()  ;ȷ������, ���ж�3��ֵ�ǲ��ǿգ� ���Ϊ��,��־�б�д�������Ϣ ������.��Ϊ��,���3��ȫ�ֱ�����ֵ,Ȼ��������ݿ�.
	If GUICtrlRead($widthinput)="" Then
		_GUICtrlListBox_AddString($LogList,"����,��Ȳ���Ϊ��!")
		Return
	Else
		$iWidth=GUICtrlRead($widthinput)
	EndIf
	If GUICtrlRead($Heightinput)="" Then
		_GUICtrlListBox_AddString($LogList,"����,�߶Ȳ���Ϊ��!")
		Return
	Else
		$iHeight=GUICtrlRead($Heightinput)
	EndIf
	If GUICtrlRead($ColorInput)="" Then
		_GUICtrlListBox_AddString($LogList,"����,��ɫֵ����Ϊ��!")
		Return
	Else
		$ColorToRemove=GUICtrlRead($ColorInput)
	EndIf
	$SetFlg=False
	_GUICtrlListBox_AddString($LogList,"���ñ���,������ϢΪ:��"&$iWidth&",��"&$iHeight)
	_GUICtrlListBox_AddString($LogList,"��ɫֵΪ:"&$ColorToRemove)
	_GUICtrlListBox_AddString($LogList,"�߽���Ϣ:��-"&GUICtrlRead($TopInput)&",��-"&GUICtrlRead($LeftInput)&",���-"&GUICtrlRead($jianjuInput))
	If $CreateMode="Auto" Then
		_GUICtrlListBox_AddString($LogList,"CODE����ģʽΪ:�Զ�ģʽ")
	Else
		_GUICtrlListBox_AddString($LogList,"CODE����ģʽΪ:�ֶ�ģʽ")
	EndIf
	_GUICtrlListBox_AddString($LogList,"��־λΪ��"&GUICtrlRead($FlgLetterInput))
	IniWrite(@ScriptDir&"\set.db","set","iwth",$iWidth)
	IniWrite(@ScriptDir&"\set.db","set","ihth",$iHeight)
	IniWrite(@ScriptDir&"\set.db","set","remcolor",$ColorToRemove)
	IniWrite(@ScriptDir&"\set.db","set","Top",GUICtrlRead($TopInput))
	IniWrite(@ScriptDir&"\set.db","set","Left",GUICtrlRead($LeftInput))
	IniWrite(@ScriptDir&"\set.db","set","Jianju",GUICtrlRead($jianjuInput))
	$SetFlgLet=GUICtrlRead($FlgLetterInput)
	reloadclick()
	GUISwitch($SetForm)
	GUISetState(@SW_HIDE)
EndFunc
Func SetCancelClick()  ;ȡ����ť, ��־д����Ϣ, ��������
	_GUICtrlListBox_AddString($LogList,"ȡ������,����δ����!")
	GUISwitch($SetForm)
	GUISetState(@SW_HIDE)
EndFunc

Func SetBtClick()  ;���ð�ť. ���ô�����ʾ,��־д��ͼ����Ϣ.
	If $Open2="" Then Return _GUICtrlListBox_AddString($LogList,"δ����ͼ���ļ�,�������ã�")
	$SetFlg=True
	GUICtrlSetCursor($MainPic,3)
	GUICtrlSetData($picwidth,"���:"&$Row)
	GUICtrlSetData($picheight,"�߶�:"&$Cro)
	_GUICtrlListBox_AddString($LogList,"ͼ����Ϣ��"&"���:"&$Row&",�߶�:"&$Cro)
	GUICtrlSetData($lettercount,"�ַ�����:4")
	GUICtrlSetData($everyheight,"ÿ�ַ���:"&$iHeight)
	GUICtrlSetData($everywidth,"ÿ�ַ���:"&$iWidth)
	_GUICtrlListBox_AddString($LogList,"�ַ�����:4,"&"ÿ�ַ���:"&$iWidth&",��:"&$iHeight)
	GUISwitch($SetForm)
	GUISetState(@SW_SHOW)	
EndFunc
Func ReadBtClick() ;ʶ��ť.   ��������ݿ��û�����ļ�,����־д�������Ϣ������.
;~ 	$nowtime=TimerInit()
	If Not(FileExists(@ScriptDir&"\data.db")) Then Return _GUICtrlListBox_AddString($LogList,"����,���ݿ��ļ������ڣ�")
	If $Open2="" Then Return _GUICtrlListBox_AddString($LogList,"δ����ͼ���ļ�,�޷�ʶ��")
	Local $String="",$tempstr="",$CheckNum=0,$dbstend="",$DbArray[200]
	;��4��,��Ϊ��֤����4���ַ�.
	For $i=0 To _FileCountLines(@ScriptDir&"\data.db")-1 Step 1
		$iLine=StringSplit(FileReadLine(@ScriptDir&"\data.db",$i+1),"|",1)
		$DbArray[$i]=$iLine[2]
	Next
	For $i=0 To 3 Step 1
		;��ȡ������1,�����ж϶�ȡ���ǵڼ����ַ�.
		$CheckNum+=1
		;��ʱ�ַ������ɺ���StartReadCode��ȡ����.
		StartReadCode(@ScriptDir&"\"&$i&".bmp",$ColorToRemove)
		$NowCode=GetCode()
		Switch $CheckNum
			Case 1
				;��ѯ���ǵ�һ���ַ�,��ʱ�ַ��������ղ��ҵ����ַ�����ͬ,����Ϊ���ҳɹ�,�������
				If $NowCode<>False Then
					$string&=$NowCode
					GUICtrlSetData($FirstInput,$string)
					_GUICtrlListBox_AddString($LogList,"��ѯ��һ���ַ��ɹ����ַ�Ϊ:"&$string)
				Else
					GUICtrlSetData($FirstInput,"-")
					_GUICtrlListBox_AddString($LogList,"��ѯ��һ���ַ�ʧ�ܣ����ݿ����޼�¼��")
				EndIf
			Case 2
				If $NowCode<>False Then
					$string&=$NowCode
					GUICtrlSetData($SecondInput,StringRight($string,1))
				    _GUICtrlListBox_AddString($LogList,"��ѯ�ڶ����ַ��ɹ����ַ�Ϊ:"&StringRight($string,1))
				Else
					GUICtrlSetData($SecondInput,"-")
				    _GUICtrlListBox_AddString($LogList,"��ѯ�ڶ����ַ�ʧ�ܣ����ݿ����޼�¼��")
				EndIf
			Case 3
				If $NowCode<>False Then
					$string&=$NowCode
					GUICtrlSetData($ThirdInput,StringRight($string,1))
					_GUICtrlListBox_AddString($LogList,"��ѯ�������ַ��ɹ����ַ�Ϊ:"&StringRight($string,1))
				Else
					GUICtrlSetData($ThirdInput,"-")
					_GUICtrlListBox_AddString($LogList,"��ѯ�������ַ�ʧ�ܣ����ݿ����޼�¼��")
				EndIf
			Case 4
				If $NowCode<>False Then
					$string&=$NowCode
					GUICtrlSetData($FourthInput,StringRight($string,1))
					_GUICtrlListBox_AddString($LogList,"��ѯ���ĸ��ַ��ɹ����ַ�Ϊ:"&StringRight($string,1))
				Else
				    GUICtrlSetData($FourthInput,"-")
					_GUICtrlListBox_AddString($LogList,"��ѯ���ĸ��ַ�ʧ�ܣ����ݿ����޼�¼��")
				EndIf
		EndSwitch
	Next
	GUICtrlSetData($ResultLb,$String)
	;������֤�������.
	If StringLen($string)<4 Then
		_GUICtrlListBox_AddString($LogList,"����ʧ�ܣ���֤������ȱλ��")
	Else
		_GUICtrlListBox_AddString($LogList,"�����ɹ�����֤��Ϊ:"&$string)
	EndIf
;~ 	MsgBox(0,"",TimerDiff($nowtime))
EndFunc
Func LoadPicClick()  ;����ͼƬ
	chushihua()
	$message2 = "ѡ��ʶ����."
	$Open2 = FileOpenDialog($message2, "", "��֤�� (*.gif;*.jpg;*.bmp)", 1 )
	If @error Then
		_GUICtrlListBox_AddString($LogList,"����ͼƬ�ļ�ʧ��,ԭ��:û��ѡ���ļ�!")
	Else
		$Open2 = StringSplit($Open2, "|", @CRLF)
		If $Open2[0] = 1 Then GUICtrlSetImage ($MainPic,$Open2[1])
		_GUICtrlListBox_AddString($LogList,"����ͼƬ�ļ�:"&$Open2[1])
		;�������е�������ϢΪ��ֵ�Ԫ,�ָ�ͼƬ,����ͼƬ��ʾ����ͼƬ��.
		myReadImageToArray(0,$Open2[1],$ResPicPos[0][0],$ResPicPos[0][1],$ResPicPos[0][2],$ResPicPos[0][3],False)  ;���
		;myReadImageToArray($Num,$ImageFile,$ix0,$iy0,$iX,$iY,$b_Array2d=False)
		GUICtrlSetImage($FirstPic,@ScriptDir&"\0.bmp")
		myReadImageToArray(1,$Open2[1],$ResPicPos[1][0],$ResPicPos[1][1],$ResPicPos[1][2],$ResPicPos[1][3],False)
		GUICtrlSetImage($SecondPic,@ScriptDir&"\1.bmp")
		myReadImageToArray(2,$Open2[1],$ResPicPos[2][0],$ResPicPos[2][1],$ResPicPos[2][2],$ResPicPos[2][3],False)
		GUICtrlSetImage($ThirdPic,@ScriptDir&"\2.bmp")
		myReadImageToArray(3,$Open2[1],$ResPicPos[3][0],$ResPicPos[3][1],$ResPicPos[3][2],$ResPicPos[3][3],False)
		GUICtrlSetImage($FourthPic,@ScriptDir&"\3.bmp")
	EndIf
EndFunc
Func reloadclick()  ;����ͼƬ.
	If $Open2 = "" Then Return
	chushihua()
	If $Open2[0] = 1 Then GUICtrlSetImage ($MainPic,$Open2[1])
	_GUICtrlListBox_AddString($LogList,"����ͼƬ�ļ�:"&$Open2[1])
	myReadImageToArray(0,$Open2[1],$ResPicPos[0][0],$ResPicPos[0][1],$ResPicPos[0][2],$ResPicPos[0][3],False)  ;���
	GUICtrlSetImage($FirstPic,@ScriptDir&"\0.bmp")
	myReadImageToArray(1,$Open2[1],$ResPicPos[1][0],$ResPicPos[1][1],$ResPicPos[1][2],$ResPicPos[1][3],False)
	GUICtrlSetImage($SecondPic,@ScriptDir&"\1.bmp")
	myReadImageToArray(2,$Open2[1],$ResPicPos[2][0],$ResPicPos[2][1],$ResPicPos[2][2],$ResPicPos[2][3],False)
	GUICtrlSetImage($ThirdPic,@ScriptDir&"\2.bmp")
	myReadImageToArray(3,$Open2[1],$ResPicPos[3][0],$ResPicPos[3][1],$ResPicPos[3][2],$ResPicPos[3][3],False)
	GUICtrlSetImage($FourthPic,@ScriptDir&"\3.bmp")
EndFunc
;ͼƬ1  �ƶ���������  ��ʼ---
Func MoveUp1Click()  ;ͼƬ1����һ����
	If $Open2=0 Then Return
	$ResPicPos[0][0]=$ResPicPos[0][0]   ;ͼƬ���ƣ�����ͼƬ��Yֵ��1,�߶�ֵ-1
	$ResPicPos[0][2]=$ResPicPos[0][2]
	If $ResPicPos[0][1]=$Top Then  ;���ͼƬ���϶�YֵΪ0,���п����Ǿ���������,��ʱͼ�θ߶�ֵС�����õĸ߶�.
		$ResPicPos[0][3]=$ResPicPos[0][3]+1  ;��ͼƬ�߶�+1
		If $ResPicPos[0][3]>$iHeight Then  ;���ͼƬ�߶ȴ������õĸ߶�,����Ϊͼ����ʾ����ȫ���߶�.
			$ResPicPos[0][1]+=1  ;��ʱͼ�����ƾʹ���ͼ�ε��϶�Yֵ�����ƶ�һ����, ͼ�θ߶ȵ������ø߶ȼ�ȥ�ƶ�������ֵ.
			$ResPicPos[0][3]=$iHeight-$ResPicPos[0][1]+$Top
		Else  ;���ͼ�θ߶Ȳ��������ø߶�,����Ϊͼ��ȷʵ�Ǿ���������, ͼ���϶�Yֵ����.
			$ResPicPos[0][1]=$ResPicPos[0][1]
		EndIf
	Else  ;����϶˲�Ϊ0,����Ϊ����������,�������Ƽ���.
		If $ResPicPos[0][1]>=$iHeight+$Top Then  ;���ͼ�����϶�Yֵ����ͼ�θ߶�,����Ϊͼ���ƶ��������ϱ�, ͼ���������϶˺͸߶Ȼָ���ʼֵ.
			$ResPicPos[0][1]=$Top
			$ResPicPos[0][3]=$iHeight
		Else  ;������϶�����С��ͼ�θ߶�,���������
			$ResPicPos[0][1]+=1
			$ResPicPos[0][3]=$iHeight-$ResPicPos[0][1]+$Top
		EndIf
	EndIf
	;���´�ԭʼͼƬ�в�ֳ������ƶ���������ͼ��,��־д�뵱ǰͼƬ������Ϣ,��ͼ�ο���ʾ��ǰ��ͼ��.
	myReadImageToArray(0,$Open2[1],$ResPicPos[0][0],$ResPicPos[0][1],$ResPicPos[0][2],$ResPicPos[0][3])  ;���
	_GUICtrlListBox_AddString($LogList,"�ַ�1����һ����:"&$ResPicPos[0][0]&","&$ResPicPos[0][1]&","&$ResPicPos[0][2]&","&$ResPicPos[0][3])
	GUICtrlSetImage($FirstPic,@ScriptDir&"\0.bmp")
	;ͼ����ɫ������Ϣ�б���ʾ��ǰ����ͼƬ������������Ϣ.
	StartReadCode(@ScriptDir&"\0.bmp",$ColorToRemove)
EndFunc
Func MoveDown1Click()  ;ͼƬ1����һ����
	If $Open2=0 Then Return
	$ResPicPos[0][0]=$ResPicPos[0][0]
	If $ResPicPos[0][1]<>$Top Then  ;���ͼƬ�϶����겻Ϊ���õĶ���ֵ, �����ͼ�ξ��������ƶ�,
		$ResPicPos[0][1]=$ResPicPos[0][1] - 1  ;��ͼ�ε�Y����-1,ֱ��Y����Ϊ���õĶ���ֵ.
		$ResPicPos[0][3]=$iHeight-$ResPicPos[0][1]+$Top  ;�߶�ֵ=10-�϶˵�Y����,����Ҫץȡ������Ϊ�϶�Y���굽�ײ�.
	Else   ;����϶�Y����Ϊ0,�����ͼ��������ʾ���Ǵ���˿�ʼ
		$ResPicPos[0][1]=$ResPicPos[0][1]  ;��ץȡ�����϶˲���, �¶������1,���߶ȼ�1..
		$ResPicPos[0][3]=$ResPicPos[0][3]-1
	EndIf
	$ResPicPos[0][2]=$ResPicPos[0][2]  ;�����ƶ���ʱ��,ͼ�ο�Ȳ���
	If $ResPicPos[0][3]<0 Then $ResPicPos[0][3]=$iHeight  ;����߶�С��0, ��λ.
	myReadImageToArray(0,$Open2[1],$ResPicPos[0][0],$ResPicPos[0][1],$ResPicPos[0][2],$ResPicPos[0][3])  ;���
	_GUICtrlListBox_AddString($LogList,"�ַ�1����һ����:"&$ResPicPos[0][0]&","&$ResPicPos[0][1]&","&$ResPicPos[0][2]&","&$ResPicPos[0][3])
	GUICtrlSetImage($FirstPic,@ScriptDir&"\0.bmp")
	StartReadCode(@ScriptDir&"\0.bmp",$ColorToRemove)
EndFunc
Func MoveRight1Click()   ;ͼƬ1����һ����
	If $Open2=0 Then Return
	$ResPicPos[0][0]=$ResPicPos[0][0] - 1 ;���Ƚ�ͼ����߽������1
	$ResPicPos[0][1]=$ResPicPos[0][1]   ;�϶�Y����
	If $ResPicPos[0][1]<$Top Then $ResPicPos[0][1]=$Top  ;�϶�Y���С��0,����0.
	If $ResPicPos[0][0]<$Left Then
		$ResPicPos[0][0]=$Left
		If $ResPicPos[0][2]>0 Then  ;���ץͼ���С��0,��ץͼ��Ȼָ�.
			$ResPicPos[0][2]=$ResPicPos[0][2] -1
		Else
			$ResPicPos[0][2]=$iWidth
		EndIf
	Else
		$ResPicPos[0][2]=$ResPicPos[0][2]
	EndIf
	$ResPicPos[0][3]=$ResPicPos[0][3]
	myReadImageToArray(0,$Open2[1],$ResPicPos[0][0],$ResPicPos[0][1],$ResPicPos[0][2],$ResPicPos[0][3])  ;���
	GUICtrlSetImage($FirstPic,@ScriptDir&"\0.bmp")
	StartReadCode(@ScriptDir&"\0.bmp",$ColorToRemove)
	_GUICtrlListBox_AddString($LogList,"�ַ�1����һ����:"&$ResPicPos[0][0]&","&$ResPicPos[0][1]&","&$ResPicPos[0][2]&","&$ResPicPos[0][3])
EndFunc
Func MoveLef1Click()  ;ͼƬ1����һ����
	If $Open2=0 Then Return
		$ResPicPos[0][1]=$ResPicPos[0][1]
	If $ResPicPos[0][2]<$iWidth Then
		$ResPicPos[0][2]+=1
	Else
		$ResPicPos[0][0]=$ResPicPos[0][0] +1
	    If $ResPicPos[0][0]>$iWidth+$Left Then $ResPicPos[0][0]=$Left
		$ResPicPos[0][2]=$ResPicPos[0][2]
	EndIf
	$ResPicPos[0][3]=$ResPicPos[0][3]
	myReadImageToArray(0,$Open2[1],$ResPicPos[0][0],$ResPicPos[0][1],$ResPicPos[0][2],$ResPicPos[0][3])  ;���
	GUICtrlSetImage($FirstPic,@ScriptDir&"\0.bmp")
	StartReadCode(@ScriptDir&"\0.bmp",$ColorToRemove)
	_GUICtrlListBox_AddString($LogList,"�ַ�1����һ����:"&$ResPicPos[0][0]&","&$ResPicPos[0][1]&","&$ResPicPos[0][2]&","&$ResPicPos[0][3])
EndFunc
;ͼƬ1  �ƶ���������

;ͼƬ2  �ƶ�����������ʼ---
Func MoveUp2Click()  ;ͼƬ2����һ����
	If $Open2=0 Then Return
	$ResPicPos[1][0]=$ResPicPos[1][0]   ;ͼƬ���ƣ�����ͼƬ��Yֵ��1,�߶�ֵ-1
	$ResPicPos[1][2]=$ResPicPos[1][2]
	If $ResPicPos[1][1]=$Top Then
		$ResPicPos[1][3]=$ResPicPos[1][3]+1
		If $ResPicPos[1][3]>$iHeight Then
			$ResPicPos[1][1]+=1
			$ResPicPos[1][3]=$iHeight-$ResPicPos[1][1]+$Top
		Else
			$ResPicPos[1][1]=$ResPicPos[1][1]
		EndIf
	Else
		If $ResPicPos[1][1]>=$iHeight+$Top Then
			$ResPicPos[1][1]=$Top
			$ResPicPos[1][3]=$iHeight
		Else
			$ResPicPos[1][1]+=1
			$ResPicPos[1][3]=$iHeight-$ResPicPos[1][1]+$Top
		EndIf
	EndIf
	myReadImageToArray(1,$Open2[1],$ResPicPos[1][0],$ResPicPos[1][1],$ResPicPos[1][2],$ResPicPos[1][3])  ;���
	_GUICtrlListBox_AddString($LogList,"�ַ�2����һ����:"&$ResPicPos[1][0]&","&$ResPicPos[1][1]&","&$ResPicPos[1][2]&","&$ResPicPos[1][3])
	GUICtrlSetImage($SecondPic,@ScriptDir&"\1.bmp")
	StartReadCode(@ScriptDir&"\1.bmp",$ColorToRemove)
EndFunc
Func MoveDown2Click()  ;ͼƬ2����һ����
	If $Open2=0 Then Return
	$ResPicPos[1][0]=$ResPicPos[1][0]
	If $ResPicPos[1][1]<>$Top Then  ;���ͼƬ�϶����겻Ϊ0, �����ͼ�ξ��������ƶ�,
		$ResPicPos[1][1]=$ResPicPos[1][1] - 1  ;��ͼ�ε�Y����-1,ֱ��Y����Ϊ0.
		$ResPicPos[1][3]=$iHeight-$ResPicPos[1][1]+$Top  ;�߶�ֵ=10-�϶˵�Y����,����Ҫץȡ������Ϊ�϶�Y���굽�ײ�.
	Else   ;����϶�Y����Ϊ0,�����ͼ��������ʾ���Ǵ���˿�ʼ
		$ResPicPos[1][1]=$ResPicPos[1][1]  ;��ץȡ�����϶˲���, �¶������1,���߶ȼ�1..
		$ResPicPos[1][3]=$ResPicPos[1][3]-1
	EndIf
	$ResPicPos[1][2]=$ResPicPos[1][2]
	If $ResPicPos[1][3]<0 Then $ResPicPos[1][3]=$iHeight
	myReadImageToArray(1,$Open2[1],$ResPicPos[1][0],$ResPicPos[1][1],$ResPicPos[1][2],$ResPicPos[1][3])  ;���
	_GUICtrlListBox_AddString($LogList,"�ַ�2����һ����:"&$ResPicPos[1][0]&","&$ResPicPos[1][1]&","&$ResPicPos[1][2]&","&$ResPicPos[1][3])
	GUICtrlSetImage($SecondPic,@ScriptDir&"\1.bmp")
	StartReadCode(@ScriptDir&"\1.bmp",$ColorToRemove)
EndFunc
Func MoveRight2Click()  ;ͼƬ2����һ����
	If $Open2=0 Then Return
	$ResPicPos[1][0]=$ResPicPos[1][0] - 1
	$ResPicPos[1][1]=$ResPicPos[1][1]
	If $ResPicPos[1][1]<$Top Then $ResPicPos[1][1]=$Top
	If $ResPicPos[1][0]>=$Left Then
		$ResPicPos[1][0]=$ResPicPos[1][0]
	Else
		$ResPicPos[1][0]=$iWidth+$Left+$Jianju
	EndIf
	$ResPicPos[1][3]=$ResPicPos[1][3]
	myReadImageToArray(1,$Open2[1],$ResPicPos[1][0],$ResPicPos[1][1],$ResPicPos[1][2],$ResPicPos[1][3])  ;���
	GUICtrlSetImage($SecondPic,@ScriptDir&"\1.bmp")
	StartReadCode(@ScriptDir&"\1.bmp",$ColorToRemove)
	_GUICtrlListBox_AddString($LogList,"�ַ�2����һ����:"&$ResPicPos[1][0]&","&$ResPicPos[1][1]&","&$ResPicPos[1][2]&","&$ResPicPos[1][3])
EndFunc
Func MoveLeft2Click()  ;ͼƬ2����һ����
	If $Open2=0 Then Return
	$ResPicPos[1][0]=$ResPicPos[1][0] +1
	$ResPicPos[1][1]=$ResPicPos[1][1]
	If $ResPicPos[1][0]<($iWidth*2+$Left+$Jianju*2) Then
		$ResPicPos[1][0]=$ResPicPos[1][0]
	Else
		$ResPicPos[1][0]=$iWidth+$Left+$Jianju 
	EndIf
	$ResPicPos[1][3]=$ResPicPos[1][3]
	myReadImageToArray(1,$Open2[1],$ResPicPos[1][0],$ResPicPos[1][1],$ResPicPos[1][2],$ResPicPos[1][3])  ;���
	GUICtrlSetImage($SecondPic,@ScriptDir&"\1.bmp")
	StartReadCode(@ScriptDir&"\1.bmp",$ColorToRemove)
	_GUICtrlListBox_AddString($LogList,"�ַ�2����һ����:"&$ResPicPos[1][0]&","&$ResPicPos[1][1]&","&$ResPicPos[1][2]&","&$ResPicPos[1][3])
EndFunc
;ͼƬ2  �ƶ�������������

;~ ͼƬ3  �ƶ�����������ʼ---
Func MoveUp3Click()   ;ͼƬ3����һ����
	If $Open2=0 Then Return
	$ResPicPos[2][0]=$ResPicPos[2][0]   ;ͼƬ���ƣ�����ͼƬ��Yֵ��1,�߶�ֵ-1
	$ResPicPos[2][2]=$ResPicPos[2][2]
	If $ResPicPos[2][1]=$Top Then
		$ResPicPos[2][3]=$ResPicPos[2][3]+1
		If $ResPicPos[2][3]>$iHeight Then
			$ResPicPos[2][1]+=1
			$ResPicPos[2][3]=$iHeight-$ResPicPos[2][1]+$Top
		Else
			$ResPicPos[2][1]=$ResPicPos[2][1]
		EndIf
	Else
		If $ResPicPos[2][1]>=$iHeight+$Top Then
			$ResPicPos[2][1]=$Top
			$ResPicPos[2][3]=$iHeight
		Else
			$ResPicPos[2][1]+=1
			$ResPicPos[2][3]=$iHeight-$ResPicPos[2][1]+$Top
		EndIf
	EndIf
	myReadImageToArray(2,$Open2[1],$ResPicPos[2][0],$ResPicPos[2][1],$ResPicPos[2][2],$ResPicPos[2][3])  ;���
	_GUICtrlListBox_AddString($LogList,"�ַ�3����һ����:"&$ResPicPos[2][0]&","&$ResPicPos[2][1]&","&$ResPicPos[2][2]&","&$ResPicPos[2][3])
	GUICtrlSetImage($ThirdPic,@ScriptDir&"\2.bmp")
	StartReadCode(@ScriptDir&"\2.bmp",$ColorToRemove)
EndFunc
Func MoveDown3Click()  ;ͼƬ3����һ����
	If $Open2=0 Then Return
	$ResPicPos[2][0]=$ResPicPos[2][0]
	If $ResPicPos[2][1]<>$Top Then  ;���ͼƬ�϶����겻Ϊ0, �����ͼ�ξ��������ƶ�,
		$ResPicPos[2][1]=$ResPicPos[2][1] - 1  ;��ͼ�ε�Y����-1,ֱ��Y����Ϊ0.
		$ResPicPos[2][3]=$iHeight-$ResPicPos[2][1]+$Top  ;�߶�ֵ=10-�϶˵�Y����,����Ҫץȡ������Ϊ�϶�Y���굽�ײ�.
	Else   ;����϶�Y����Ϊ0,�����ͼ��������ʾ���Ǵ���˿�ʼ
		$ResPicPos[2][1]=$ResPicPos[2][1]  ;��ץȡ�����϶˲���, �¶������1,���߶ȼ�1..
		$ResPicPos[2][3]=$ResPicPos[2][3]-1
	EndIf
	$ResPicPos[2][2]=$ResPicPos[2][2]
	If $ResPicPos[2][3]<0 Then $ResPicPos[2][3]=$iHeight
	myReadImageToArray(2,$Open2[1],$ResPicPos[2][0],$ResPicPos[2][1],$ResPicPos[2][2],$ResPicPos[2][3])  ;���
	_GUICtrlListBox_AddString($LogList,"�ַ�3����һ����:"&$ResPicPos[2][0]&","&$ResPicPos[2][1]&","&$ResPicPos[2][2]&","&$ResPicPos[2][3])
	GUICtrlSetImage($ThirdPic,@ScriptDir&"\2.bmp")
	StartReadCode(@ScriptDir&"\2.bmp",$ColorToRemove)
EndFunc
Func MoveRight3Click()   ;ͼƬ3����һ����
	If $Open2=0 Then Return
	$ResPicPos[2][0]=$ResPicPos[2][0] - 1
	$ResPicPos[2][1]=$ResPicPos[2][1]
	If $ResPicPos[2][1]<$Top Then $ResPicPos[2][1]=$Top
	If $ResPicPos[2][0]>=($iWidth+$Left+$Jianju) Then
		$ResPicPos[2][0]=$ResPicPos[2][0]
	Else
		$ResPicPos[2][0]=$iWidth*2+$Left+$Jianju*2
	EndIf
	$ResPicPos[2][3]=$ResPicPos[2][3]
	myReadImageToArray(2,$Open2[1],$ResPicPos[2][0],$ResPicPos[2][1],$ResPicPos[2][2],$ResPicPos[2][3])  ;���
	GUICtrlSetImage($ThirdPic,@ScriptDir&"\2.bmp")
	_GUICtrlListBox_AddString($LogList,"�ַ�3����һ����:"&$ResPicPos[2][0]&","&$ResPicPos[2][1]&","&$ResPicPos[2][2]&","&$ResPicPos[2][3])
    StartReadCode(@ScriptDir&"\2.bmp",$ColorToRemove)
EndFunc
Func MoveLeft3Click()   ;ͼƬ3����һ����
	If $Open2=0 Then Return
	$ResPicPos[2][0]=$ResPicPos[2][0] +1
	$ResPicPos[2][1]=$ResPicPos[2][1]
	If $ResPicPos[2][0]<($iWidth*3+$Left+$Jianju*3) Then
		$ResPicPos[2][0]=$ResPicPos[2][0]
	Else
		$ResPicPos[2][0]=$iWidth*2+$Left+$Jianju*2
	EndIf
	$ResPicPos[2][3]=$ResPicPos[2][3]
	myReadImageToArray(2,$Open2[1],$ResPicPos[2][0],$ResPicPos[2][1],$ResPicPos[2][2],$ResPicPos[2][3])  ;���
	GUICtrlSetImage($ThirdPic,@ScriptDir&"\2.bmp")
	_GUICtrlListBox_AddString($LogList,"�ַ�3����һ����:"&$ResPicPos[2][0]&","&$ResPicPos[2][1]&","&$ResPicPos[2][2]&","&$ResPicPos[2][3])
    StartReadCode(@ScriptDir&"\2.bmp",$ColorToRemove)
EndFunc
;~ ;ͼƬ3  �ƶ�������������

;ͼƬ4  �ƶ�����������ʼ---
Func MoveUp4Click()   ;ͼƬ4����һ����
	If $Open2=0 Then Return
	$ResPicPos[3][0]=$ResPicPos[3][0]   ;ͼƬ���ƣ�����ͼƬ��Yֵ��1,�߶�ֵ-1
	$ResPicPos[3][2]=$ResPicPos[3][2]
	If $ResPicPos[3][1]=$Top Then
		$ResPicPos[3][3]=$ResPicPos[3][3]+1
		If $ResPicPos[3][3]>$iHeight Then
			$ResPicPos[3][1]+=1
			$ResPicPos[3][3]=$iHeight-$ResPicPos[3][1]+$Top
		Else
			$ResPicPos[3][1]=$ResPicPos[3][1]
		EndIf
	Else
		If $ResPicPos[3][1]>=$iHeight+$Top Then
			$ResPicPos[3][1]=$Top
			$ResPicPos[3][3]=$iHeight
		Else
			$ResPicPos[3][1]+=1
			$ResPicPos[3][3]=$iHeight-$ResPicPos[3][1]+$Top
		EndIf
	EndIf
	myReadImageToArray(3,$Open2[1],$ResPicPos[3][0],$ResPicPos[3][1],$ResPicPos[3][2],$ResPicPos[3][3])  ;���
	_GUICtrlListBox_AddString($LogList,"�ַ�4����һ����:"&$ResPicPos[3][0]&","&$ResPicPos[3][1]&","&$ResPicPos[3][2]&","&$ResPicPos[3][3])
	GUICtrlSetImage($FourthPic,@ScriptDir&"\3.bmp")
	StartReadCode(@ScriptDir&"\3.bmp",$ColorToRemove)
EndFunc
Func MoveDown4Click()  ;ͼƬ4����һ����
	If $Open2=0 Then Return
	$ResPicPos[3][0]=$ResPicPos[3][0]
	If $ResPicPos[3][1]<>$Top Then  ;���ͼƬ�϶����겻Ϊ0, �����ͼ�ξ��������ƶ�,
		$ResPicPos[3][1]=$ResPicPos[3][1] - 1  ;��ͼ�ε�Y����-1,ֱ��Y����Ϊ0.
		$ResPicPos[3][3]=$iHeight-$ResPicPos[3][1]+$Top  ;�߶�ֵ=10-�϶˵�Y����,����Ҫץȡ������Ϊ�϶�Y���굽�ײ�.
	Else   ;����϶�Y����Ϊ0,�����ͼ��������ʾ���Ǵ���˿�ʼ
		$ResPicPos[3][1]=$ResPicPos[3][1]  ;��ץȡ�����϶˲���, �¶������1,���߶ȼ�1..
		$ResPicPos[3][3]=$ResPicPos[3][3]-1
	EndIf
	$ResPicPos[3][2]=$ResPicPos[3][2]
	If $ResPicPos[3][3]<0 Then $ResPicPos[3][3]=$iHeight
	myReadImageToArray(3,$Open2[1],$ResPicPos[3][0],$ResPicPos[3][1],$ResPicPos[3][2],$ResPicPos[3][3])  ;���
	_GUICtrlListBox_AddString($LogList,"�ַ�4����һ����:"&$ResPicPos[3][0]&","&$ResPicPos[3][1]&","&$ResPicPos[3][2]&","&$ResPicPos[3][3])
	GUICtrlSetImage($FourthPic,@ScriptDir&"\3.bmp")
    StartReadCode(@ScriptDir&"\3.bmp",$ColorToRemove)
EndFunc
Func MoveRight4Click()  ;ͼƬ4����һ����
	If $Open2=0 Then Return
	$ResPicPos[3][0]=$ResPicPos[3][0] - 1
	$ResPicPos[3][1]=$ResPicPos[3][1]
	If $ResPicPos[3][1]<0 Then $ResPicPos[3][1]=0
	If $ResPicPos[3][0]>=($iWidth*2+$Left+$Jianju*2) Then
		$ResPicPos[3][0]=$ResPicPos[3][0]
		If $ResPicPos[3][2]<$iWidth Then $ResPicPos[3][2]+=1
	Else
		$ResPicPos[3][0]=$iWidth*3+$Left+$Jianju*3 
	EndIf
	$ResPicPos[3][3]=$ResPicPos[3][3]
	myReadImageToArray(3,$Open2[1],$ResPicPos[3][0],$ResPicPos[3][1],$ResPicPos[3][2],$ResPicPos[3][3])  ;���
	GUICtrlSetImage($FourthPic,@ScriptDir&"\3.bmp")
	_GUICtrlListBox_AddString($LogList,"�ַ�4����һ����:"&$ResPicPos[3][0]&","&$ResPicPos[3][1]&","&$ResPicPos[3][2]&","&$ResPicPos[3][3])
    StartReadCode(@ScriptDir&"\3.bmp",$ColorToRemove)
EndFunc
Func MoveLeft4Click()  ;ͼƬ4����һ����
	If $Open2=0 Then Return
	$ResPicPos[3][0]=$ResPicPos[3][0] +1
	$ResPicPos[3][1]=$ResPicPos[3][1]
	
	If $ResPicPos[3][0]<$iWidth*4+$Left+$Jianju*3 Then
		$ResPicPos[3][0]=$ResPicPos[3][0]
		$ResPicPos[3][2]=$iWidth*4+$Left+$Jianju*3-$ResPicPos[3][0]
		If $ResPicPos[3][2]<0 Then $ResPicPos[3][2]=$iWidth
	Else
		$ResPicPos[3][0]=$iWidth*3+$Left+$Jianju*3 
		$ResPicPos[3][2]=$iWidth
	EndIf
	$ResPicPos[3][3]=$ResPicPos[3][3]
	;myReadImageToArray($Num,$ImageFile,$ix0,$iy0,$iX,$iY,$b_Array2d=False)
	myReadImageToArray(3,$Open2[1],$ResPicPos[3][0],$ResPicPos[3][1],$ResPicPos[3][2],$ResPicPos[3][3])  ;���
	GUICtrlSetImage($FourthPic,@ScriptDir&"\3.bmp")
	_GUICtrlListBox_AddString($LogList,"�ַ�4����һ����:"&$ResPicPos[3][0]&","&$ResPicPos[3][1]&","&$ResPicPos[3][2]&","&$ResPicPos[3][3])
    StartReadCode(@ScriptDir&"\3.bmp",$ColorToRemove)
EndFunc
;ͼƬ4  �ƶ�������������

;�������Ƿ��и���֤�롣
Func CheckCodeIsInDb($CheckString)
	;����һ����������Ϊ����������ݿ��м�¼��Ϊ����������ݿ����޼�¼��
	Local $CheckResult=False
    ;�����ݿ��ļ���һ�п�ʼ���������ڶ���.
	For $i=0 To _FileCountLines(@ScriptDir&"\data.db")-1 Step 1
		;��ֶ������ַ���
		$iL=StringSplit(FileReadLine(@ScriptDir&"\data.db",$i+1),"|",1)
;~ 		_ArrayDisplay($iL,"")
        ;����ַ����Ͷ������ַ����Ƿ���ͬ.
		If $CheckString=StringRight($iL[1],2)&"|"&$iL[2] Then
			$CheckResult=True
			ExitLoop
		Else
			$CheckResult=False
		EndIf
	Next
	Return $CheckResult
EndFunc
;����

;��Edit�ؼ��е���Ϣת���ɵ�����Ϣ��
Func EdittextPointInfo($EditHwnd,$FlgLetter,$ReturnFlg="string")
	;���Ƚ�EDIT�ؼ��е���ֵ�����з���ֳ�һ������.
	Local $EditArray=StringSplit(GUICtrlRead($EditHwnd),@CRLF,1)
	;����һ���߶ȺͿ��Ϊ��֤��ĸߺͿ��һ����ά����,���ڴ�ŵ���.
	Local $ArrayEveryMem[$iHeight][$iWidth]
	; $FlgCount ָ�����ҵ���־λ���� $PointInfoString ������Ϣ.
	Local $FlgCount=0,$PointInfoString=""
	;����Forѭ�����������鸳ֵ.
	For $i=0 To $iWidth-1 Step 1
		For $j=0 To $iHeight-1 Step 1
			;���������λ�õ�Ԫ�ص��� EDIT�ؼ������е���Ӧ���еĵ�$i+1��Ԫ��.
			;��Ϊ�������鶨����±��Ǵ�0��ʼ,���ؼ������е�Ԫ����ͨ���������ص�,�±��Ǵ�1��ʼ.
			$ArrayEveryMem[$j][$i]=StringMid($EditArray[$j+1],$i+1,1)
			;�����λ�õ��ַ�Ϊ��־�ַ�, ���ҵ�������1, ������Ϣ�ַ�����¼��λ������.
			If $ArrayEveryMem[$j][$i]=$FlgLetter Then
				$FlgCount+=1
				$PointInfoString&=$j&":"&$i&","
			EndIf
		Next
	Next
	;���,���ҵ������͵�����Ϣ����ϵ�һ�𷵻�.
	$PointInfoString=StringTrimRight($FlgCount&"|"&$PointInfoString,1)
	;���Ҫ�����ַ���,�򷵻� $PointInfoString , ���Ҫ��������  �򷵻� $ArrayEveryMem 
	If $ReturnFlg="string" Then
		Return $PointInfoString
	ElseIf $ReturnFlg="array" Then
		Return $ArrayEveryMem
	EndIf
EndFunc
;����ת������

;��ȡ�ַ�
Func GetCode()
	;����һ����ֵ���ڴ洢���ֱ�־λ�Ĵ�����
	;$P ��һ������,���ڴ�����ݿ��еı�־��Ϣ����������ֵ.
	Local $count=0,$p  
	Local $DBinFile[200]
	For $m=0 To _FileCountLines(@ScriptDir&"\data.db")-1 Step 1
		$DBinFile[$m]=FileReadLine(@ScriptDir&"\data.db",$m+1)
	Next
	;����ǰ��EDIT�ؼ��е����ݲ�� ��ά����.
	$NowEditArray=EdittextPointInfo($CodeEdit,$SetFlgLet,"Array")
;~ 	_ArrayDisplay($NowEditArray,"��ǰEDIT�е���Ϣ")
	;�Ż�����㷨�� ���ñ���EDIT�����ˣ�ֱ�ӵ������ݿ��еĵ�����Ϣ�Ա�EDIT�����е���ӦԪ�ؼ��ɡ�
	For $n=0 To _FileCountLines(@ScriptDir&"\data.db")-1 Step 1
		$count=0
		;�����ݿ��еĵ�����Ϣ��|��ֳ�����,�����һ��Ԫ�ش�ŵ��ǳ��ֱ�־λ�Ĵ����͵����Ӧ���ַ�,�ڶ���Ԫ���Ǳ�־λ������.
		$Data=StringSplit($DBinFile[$n],"|",1)
;~ 		_ArrayDisplay($Data,"������ݿ�����Ϣ��")
		;����־λ�������ֳɵ���������Ϣ.
		$Point=StringSplit($Data[2],",",1)
;~ 		_ArrayDisplay($Point,"��ֵ���--"&$Data[1])
		;����������Ϣ����.
		For $k=1 To $Point[0] Step 1
			;�Ƚ�ÿ��������Ϣ���2������ֵ.
			$p=StringSplit($Point[$k],":",1)
			$_Edit_X=$p[1]
			$_Edit_Y=$p[2]
			;�����������±���Ϣ�ȷ��ص�EDIT����߽�������һ�����Ǹ��ַ���ֱ���˳���
			If $_Edit_X>UBound($NowEditArray)-1 Or $_Edit_Y>UBound($NowEditArray,2)-1 Then ExitLoop
			;�����ǰEDIT�����е���ӦԪ��Ϊ��־λ,������ҵ�,�ҵ�������1,
			;������������ַ�����־�ַ���ͬ��Ҳ֤�����Ǹ��ַ���ֱ���˳���
			If $NowEditArray[$_Edit_X][$_Edit_Y]=$SetFlgLet Then
				$count+=1
			Else 
				ExitLoop
			EndIf
		Next
		;������յ��ҵ��������� ������Ϣ�Ĵ���,������EDIT�����д�ŵľ��Ǹ����ֵĵ���.
		If $count=StringRight($Data[1],2) Then
			$Seached=StringLeft($Data[1],1)
			ExitLoop
		Else
			$Seached=False
		EndIf
	Next
	Return $Seached
EndFunc
;

;ͼƬ��֤�����
Func FirstClick()  ;��һ��ʶ�������
	Local $Code=GUICtrlRead($FirstInput)  ;�ӵ�һ����֤��������ȡҪ�����������ĸ��ַ�
	$CodeDB=""
	If $CreateMode="Auto" Then startreadcode(@ScriptDir&"\0.bmp",$ColorToRemove)
	$CodeDB=EdittextPointInfo($CodeEdit,$SetFlgLet)
	$Checked=CheckCodeIsInDb($CodeDB)
	If $Code="" Then
		_GUICtrlListBox_AddString($LogList,"��ʲô�����䣬�����ݿ�ѧʲô��")
		Return
	Else
		If $Checked=True Then
			_GUICtrlListBox_AddString($LogList,"���ݿ������иü�¼��������ѧϰ�ˣ�")
		Else
			FileWriteLine(@ScriptDir&"\data.db",$Code&","&$CodeDB)
			_GUICtrlListBox_AddString($LogList,"�ַ�һ���ɹ�������Ϊ"&$Code&","&$CodeDB)
		EndIf
	EndIf
EndFunc
Func SecondClick()  ;�ڶ�����֤��������Ϻ�,���
	Local $Code=GUICtrlRead($SecondInput)  ;�ӵ�һ����֤��������ȡҪ�����������ĸ��ַ�
	$CodeDB=""
    If $CreateMode="Auto" Then startreadcode(@ScriptDir&"\1.bmp",$ColorToRemove)
	$CodeDB=EdittextPointInfo($CodeEdit,$SetFlgLet)
	$Checked=CheckCodeIsInDb($CodeDB)
	If $Code="" Then
		_GUICtrlListBox_AddString($LogList,"��ʲô�����䣬�����ݿ�ѧʲô��")
		Return
	Else
		If $Checked=True Then
			_GUICtrlListBox_AddString($LogList,"���ݿ������иü�¼��������ѧϰ�ˣ�")
		Else
			FileWriteLine(@ScriptDir&"\data.db",$Code&","&$CodeDB)
			_GUICtrlListBox_AddString($LogList,"�ַ������ɹ�������Ϊ"&$Code&","&$CodeDB)
		EndIf
	EndIf
EndFunc
Func ThirdClick()  ;��������֤��������Ϻ�,���
	Local $Code=GUICtrlRead($ThirdInput)  ;�ӵ�һ����֤��������ȡҪ�����������ĸ��ַ�
	$CodeDB=""
    If $CreateMode="Auto" Then startreadcode(@ScriptDir&"\2.bmp",$ColorToRemove)
	$CodeDB=EdittextPointInfo($CodeEdit,$SetFlgLet)
	$Checked=CheckCodeIsInDb($CodeDB)
	If $Code="" Then
		_GUICtrlListBox_AddString($LogList,"��ʲô�����䣬�����ݿ�ѧʲô��")
		Return
	Else
		If $Checked=True Then
			_GUICtrlListBox_AddString($LogList,"���ݿ������иü�¼��������ѧϰ�ˣ�")
		Else
			FileWriteLine(@ScriptDir&"\data.db",$Code&","&$CodeDB)
			_GUICtrlListBox_AddString($LogList,"�ַ������ɹ�������Ϊ"&$Code&","&$CodeDB)
		EndIf
	EndIf
EndFunc
Func FourthClick()   ;���ĸ���֤��������Ϻ�,���
	Local $Code=GUICtrlRead($FourthInput)  ;�ӵ�һ����֤��������ȡҪ�����������ĸ��ַ�
	$CodeDB=""
	If $CreateMode="Auto" Then startreadcode(@ScriptDir&"\3.bmp",$ColorToRemove)
	$CodeDB=EdittextPointInfo($CodeEdit,$SetFlgLet)
	$Checked=CheckCodeIsInDb($CodeDB)
	If $Code="" Then
		_GUICtrlListBox_AddString($LogList,"��ʲô�����䣬�����ݿ�ѧʲô��")
		Return
	Else
		If $Checked=True Then
			_GUICtrlListBox_AddString($LogList,"���ݿ������иü�¼��������ѧϰ�ˣ�")
		Else
			FileWriteLine(@ScriptDir&"\data.db",$Code&","&$CodeDB)
			_GUICtrlListBox_AddString($LogList,"�ַ������ɹ�������Ϊ"&$Code&","&$CodeDB)
		EndIf
	EndIf
EndFunc

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
Func myChangeRegExpSC($func_string, $func_sc_type=1, $func_sc=0x777777, $func_bg=0xffffff);�������ڰױ仯
        If $func_string="" Or $func_sc_type<1 Or $func_sc_type>3 Or Mod(StringLen($func_string),6)<>0 Then Return $func_string
        $func_string = StringRegExpReplace($func_string, ".{6}", "$0,")
        $func_sc = myGetRegExpSC($func_sc)
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
Func myReadImageToArray($Num,$ImageFile,$ix0,$iy0,$iX,$iY,$b_Array2d=False);�ɹ��򷵻�����.ʧ�ܷ���0.$b_Array2d=True���ض�ά����,=False����һά����
    Local $hBitmap, $BitmapData, $i_width, $i_height, $Scan0, $pixelData, $s_BMPData, $i_Stride
	Local $hClone, $hImage
	_GDIPlus_Startup()
    $hBitmap = _GDIPlus_BitmapCreateFromFile($ImageFile)
	$i_width = _GDIPlus_ImageGetWidth($hBitmap)
	$i_height = _GDIPlus_ImageGetHeight($hBitmap)
	$Row=$i_width
	$Cro=$i_height
	$hClone = _GDIPlus_BitmapCloneArea($hBitmap, $ix0, $iy0, $iX, $iY)
	_GDIPlus_ImageSaveToFile($hClone, @ScriptDir&"\"&$Num &".bmp")
	If @error Then 
		MsgBox(0,"","wrong")
		_GDIPlus_ShutDown ()
		Return 0;��Ч��ͼ���ļ���δ�ҵ����ļ�
	EndIf
    $BitmapData = _GDIPlus_BitmapLockBits($hBitmap, 0, 0, $i_width, $i_height, $GDIP_ILMREAD, $GDIP_PXF24RGB)
    $i_Stride = DllStructGetData($BitmapData, "Stride");Stride - Offset, in bytes, between consecutive scan lines of the bitmap. If the stride is positive, the bitmap is top-down. If the stride is negative, the bitmap is bottom-up.
    $Scan0 = DllStructGetData($BitmapData, "Scan0");Scan0 - Pointer to the first (index 0) scan line of the bitmap.
    $pixelData = DllStructCreate("ubyte lData[" & (Abs($i_Stride) * $i_height) & "]", $Scan0)
    $s_BMPData = DllStructGetData($pixelData, "lData")
    $s_BMPData = StringTrimLeft($s_BMPData,2);ȥ��ͷ��"0x"
    _GDIPlus_BitmapUnlockBits($hBitmap, $BitmapData)
    _GDIPlus_ImageDispose($hBitmap)
	_GDIPlus_ImageDispose($hClone)
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

Func StartReadCode($FileName,$ColorFlg)
	$ResultString=""
	GUICtrlSetData($CodeEdit,"")
	;myReadImageToArray($Num,$ImageFile,$ix0,$iy0,$iX,$iY,$b_Array2d=False)
	$a_Image = myReadImageToArray(0,$FileName,0,0,0,0,False)
	$a_Image = myArrayChangeSC($a_Image, 1, $ColorFlg, 0xffffff)  
	for $line=0 to $Cro-1 Step 1
		$a_Image[$line]=StringReplace($a_Image[$line],"FFFFFF","F")  ;���������е�6λ��ɫ��Ϣת��Ϊ1λ����ɫ��Ϣ
		$a_Image[$line]=StringReplace($a_Image[$line],"000000","0")
		_GUICtrlEdit_InsertText($CodeEdit,$a_Image[$line]&@CRLF)  ;������Ϣ����������б���.
		$ResultString&=$a_Image[$line]   ;ÿ�е���ɫ��Ϣ������ַ���,������������ݿ�.
	Next
	Return $ResultString
EndFunc
