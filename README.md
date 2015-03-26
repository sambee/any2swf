any2swf
=======

[decripton]
using a batch file to convert any file to flash file.

[detail]
- download and intall ms word and pdf plugin .
http://www.microsoft.com/downloads/details.aspx?FamilyID=4d951911-3e7e-4ae6-b059-a2e79ed87041&displaylang=en

- download and install swftools and unzip them.
http://www.swftools.org/download.html

- copy allusing a batch file to convert any file to flash file. batch and srcipt files to the swftools directory.
- The string 'echo plase enter your command here.' in any2swf.bat replace as you want the command line
-- any2swf yourfile.png output.swf
-- any2swf c:\\01.docx d:\\02.swf

examples:
jpeg files to pdf:

-- any2swf d:/imgs/*.jpg 1.pdf
 
--
you can use imagemagick to convert tiff to pdf
I install "ImageMagick-6.8.7-6-Q16-x64-static.exe" after, I test and pass in my system.

-- @see
http://www.imagemagick.org/script/binary-releases.php#windows
http://www.ibm.com/developerworks/library/l-graf2/#N10284
http://www.imagemagick.org/Usage/layers/

