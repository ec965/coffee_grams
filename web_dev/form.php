<?php
//error handeling
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);

$json_login = file_get_contents("login.json");
$login_array = json_decode($json_login, true);


$username = $login_array["username"];
$host = $login_array["host"];
$password = $login_array["password"];
$database = $login_array["database"];

if ($_SERVER["REQUEST_METHOD"] == "POST"){
	send_form();
}

function send_form(){
	global $host, $username, $password, $database;
	$conn = new mysqli($host, $username,$password,$database);
	$brew_method = $coffee_type = $brew_time = $roasters = "";
	$coffee_weight = $water_weight =0;
	$cg_data=array();

	if ($conn->connect_error){
		die("Connection failed: " . $conn->connect_error);
	}
	//echo "Connected successfully";

	$brew_method = test_input($_POST["brew_method"]);
	$roaster = test_input($_POST["roaster"]);
	$coffee_type = test_input($_POST["coffee_type"]);
	$coffee_weight = test_input($_POST["coffee_weight"]);
	$water_weight = test_input($_POST["water_weight"]);
	$brew_time = "00:" . test_input($_POST["brew_time"]);
	
	$cg_data = array("brew_method"=>$brew_method,"roaster"=>$roaster, "coffee_type"=>$coffee_type, "coffee_weight" => $coffee_weight, "water_weight" => $water_weight, "brew_time" => $brew_time);

	$sql="INSERT INTO enoch VALUES (DEFAULT";
	foreach ($cg_data as $x => $x_value){
		$sql .= ", '" . $x_value . "' ";
	}
	$sql .= ");";

	if ($conn->query($sql) === TRUE) {
	  echo "New record created successfully";
	} else {
	  echo "Error: " . $sql . "<br>" . $conn->error;
	}	

	/*foreach ($cg_data as $x => $x_value){
		echo "item: " . $x;
		echo "<br>";
		echo "data: " . $x_value;
		echo "<br>";
	}*/

	$conn->close();
}

function populate_from_db($select_item){
	
	global $host, $username, $password, $database;
	$conn = new mysqli($host, $username, $password, $database);
	if ($conn->connect_error){
		die("Connection failed: " . $conn->connect_error);
	}
	//echo "Connected successfully";


	$sql = ("SELECT DISTINCT " . $select_item ." FROM enoch;");
	
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		$i=0;
		while($row = $result->fetch_assoc()) {
			echo "<option value=\"item-" . $i . "\">" . $row[$select_item] . "</option>";
			$i++;
			/*echo $row['brew_method'];*/
	  	}
	} 
	else {
	  echo "0 results";
	}

	$conn->close();
}

function test_input($data) {
	$data = trim($data);
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	return $data;
}
?>
