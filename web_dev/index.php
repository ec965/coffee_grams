<html>
    <head>
        <title>Coffee Grams</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link href="//rawgithub.com/indrimuska/jquery-editable-select/master/dist/jquery-editable-select.min.css" rel="stylesheet">

    </head>
    <body>
	<?php require_once("form.php"); ?>
	<div class="container">
          <h1>Coffee Grams</h1>
	  <form>
            <div class="form-group">
              <label for="brew_method">Brew Method</label>
	      <!--<input type="text" class="form-control" id="brew_method" name="brew_method" placeholder="">-->
		<select class="form-control" id="brew_method" name="brew_method">
		      <!--<option value="melitta_cone">Melitta Cone</option>-->
			<?php populate_from_db("brew_method"); ?>
		</select>
            </div> 
            <div class="form-group">
              <label for="roaster">Roaster</label>
	      <!--<input type="text" class="form-control" id="roaster" name="roaster" placeholder="">-->
		<select class="form-control" id="roaster" name="roaster">
			<?php 

ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);
populate_from_db("roaster"); ?>
		</select>
            </div>
            <div class="form-group">
              <label for="coffee_type">Coffee Name</label>
	      <!--<input type="text" class="form-control" id="coffee_type" name="coffee_type" placeholder="">-->	
		<select class="form-control" id="coffee_type" name="coffee_type">
			<?php populate_from_db("name"); ?>
		</select>
            </div>
            <div class="form-group">
              <label for="coffee_weight">Coffee (grams)</label>
              <input type="text" class="form-control" id="coffee_weight" name="coffee_weight" placeholder="Enter coffee weight">
            </div>
            <div class="form-group">
              <label for="water_weight">Water (grams)</label>
              <input type="text" class="form-control" id="water_weight" name="water_weight" placeholder="Enter water weight">
            </div>
            <div class="form-group">
              <label for="brew_time">Brew Time (mm:ss)</label>
              <input type="text" class="form-control" id="brew_time" name="brew_time" placeholder="Format time as mm:ss">
            </div>
            <button type="submit" class="btn btn-primary" id="submit-btn">Submit</button>
          </form>
        </div>


        <!-- bootstrap -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<!-- bootstrap -->
	<script src="//rawgithub.com/indrimuska/jquery-editable-select/master/dist/jquery-editable-select.min.js"></script>

	<script>
		$(function(){
			$('form').on('submit',function(e){
				e.preventDefault();
				$.ajax({
					type: 'POST',
					url: 'index.php',
					data: $('form').serialize(),
					success: function(){
						alert('form was submited');
					}
				});
			});
		});
		
		$('#brew_method').editableSelect();
		$('#roaster').editableSelect();
		$('#coffee_type').editableSelect();
	</script>
    </body>
</html>
