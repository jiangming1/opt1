;Example:
;myReplaceStringInFile("D:\AutoIt\���� article", "discuz", "BackUp,_private,images", "(?m)^tag:", "thisistag:")
; ===============================================================================
;
; Function Name: myReplaceStringInFile
; Description:: ��������ʽ�����������滻�ļ��е��ַ���
; Parameter(s): $sPath = ·��
;             $rPath = ƥ��·����������ʽ
;             $sPathExclude = Ҫ�ų���·������,�ָ����
;             $rPattern = Ҫ�������ַ���������ģʽ
;             $rReplace = �滻�ַ�����֧�ַ������ã�ʡ�Ա�ʾֻ�������滻
;             $iCount �滻������Ĭ��0������ȫ���滻
; Requirement(s): autoit v3.2.2.0��My.au3 
; Return Value(s): �ɹ��򷵻�����$a[0]�ǽ������$a[1]�ǵ�һ�����
;===============================================================================
#ce
Func myReplaceStringInFile($sPath, $rPath = 0, $sPathExclude = 0, $rPattern = 0, $rReplace = 0, $iCount = 0)
;yidabu.com��ʾ��$sRe ����ֵ,���ݹ���ã��ǿ�ѡ����Ҫ��ǰ��
Local $sRe
$sRe=myReplaceStringInFileTemp($sRe, $sPath, $rPath, $sPathExclude, $rPattern, $rReplace, $iCount)
$sRe=StringStripWS($sRe,2)
;��ʾ��stringsplitʱҪע�⣬����1����ʡ�������@cr��@lf�����ָ�����
$sRe=StringSplit($sRe,@CRLF,1)
Return $sRe
EndFunc ;==>myReplaceStringInFile
Func myReplaceStringInFileTemp(ByRef $sRe, $sPath, $rPath = 0, $sPathExclude = 0, $rPattern = 0, $rReplace = 0, $iCount = 0)
Local $hSearch, $sFile
If Not FileExists($sPath) Then Return SetError(1, 1, "")
$hSearch = FileFindFirstFile($sPath & "\*")
If $hSearch = -1 Then Return SetError(4, 4, "")
While 1
      $sFile = FileFindNextFile($hSearch)
      If @error Then
         SetError(0)
         ExitLoop
      EndIf

      ;��ʾ���Ѿ����ų���·�����Ͳ�Ҫ������Ŀ¼��
      If $sPathExclude And StringLen($sPathExclude) > 0 Then $sPathExclude = StringSplit($sPathExclude, ",")
      $bExclude = False
      If IsArray($sPathExclude) Then
         For $ii = 1 To $sPathExclude[0] Step 1
            If StringInStr($sPath & "\" & $sFile, $sPathExclude[$ii]) Then
                  $bExclude = True
                  ExitLoop
            EndIf
         Next
      EndIf
      If $bExclude Then ContinueLoop
      If StringInStr(FileGetAttrib($sPath & "\" & $sFile), "D") Then ;�������Ŀ¼�͵ݹ�
         myReplaceStringInFileTemp($sRe, $sPath & "\" & $sFile, $rPath, $sPathExclude, $rPattern, $rReplace, $iCount)
         ContinueLoop ;����Ŀ¼
      EndIf

      ;��ʾ��Ҫ������ƥ��·������ƥ��ʧ��ʱ��������
      If $rPath And (Not StringRegExp($sPath & "\" & $sFile, $rPath, 0)) Then ContinueLoop

      Local $s = FileRead($sPath & "\" & $sFile)
      ;���滻��Ҳ���ǲ���
      If Not $rReplace Then
         If Not StringRegExp($s, $rPattern, 0) Then ContinueLoop
      ;ִ���滻
      Else
         ;��Ҫ�滻���ļ����浽BackUpĿ¼���Ա���������»ָ�
         Local $CopyDest = StringRegExpReplace($sPath & "\" & $sFile, "(.+?\\)([^\\]+$)", "$1BackUp\\$2", 1)
         If FileCopy($sPath & "\" & $sFile, $CopyDest, 9) Then ConsoleWrite("backup:" & $sPath & "\" & $sFile & @LF)
         $s = StringRegExpReplace($s, $rPattern, $rReplace, $iCount)
         If @error Then ContinueLoop;�滻ʧ�ܾͲ�Ҫ���ļ���
         Local $hFile = FileOpen($sPath & "\" & $sFile, 2);���ԭ������
         FileWrite($hFile, $s)
         FileClose($hFile)
      EndIf
      $sRe &= $sPath & "\" & $sFile & @CRLF
WEnd

FileClose($hSearch)
Return $sRe
EndFunc ;==>myReplaceStringInFileTemp
