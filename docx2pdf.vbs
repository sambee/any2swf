Option Explicit
 
 Main()
 
 Sub Main()
    If WScript.Arguments.Count > 0 Then 
        Dim objFSO : Set objFSO = CreateObject("Scripting.FileSystemObject")
        Dim i
        For i = 0 to wscript.arguments.count - 1
            Dim strFilePath : strFilePath = WScript.Arguments.Item(i)
            Dim dirPath : dirPath = objFSO.GetParentFolderName(strFilePath)
            Dim fileBaseName : fileBaseName = objFSO.GetBaseName(strFilePath)
            'WScript.Echo strFilePath
            Dim strNewFileName : strNewFileName = dirPath & "\" & fileBaseName & ".pdf"
            'WScript.Echo strNewFileName
            Dim strFileExt : strFileExt = UCase(objFSO.GetExtensionName(strFilePath))
            Select Case strFileExt
				Case "DOCX"
					DOC2PDF strFilePath, strNewFileName
                Case "DOC"
                    DOC2PDF strFilePath, strNewFileName
                Case "XLS"
                    XLS2PDF strFilePath, strNewFileName
                Case "PPT"
                    PPT2PDF strFilePath, strNewFileName
                Case Else
                    WScript.Echo "Extension Type:  " & strFileExt
            End Select
        Next
    Else
       ' msgbox("Miss paramements.")
	   WScript.Echo("Miss paramements.")
    End If
 End Sub
 
 Sub PPT2PDF(strSourceFile, strDestFile)
    Const ppWindowMinimized = 2
    Const ppWindowNormal = 1
    Const ppSaveAsPDF = 32
    
    Dim objPPT : Set objPPT = CreateObject("PowerPoint.Application")
    objPPT.Visible = True
    objPPT.WindowState = ppWindowMinimized
    objPPT.Presentations.Open strSourceFile
    objPPT.ActivePresentation.SaveAs strDestFile, ppSaveAsPDF 
    objPPT.Quit()
 End Sub
 
 Sub DOC2PDF(strSourceFile, strDestFile)
    Const wdExportAllDocument = 0
    Const wdExportOptimizeForPrint = 0
    Const wdExportDocumentContent = 0
    Const wdExportFormatPDF = 17
    Const wdExportCreateHeadingBookmarks = 1
    
    Dim objWord : Set objWord = CreateObject("Word.Application")
    Dim objDoc : Set objDoc = objWord.Documents.Open(strSourceFile,,TRUE)    
    objWord.ActiveDocument.ExportAsFixedFormat strDestFile, wdExportFormatPDF, False, _
                    wdExportOptimizeForPrint, wdExportAllDocument,,, _
                    wdExportDocumentContent, False, True, wdExportCreateHeadingBookmarks
    objWord.Quit()
 End Sub
 
 Sub XLS2PDF(strSourceFile, strDestFile)
    Const xlTypePDF = 0
    
    Dim objExcel : Set objExcel = CreateObject("Excel.Application")
    Dim objeDoc : Set objeDoc = objExcel.Workbooks.Open(strSourceFile,,TRUE)    
    objExcel.ActiveWorkbook.ExportAsFixedFormat xlTypePDF, strDestFile
    objExcel.ActiveWorkbook.Close(False)
    objExcel.Quit
 End Sub

Sub ECHO(text)
	WScript.Echo(text)
 End Sub