@echo off
set ext=%~x1
set SWFTOOLS_PATH=.\swftools
if %ext% ==.txt (goto txt)
if %ext% ==.doc (goto doc)
if %ext% ==.docx (goto docx)
if %ext% ==.jpg (goto jpg)
if %ext% ==.jpeg (goto jpeg)
if %ext% ==.png (goto png)


:unknow
  echo "unkonw %ext%"
  goto quit

:txt
  echo Text File
  echo plase enter your command here.
  goto quit

:doc 
:docx  
  echo Convert MSWORD File
  echo "%1 to %~n1.pdf"
  cscript docx2pdf.js %1 %~dp1%~n1.pdf
  cd %SWFTOOLS_PATH%
  pdf2swf.exe -p 1-20 -B rfxview.swf -o %2  %~dp1%~n1.pdf
  cd ..
  goto quit

:gif
  echo GIF File
  echo plase enter your command here.
  goto quit

:jpg
  echo JPEG File
  echo plase enter your command here.
  goto quit

:tif
  echo JPEG File
  echo plase enter your command here.
  goto quit

:png
  echo PNG File
  echo plase enter your command here.
  goto quit

:quit
