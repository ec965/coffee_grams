<?php
//error handeling
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);

//login using JSON
$json_login = file_get_contents("login.json");
$login_array = json_decode($json_login, true);

$username = $login_array["username"];
$host = $login_array["host"];
$password = $login_array["password"];
$database = $login_array["database"];
$table = "enoch";

//create a new cg form class
$cg = new cg_form($username,$host,$password,$database,$table);

if ($_SERVER["REQUEST_METHOD"] == "POST"){
	$cg->check_form();//backend form validation
	$sel_arr = array('timestamp','brew_method','roaster','name','weight','h2o_weight','brew_time','taste','note');
	$cg->send_sql_json($sel_arr);//send back db data
}

class db_connect {
	//mysql login
	private $username;
	private $host;
	private $password;
	private $database;
	//mysql connection
	protected $conn;
	
	public function __construct($username, $host, $password, $database){
		$this->username=$username;
		$this->host=$host;
		$this->password=$password;
		$this->database=$database;
	}
	protected function conn_db(){	
		$this->conn = new mysqli($this->host, $this->username, $this->password, $this->database);
		if($this->conn->connect_error){
			die("Connection failed: " . $this->conn->connect_error);
		}
	}
	protected function disconn_db(){
		$this->conn->close();
	}
}

class cg_form extends db_connect{
	
	//table for the db
	private $table;

	//save all form data into this array
	private $cg_data = array("brew_method"=>null,
		"roaster"=>null, 
		"coffee_type"=>null, 
		"coffee_weight"=>null, 
		"water_weight"=>null, 
		"brew_time"=>null,
		"taste"=>null,
		"notes"=>null);

	public function __construct($username,$host,$password,$database,$table){
		parent::__construct($username,$host,$password,$database);
		$this->table=$table;	
	}

	//insert an associative array into the database
	//take not that the first value is DEFAULT
	private function insert_form_db($data_array){
		$this->conn_db();
		$sql = "INSERT INTO " . $this->table . " VALUES (DEFAULT";
		foreach ($data_array as $x => $x_val){	
			$sql .= ', \'' . $x_val . '\' ';
		}
		$sql .= ");";
		
		//echo $sql;	
		if ($this->conn->query($sql) === TRUE){
		//	echo "New record created successfully";
		}else{
			echo "Error: " . $sql . "<br>" . $this->conn->error;
		}
		$this->disconn_db();
	}
	//select item is an array of all items to be queried from the db
	//if the first item in $sel_arry is 'DISTINCT' then only unique results will be sent
	public function send_sql_json($sel_arr){
		$this->conn_db();
		$json_array = array();
		$sql = ("SELECT ");
		foreach ($sel_arr as $i){
			$sql .= ($i . ", ");	
		}
		$sql = rtrim($sql, ", ");
		$sql .= (" FROM " . $this->table . ";");
		//echo $sql;
			
		$result = $this->conn->query($sql);
		while ($row=$result->fetch_array(MYSQLI_ASSOC)){
			$json_array[] = $row;
		}
		echo json_encode($json_array);
		flush();
	}
	//protection
	private function test_input($data){
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}
	//checks the form and sends it to the database
	public function check_form(){
		$this->cg_data["brew_method"] = $this->test_input($_POST["brew_method"]);
		$this->cg_data["roaster"] = $this->test_input($_POST["roaster"]);
		$this->cg_data["coffee_type"] = $this->test_input($_POST["coffee_type"]);
		$this->cg_data["coffee_weight"] = $this->test_input($_POST["coffee_weight"]);
		$this->cg_data["water_weight"] = $this->test_input($_POST["water_weight"]);
		$this->cg_data["brew_time"] = ($this->test_input($_POST["brew_time"]));
		$this->cg_data["taste"] = $this->test_input($_POST["taste"]);
		$this->cg_data["notes"] = $this->test_input($_POST["notes"]);

		$error = "";

		if( strlen($this->cg_data['brew_method']) > 30){
			$error.= "brew_method err; ";
		}
		if( strlen($this->cg_data['roaster']) > 30 ){
			$error.= "roaster err; ";
		}
		if( strlen($this->cg_data['coffee_type']) > 30 ){
			$error.="coffee_type err; ";
		}
		if( floatval($this->cg_data['coffee_weight']) > 999.99 ){
			$error.= "coffee_weight err; ";
		}
		if( floatval($this->cg_data['water_weight']) > 999.99 ){
			$error .= "water_weight err; ";
		}
		if( !(preg_match("/([0-9]{2}):([0-5][0-9]):([0-5])([0-9])/",$this->cg_data['brew_time'])) && !(preg_match("/[0-5][0-9][0-5][0-9]/",$this->cg_data['brew_time'])) && !(preg_match("/[0-9][0-5][0-9]/",$this->cg_data['brew_time'])) ){
			$error .= "brew_time err; ";
		}
		$taste_check = array('ok','good','average','poor','bad');
		if( !(in_array($this->cg_data['taste'], $taste_check)) ){
			$error.="taste err; ";	
		}
		if( strlen($this->cg_data['notes']) > 100){
			$error.="notes err;";
		}

		if ($error == ""){
			$this->insert_form_db($this->cg_data);
			//if everything matches, we can insert the data into the database
		}
		else{
			echo $error;
		}
	}	
	//used to populate form field select options
	public function populate_from_db($select_item){	
		$this->conn_db();
		$sql = ("SELECT DISTINCT " . $select_item ." FROM " .$this->table . ";");
		
		$result = $this->conn->query($sql);

		if ($result->num_rows > 0) {
			$data = array();
			while($row = $result->fetch_assoc()) {
				$data[] = $row[$select_item];
			}
			$data = array_reverse($data, true);
			$i=0;
			foreach ($data as $item){
				echo "<option value=\"item-" . $i . "\">" . $item . "</option>";
				$i++;
			}
		} 
		else {
		  echo "0 results";
		}

		$this->disconn_db();
	}
	//inject info into javascript for initial chart values
	public function chart_from_db($select_item){
		$this->conn_db();
		$sql = ("SELECT " . $select_item . " FROM " . $this->table . ";");
		$result = $this->conn->query($sql);
			
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

		$this->disconn_db();
	}
	//inject info into javascript for initial chart values
	public function chart_string_from_db($select_item){
		$this->conn_db();
		$sql = ("SELECT " . $select_item . " FROM " . $this->table . ";");
		
		$result = $this->conn->query($sql);
			
		$result_arr = array();
		if ($result->num_rows > 0) {
			while($row = $result->fetch_assoc()) {
				array_push($result_arr,$row[$select_item]);
			}
			for ($i=0; $i< (count($result_arr)-1) ; $i++){
				echo "'" . $result_arr[$i] . "', ";
			}
			echo "'" . $result_arr[count($result_arr)-1] . "'";
		} 
		else {
		  echo "0 results";
		}

		$this->disconn_db();
	}
	//inject html to populate the table on the webpage
	public function table_from_db(){
		
		$this->conn_db();
		$sql = ("SELECT timestamp, brew_method, roaster, name, weight, h2o_weight, brew_time, taste, note FROM " . $this->table . ";");
		
		$result = $this->conn->query($sql) or die($this->conn->error);;
		
		if($result->num_rows > 0){
			$data = array();
			while($row = $result->fetch_assoc()){
				$data[] = $row;
			}
			$data = array_reverse($data,true);

			foreach($data as $fields=>$field){	
				echo "<tr>";
				foreach($data[$fields] as $items){
					echo "<td scope=\"row\">" . $items . "</td>";
				}
				echo "</tr>";
			}				
		}
		else{
			echo "0 results";
		}
		$this->disconn_db();	
	}
}

?>
