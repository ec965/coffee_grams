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
$table = "enoch";

$cg = new cg_form($username,$host,$password,$database,$table);

if ($_SERVER["REQUEST_METHOD"] == "POST"){
	$cg->send_form();
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
	
	//form variables

	private $table;
	private $cg_data = array("brew_method"=>null,
		"roaster"=>null, 
		"coffee_type"=>null, 
		"coffee_weight" => null, 
		"water_weight" => null, 
		"brew_time" => null,
		"taste"=>null,
		"notes"=>null);

	public function __construct($username,$host,$password,$database,$table){
		parent::__construct($username,$host,$password,$database);
		$this->table=$table;	
	}
	public function send_form(){
		$this->conn_db();
		$this->cg_data["brew_method"] = $this->test_input($_POST["brew_method"]);
		$this->cg_data["roaster"] = $this->test_input($_POST["roaster"]);
		$this->cg_data["coffee_type"] = $this->test_input($_POST["coffee_type"]);
		$this->cg_data["coffee_weight"] = $this->test_input($_POST["coffee_weight"]);
		$this->cg_data["water_weight"] = $this->test_input($_POST["water_weight"]);
		$this->cg_data["brew_time"] = ("00:" . $this->test_input($_POST["brew_time"]));
		$this->cg_data["taste"] = $this->test_input($_POST["taste"]);
		$this->cg_data["notes"] = $this->test_input($_POST["notes"]);
		var_dump($this->cg_data);	
		$sql = "INSERT INTO " . $this->table . " VALUES (DEFAULT";
		foreach ($this->cg_data as $i => $i_value){
			$sql .= ', \'' . $i_value . '\' ';
			echo "<br>";
			echo $i_value;
		}
		$sql .= ");";
		echo $sql;	
		if ($this->conn->query($sql) === TRUE){
			echo "New record created successfully";
		}else{
			echo "Error: " . $sql . "<br>" . $this->conn->error;
		}
		$this->disconn_db();
	}
	private function test_input($data){
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}

	public function populate_from_db($select_item){	
		$this->conn_db();
		$sql = ("SELECT DISTINCT " . $select_item ." FROM " .$this->table . ";");
		
		$result = $this->conn->query($sql);

		if ($result->num_rows > 0) {
			$i=0;
			while($row = $result->fetch_assoc()) {
				echo "<option value=\"item-" . $i . "\">" . $row[$select_item] . "</option>";
				$i++;
			}
		} 
		else {
		  echo "0 results";
		}

		$this->disconn_db();
	}
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
	public function table_from_db(){
		
		$this->conn_db();
		$sql = ("SELECT timestamp, brew_method, roaster, name, weight, h2o_weight, brew_time, taste, note FROM " . $this->table . ";");
		
		$result = $this->conn->query($sql) or die($this->conn->error);;
		
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
		$this->disconn_db();	
	}
}

?>
