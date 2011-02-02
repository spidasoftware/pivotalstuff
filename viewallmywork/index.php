<html>
<head>
	<title>Pivotal Test Script</title>
</head>
<body>
 View all Pivotal Work for:
 <FORM action="index.php" method="post">
    <LABEL for="name">Last Name: </LABEL>
    <INPUT type="text" name="name" >
    <INPUT type="submit" value="Send">
 </FORM>
<?php
   $apiKey = "################################"; 

   if ( isset($_POST['name']) ) {
	$name = $_POST['name']; 
   
	exec( "./pivotalviewmywork.sh $apiKey $name", $output );

	echo "<hr><pre>";
	echo implode( "\n", $output);
	echo "</pre>";
   }
?>
</body>
</html>
