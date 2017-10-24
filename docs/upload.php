<?php
$version = 1.030;

$path = $_SERVER['DOCUMENT_ROOT'];
@include("$path/aspnet/src/php/functions.php");
$uri = getURI();
$ignoredFolders = getIgnoredFolders(__DIR__);
$fileHandling = getFileHandling(__DIR__);
$source = getSourceDir();

$handle=opendir ('.');
echo "<!DOCTYPE HTML>\n";
echo "<html>\n<head>\n";
echo "<meta charset=\"UTF-8\">\n";
addDateMeta();
echo "<title>Index</title>\n";
echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"$source/css/index_style.css\">\n";
echo "<script src=\"$source/js/index_cols.js\"></script>\n";
echo "</head>\n<body onload=\"adjustCols();\">";
$folder = basename(__DIR__);
echo "<h1>&#92;$folder</h1>\n";
$files = "";
$pics = "";
$lfiles = "";
echo "<hr>\n<div class=\"cols\">\n";
$one = false;
$onedir = false;
$onefile = false;
$onelfile = false;
$onepic = false;

$thisfile = basename(__FILE__);
while (false !== ($file = readdir ($handle))) {
		if($file == '.' || $file == '..')
			continue;
		else if(is_dir($file))
		{
			$direc = basename($file);
			if(in_array($direc, $ignoredFolders))
				continue;
			$onedir = true;
			echo "<nobr><img src=\"$source/pictures/ordner.png\" />";
			createNextIndex($file, $version);
		}
		else
		{
			$basefile = basename($file);
			$ending = ending($basefile);
			if($thisfile == $basefile)
				continue;
			else
			{
				$val = handleFile($fileHandling,$ending);
				if($val === false) continue;
				$type = $val["type"];
				if(preg_match('/downloadfile/',$type,$m))
				{
					$onefile = true;
					$path = str_replace('$SRC',"$source",$val["imgsrc"]);
					$path = str_replace('$URI',"$uri",$path);
					$path = str_replace('$FILE',"$file",$path);
					$files = $files . "<nobr><img src=\"$path\" />";
					$files = $files . "<a href=\"$file\" download>$basefile</a></nobr><br>\n";
				}
				else if(preg_match('/linkfile/', $type, $m))
				{
					$onelfile = true;
					$path = str_replace('$SRC',"$source",$val["imgsrc"]);
					$path = str_replace('$URI',"$uri",$path);
					$path = str_replace('$FILE',"$file",$path);
					$lfiles = $lfiles . "<nobr><img src=\"$path\" />";
					$lfiles = $lfiles . "<a href=\"$file\">$basefile</a></nobr><br>\n"; 
				}
				else if(preg_match('/downloadimg/',$type,$m))
				{
					$onepic = true;
					$path = str_replace('$SRC',"$source",$val["imgsrc"]);
					$path = str_replace('$URI',"$uri",$path);
					$path = str_replace('$FILE',"$file",$path);
					$pics = $pics . "<nobr><a href=\"$file\" download><img class=\"preview\" src=\"$path\" />";
					$pics = $pics . "<span class=\"imga\">$basefile</span></a></nobr><br>\n";
				}
			}
		}
}

if($onedir)
	echo "</div>\n<hr>\n<div class=\"cols\">\n";
if($onelfile)
	echo "$lfiles</div>\n<hr>\n<div class=\"cols\">\n";
if($onefile)
	echo "$files</div>\n<hr>\n<div class=\"cols\">\n";
echo "$pics</div>\n";
if($onepic)
	echo "<hr>\n";
createBackIndex();
echo "</body></html>";

closedir($handle);

?>