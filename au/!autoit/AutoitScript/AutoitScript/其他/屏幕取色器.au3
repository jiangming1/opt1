#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Color.au3>
#Include <Clipboard.au3>
#Region ### START Koda GUI section ### Form=c:\documents and settings\administrator\����\��Ļ��ɫʰȡ.kxf
$Form1 = GUICreate("��Ļȡɫ��", 337, 260, 192, 124);��������
GUISetBkColor(0x91D0F4);���ô���ı�����ɫ���˴�Ϊǳ��ɫ
$chuang = GUICtrlCreateGraphic (8, 40, 145, 129);������ͼ�ؼ��������Ǹ�������ʾ��ǰ��ɫ�ľ���
GUICtrlSetColor(-1, 0x008FF0);���û�ͼ�ؼ��ı߿���ɫ
$Label1 = GUICtrlCreateLabel("��ǰ��ɫ", 192, 48, 88, 23);������̬��ǩ
GUICtrlSetFont(-1, 14, 800, 0, "����_GB2312");��������
GUICtrlSetColor(-1, 0xFF0000);����������ɫ
$Label2 = GUICtrlCreateLabel("ʮ������", 162, 80, 52, 17);������̬��ǩ
$Label3 = GUICtrlCreateLabel("ʮ����", 255, 80, 40, 17);������̬��ǩ
$Input16 = GUICtrlCreateInput("", 156, 96, 65, 21);���������������ʾ16���Ƶ���ɫ����
$Input10 = GUICtrlCreateInput("", 243, 96, 65, 21);���������������ʾ10���Ƶ���ɫ����
$Button16 = GUICtrlCreateButton("����", 160, 128, 57, 17);��ť������ʮ�����ƴ���
GUICtrlSetState(-1,$GUI_DISABLE);�����ư�ť��ɲ����ã���ɫ��
$Button10 = GUICtrlCreateButton("����", 247, 128, 57, 17);��ť������ʮ���ƴ���
GUICtrlSetState(-1,$GUI_DISABLE);�����ư�ť��ɲ����ã���ɫ��
$Label4 = GUICtrlCreateLabel("��Ļ����", 160, 160, 52, 20);������̬��ǩ
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif");��������
$zuobiaox = GUICtrlCreateLabel("x", 222, 160, 50, 20)
;������̬��ǩ,��ʾx����,��ʱ�����"x"û�����壬ֻΪ����鿴����ΪֻҪһ���У����ｫ�ᱻ�޸�
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif");��������
$zuobiaoy = GUICtrlCreateLabel("y", 272, 160, 50, 20)
;������̬��ǩ,��ʾy����,��ʱ�����"y"û�����壬ֻΪ����鿴
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif");��������
$Label6 = GUICtrlCreateLabel("��ɫ", 16, 189, 28, 20);������̬��ǩ,��ʾ��ɫ������
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif");��������

$Label7 = GUICtrlCreateLabel("��ɫ", 55, 189, 28, 20);������̬��ǩ,��ʾ��ɫ������
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif");��������

$Label8 = GUICtrlCreateLabel("��ɫ", 94, 189, 28, 20);������̬��ǩ,��ʾ��ɫ������
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif");��������

$hong = GUICtrlCreateInput("1", 8, 208, 33, 24);���������������ʾ��ɫ�ɷ֣������"1"û������
GUICtrlSetBkColor(-1, 0xFF0000);���������ı�����ɫΪ��ɫ
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif");��������

$lv = GUICtrlCreateInput("2", 50, 208, 33, 24);���������������ʾ��ɫ�ɷ֣������"2"û������
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif");��������
GUICtrlSetBkColor(-1, 0x008000);���������ı�����ɫΪ��ɫ

$lan = GUICtrlCreateInput("3", 92, 208, 33, 24);���������������ʾ��ɫ�ɷ֣������"3"û������
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif");��������
GUICtrlSetBkColor(-1, 0x0054E3);���������ı�����ɫΪ��ɫ
$Label9 = GUICtrlCreateLabel("���ո���ͣ��׽��ɫ", 76, 8, 175, 23);������̬��ǩ,��ʾ������ı���
GUICtrlSetFont(-1, 14, 400, 0, "����");��������
GUICtrlSetColor(-1, 0x008000);����������ɫ
$Buttonguanyu = GUICtrlCreateButton("����", 160, 207, 65, 33);������ť�ؼ�
GUICtrlSetFont(-1, 12, 800, 0, "����_GB2312");��������
$Buttonexit = GUICtrlCreateButton("�˳�", 250, 207, 65, 33);������ť�ؼ�
GUICtrlSetFont(-1, 12, 800, 0, "����_GB2312");��������
GUISetState(@SW_SHOW);��ʾ����
#EndRegion ### END Koda GUI section ###
Dim $temp,$tempx,$tempy,$pause;��������
HotKeySet("{SPACE}","pause");ע�ᡰ�ո��ȼ������¿ո�����pause()����
While 1
	If $pause = 0 Then 
	    $shu=MouseGetPos();��ȡ��ǰ�����λ�ã�����һ�����飬$shu[0]Ϊx���꣬$shu[1]Ϊy����
	    $color = PixelGetColor( $shu[0] , $shu[1] );��ȡ���������ɫ������һ��ʮ���Ƶ���ɫ
        If $color <> $temp Then
        	GUICtrlSetData($Input10,$color);�޸����������ݣ���ʾ��ʮ���Ƶ��Ǹ�������޸�Ϊ��ǰ���λ�õ���ɫ���룩
    	    GUICtrlSetData($Input16, Hex($color, 6))
			;�޸����������ݣ���Ϊ$color��ʮ���Ƶģ�������Ҫ��Hex�����������ʮ������
			
	    	GUICtrlSetBkColor($chuang,$color)
			;���ؼ��ı�����ɫ�ĳ����λ�õ���ɫ��$chuang���Ǹ���ͼ�ؼ��������Ͻ��ǿ���ʾ��ɫ���Ǹ�����
		    GUICtrlSetData($hong,_ColorGetRed($Color));�޸ĺ�ɫ�ɷֵ����ݣ�_ColorGetRed������ָ����ɫ�ĺ�ɫ�ɷ�
			GUICtrlSetData($lv,_ColorGetGreen($Color));�޸���ɫ�ɷֵ����ݣ�ͬ�ϣ�$color�Ǵ�ʱ�������λ�õ���ɫ
 	    	GUICtrlSetData($lan,_ColorGetBlue($Color));�޸���ɫ�ɷֵ����ݣ�ͬ��
    	EndIf
	EndIf
	
	If $shu[0]<>$tempx Then GUICtrlSetData($zuobiaox,"X:"&$shu[0]&"");ʵʱ��ʾ�������λ�õ�x����
	If  $shu[1]<>$tempy Then GUICtrlSetData($zuobiaoy,"Y:"&$shu[1]&"");ʵʱ��ʾ�������λ�õ�y����
	$temp = $color;����һ����ʱ��������������һ��ȡ������ɫ���жԱȣ��иı��ȥ�޸Ŀؼ������ݣ��������Լ���CUP��ʹ��
	$tempx = $shu[0];ͬ�ϣ���ᷢ���������˼���IF�����������ж��ǲ��������ݱ䶯
	$tempy = $shu[1];ͬ��
	$nMsg = GUIGetMsg();���񴰿���Ϣ.
	Switch $nMsg
		Case $GUI_EVENT_CLOSE;�����رհ�ťX���˳�
			Exit
		Case $Buttonexit;����˳���ť
			Exit
		Case $Button10;������ư�ť��ʮ�����Ǹ���
			    _ClipBoard_SetData (GUICtrlRead($Input10));��ȡ�Ǹ�ʮ���Ƶ�������Ž��������ʵ�ָ��ƹ���
				MsgBox(0,"��ʾ","�ɹ����ƣ�",1);��ʾ���Ƴɹ�����ʱһ��
		Case $Button16;������ư�ť��ʮ�������Ǹ���
		    _ClipBoard_SetData (GUICtrlRead($Input16));ͬ��
			MsgBox(0,"��ʾ","�ɹ����ƣ�",1)
		Case $Buttonguanyu;������ڰ�ť�������Ǵ���һ���µĴ��ڣ����涼��Щ��̬��ǩ
			$sm = GUICreate("���й�����", 218, 241, -1,-1)
			GUISetBkColor(0x91D0F4)
			$banben = GUICtrlCreateLabel("�汾��1.0", 24, 32, 76, 20)
			GUICtrlSetFont(-1, 12, 400, 0, "����_GB2312")
			$zuozhe = GUICtrlCreateLabel("���ߣ�tryhi", 24, 72, 104, 23)
			GUICtrlSetFont(-1, 14, 400, 0, "����_GB2312")
			GUICtrlSetColor(-1, 0xFF0000)
			$lianxi = GUICtrlCreateLabel("QQ:601622714    ����ve�ˡ�", 32, 110, 160, 17)
			$shuoming = GUICtrlCreateLabel("˵�����򿪱����������"&@crlf&"�����޷�ʹ��"& _
			"�ո����"&@crlf&"˵�޷����֣��رձ�����"&@crlf&"������", 32, 150, 460, 50)
			GUISetState(@SW_SHOW)
			;��һ�д���̫��ʱ������"& _�س�"�����л��У�����������ʱ�ȽϷ��㣬������"&@crlf&"����ʾ����
			While 1
                $msg = GUIGetMsg()
				Select
					Case $msg = $GUI_EVENT_CLOSE
						GUIDelete($sm);�����Xʱɾ�����"����"����
						ExitLoop
				EndSelect
				
			WEnd
	EndSwitch
WEnd
Func pause();�����¿ո�ʱ��ִ���������
	If $pause = 0 Then ;��һ����������ֵ���ﵽ���¿ո����ͣ���ٰ�һ�ξͼ����Ĺ���
	    $pause = 1
		GUICtrlSetState($Button10,$GUI_ENABLE);�������ơ���������ť��ɿ��ã������ǻ�ɫ�ģ�
		GUICtrlSetState($Button16,$GUI_ENABLE)
	Else
	    $pause = 1
		$pause = 0
		GUICtrlSetState($Button10,$GUI_DISABLE);�������ơ���������ť��ɲ����ã���ɫ��
		GUICtrlSetState($Button16,$GUI_DISABLE)
	EndIf
EndFunc
