#include <Excel.au3>

$oExcel = _ExcelBookOpen(@ScriptDir & '\Excel.xlsx')
;�򿪵�ǰĿ¼�µ�Excel.xlsx����ļ�

With $oExcel
	.Range("A1:B13").Select
	;��仰����˼��ѡ��A1:B13�����ݣ���ʵûʲô�ÿ���ɾ��
    .ActiveSheet.Shapes.AddChart.Select
	;��仰�ǲ���һ��ͼ��
    .ActiveChart.SetSourceData = .Range("Sheet1!$A$1:$B$13")
	;��仰����˼������ͼ�������Դ��$A$1:$b$13
	;��仰��������Դ��VBA����Source�Ǹ������ͼ������Դ��ʲô
	;��au3������԰����ɾ����Ҳ����ʶ������
	;ͬ��������RangeҲ��$oExcel��һ��������������ǰ�����.
    .ActiveChart.ChartType = 5
	;��仰����˼������ͼ��������Ǳ�ͼ
	;�������xlPie���ǿ���ͨ��VBA�Ķ�����������鿴����ֵ
	;����ֵ���ǿ���=5����������ֱ������5�Ϳ����ˡ�
EndWith

;�������ǾͿ��Կ����Զ�����ͼ��Ĺ����ˡ���Ƶ���˽�����

Sleep(5000)
;�ӳ�5��
_ExcelBookClose($oExcel)
;�رձ���ļ�