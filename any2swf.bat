@echo off
set ext=%~x1
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
  echo MSWORD File
  echo plase enter your command here.
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
