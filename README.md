any2swf
=======

[decripton]
using a batch file to convert any file to flash file.

[detail]
- download and intall ms word and pdf plugin .
http://www.microsoft.com/downloads/details.aspx?FamilyID=4d951911-3e7e-4ae6-b059-a2e79ed87041&displaylang=en

- download , install and unzip swftools.
http://www.swftools.org/download.html

- copy all using a batch file to convert any file to flash file. batch and srcipt files to the swftools directory.
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


<code>
	/// <summary>
        /// 将PDF转换为SWF文件
        /// </summary>
        /// <param name="pdfPath">PDF文件路径</param>
        /// <param name="swfPath">SWF文件路径</param>
        /// <param name="page"></param>
        public static void ConvertToSwf(string pdfPath, string swfPath, int page)
        {
            try
            {
                string exe = HttpContext.Current.Server.MapPath(EL_Config.Tools.Pdf2Swf.Url);
                if (!File.Exists(exe))
                {
                    throw new ApplicationException("Can not find: " + exe);
                }

                StringBuilder sb = new StringBuilder();
                sb.Append(" -o \"" + swfPath + "\"");//output
                sb.Append(" -z");
                sb.Append(" -s flashversion=9");//flash version
                sb.Append(" -s disablelinks");//禁止PDF里面的链接
                sb.Append(" -p " + "1" + "-" + page);//page range
                sb.Append(" -j 100");//Set quality of embedded jpeg pictures to quality. 0 is worst (small), 100 is best (big). (default:85)
                sb.Append(" \"" + pdfPath + "\"");//input

                System.Diagnostics.Process proc = new System.Diagnostics.Process();
                proc.StartInfo.FileName = exe;
                proc.StartInfo.Arguments = sb.ToString();
                proc.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
                proc.Start();
                proc.WaitForExit();
                proc.Close();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
</code>