@echo off

set SWFTOOLS_PATH=.\swftools
set IMAGEMAGICK=.\ImageMagick
set CURR_DIR=%~dp0

set SRC_DIR=%~dp1
set SRC_NAME=%~n1
set SRC_EXT=%~x1
set SRC_FULL_NAME=%~nx1

set DESC_DIR=%~dp2
set DESC_NAME=%~n2
set DESC_EXT=%~x2
set DESC_FULL_NAME=%~nx2
set PARAM_1=%1
set PARAM_2=%2
cls

rem echo CURR_DIR : %CURR_DIR% 

rem echo SRC_NAME : %SRC_NAME% 
rem echo SRC_DIR : %SRC_DIR% 
rem echo SRC_EXT : %SRC_EXT% 
rem echo SRC_FULL_NAME : %SRC_FULL_NAME% 

rem echo DESC_DIR : %DESC_DIR% 
rem echo DESC_NAME : %DESC_NAME% 
rem echo DESC_EXT : %DESC_EXT% 
rem echo DESC_FULL_NAME : %DESC_FULL_NAME% 

if %SRC_EXT% ==.txt (goto txt)
if %SRC_EXT% ==.doc (goto doc)
if %SRC_EXT% ==.docx (goto docx)
if %SRC_EXT% ==.jpg (goto jpg)
if %SRC_EXT% ==.jpeg (goto jpeg)
if %SRC_EXT% ==.png (goto png)

:unknow
  echo "unkonw %SRC_EXT%"
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
  pdf2swf.exe -p 1-20 -B rfxview.swf -o %2  %~dp1%~n1.swf
  cd ..
  goto quit

:gif
  echo GIF File
  echo plase enter your command here.
  goto quit

:jpg
  echo Convert JPEG  File

  %IMAGEMAGICK%\convert.exe %PARAM_1% %DESC_DIR%\%SRC_NAME%.pdf
  cd %SWFTOOLS_PATH%
  pdf2swf.exe -p 1-20 -B rfxview.swf -o %DESC_DIR%\%DESC_FULL_NAME%  %DESC_DIR%\%SRC_NAME%.pdf
  del /f %DESC_DIR%\%SRC_NAME%.pdf
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
cd %CURR_DIR%