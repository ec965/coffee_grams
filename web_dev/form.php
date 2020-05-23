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
//chart_from_db("timestamp");
if ($_SERVER["REQUEST_METHOD"] == "POST"){
	send_form();
}

//form handler
function send_form(){
	global $host, $username, $password, $database;
	$conn = new mysqli($host, $username,$password,$database);
	$brew_method = $coffee_type = $brew_time = $roasters = $taste = $notes = "";
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
	$taste = test_input($_POST["taste"]);
	$notes = test_input ($_POST["notes"]);	
	$cg_data = array("brew_method"=>$brew_method,
		"roaster"=>$roaster, 
		"coffee_type"=>$coffee_type, 
		"coffee_weight" => $coffee_weight, 
		"water_weight" => $water_weight, 
		"brew_time" => $brew_time,
		"taste"=>$taste,
		"note"=>$notes);

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

//populates dropdown form options from database
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
			/*echo $row[$selected_item];*/
	  	}
	} 
	else {
	  echo "0 results";
	}

	$conn->close();
}

//gets database information as default type and formats it for the chart.js plugin
function chart_from_db($select_item){	
	global $host, $username, $password, $database;
	$conn = new mysqli($host, $username, $password, $database);
	if ($conn->connect_error){
		die("Connection failed: " . $conn->connect_error);
	}
	//echo "Connected successfully";


	$sql = ("SELECT " . $select_item ." FROM enoch;");
	
	$result = $conn->query($sql);
	$result_arr = array();
	if ($result->num_rows > 0) {
		
		while($row = $result->fetch_assoc()) {
			array_push($result_arr,$row[$select_item]);
		}
		for ($i=0; $i< (count($result_arr)-1) ; $i++){
			echo $result_arr[$i] . ", ";
		}
		echo $result_arr[count($result_arr)-1];
	} 
	else {
	  echo "0 results";
	}

	$conn->close();
}

//gets database information as string and formats it for the chart.js plugin
function chart_string_from_db($select_item){	
	global $host, $username, $password, $database;
	$conn = new mysqli($host, $username, $password, $database);
	if ($conn->connect_error){
		die("Connection failed: " . $conn->connect_error);
	}
	//echo "Connected successfully";


	$sql = ("SELECT " . $select_item ." FROM enoch;");
	
	$result = $conn->query($sql);
	$result_arr = array();
	if ($result->num_rows > 0) {
		
		while($row = $result->fetch_assoc()) {
			array_push($result_arr,$row[$select_item]);
		}
		for ($i=0; $i< (count($result_arr)-1) ; $i++){
			echo "'".$result_arr[$i] . "', ";
		}
		echo "'".$result_arr[count($result_arr)-1]."'";
	} 
	else {
	  echo "0 results";
	}

	$conn->close();
}
//populate a table with the database
function table_from_db(){	
	global $host, $username, $password, $database;
	$conn = new mysqli($host, $username, $password, $database);
	if ($conn->connect_error){
		die("Connection failed: " . $conn->connect_error);
	}
	//echo "Connected successfully";

	$sql = ("SELECT timestamp, brew_method, roaster, name, weight, h2o_weight, brew_time, taste, note FROM enoch;");

	$result = $conn->query($sql) or die($conn->error);
	
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			echo "<tr>";
			foreach ($row as $field => $item){	
				echo "<td scope=\"row\">" . $row[$field] . "</td>";
			}
			echo "</tr>";
		}
	}
	else{
		echo "0 results";
	}
	
	$conn->close();	
}

//input security measure
function test_input($data) {
	$data = trim($data);
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	return $data;
}
?>
