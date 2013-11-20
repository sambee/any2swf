
var console = {
    // Log output to console if available.
    //      NOTE: Script file has to be executed using "cscript.exe" for this to work.
    info: function (text) {
        try {
            // Test if stdout is working.
            WScript.stdout.WriteLine(text);
            // stdout is working, reset this function to always output to stdout.
            this.log = function (text) { WScript.stdout.WriteLine(text); };
        } catch (er) {
            // stdout is not working, reset this function to do nothing.
            this.log = function () { };
        }
    }
};



var word;
var src = WScript.arguments(0);
var desc = WScript.arguments(1);
try{
 console.info('-- Convert... from ' + src + " to " + desc );
 word = new ActiveXObject("Word.Application");
 var doc = word.documents.open(src); 
 var wdExportFormatPDF = 17;

//@link http://msdn.microsoft.com/en-us/library/bb256835%28v=office.12%29.aspx

word.ActiveDocument.ExportAsFixedFormat(desc, wdExportFormatPDF);
 console.info('--------------------------success');

}finally{
  if(word || word!=null){
	  word.Application.Quit();
	  word = null;
  }
}
