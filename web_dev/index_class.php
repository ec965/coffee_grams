<html>
    <head>
        <title>Coffee Grams</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link href="//rawgithub.com/indrimuska/jquery-editable-select/master/dist/jquery-editable-select.min.css" rel="stylesheet">

    </head>
    <body>
	<?php require_once("form_class.php"); ?>
	<div class="container">
          <h1>Coffee Grams</h1>
	  <form>
            <div class="form-group">
              <label for="brew_method">Brew Method</label>
	      <!--<input type="text" class="form-control" id="brew_method" name="brew_method" placeholder="">-->
		<select class="form-control" id="brew_method" name="brew_method" maxlength="30"  placeholder="Click to type...">
		      <!--<option value="melitta_cone">Melitta Cone</option>-->
			<?php $cg->populate_from_db("brew_method"); ?>
		</select>
            </div> 
            <div class="form-group">
              <label for="roaster">Roaster</label>
	      <!--<input type="text" class="form-control" id="roaster" name="roaster" placeholder="">-->
		<select class="form-control" id="roaster" name="roaster" maxlength="30" placeholder="Click to type...">
			<?php $cg->populate_from_db("roaster"); ?> 
		</select>
            </div>
            <div class="form-group">
              <label for="coffee_type">Coffee Name</label>
	      <!--<input type="text" class="form-control" id="coffee_type" name="coffee_type" placeholder="">-->	
		<select class="form-control" id="coffee_type" name="coffee_type" maxlength="30" placeholder="Click to type...">
			<?php $cg->populate_from_db("name"); ?>
		</select>
            </div>
            <div class="form-group">
              <label for="coffee_weight">Coffee (grams)</label>
              <input type="text" class="form-control" id="coffee_weight" name="coffee_weight" maxlength="6" placeholder="Enter coffee weight">
            </div>
            <div class="form-group">
              <label for="water_weight">Water (grams)</label>
              <input type="text" class="form-control" id="water_weight" name="water_weight" maxlength="6" placeholder="Enter water weight">
            </div>
            <div class="form-group">
              <label for="brew_time">Brew Time (mm:ss)</label>
              <input type="text" class="form-control" id="brew_time" name="brew_time" maxlength="5" placeholder="Format time as mm:ss">
	    </div>
            <div class="form-group">
              <legend>Taste</legend>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="taste" id="bad_taste" value="bad">
		  <label class="form-check-label" for="bad_taste">Bad</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="taste" id="poor_taste" value="poor">
		  <label class="form-check-label" for="poor_taste">Poor</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="taste" id="ok_taste" value="ok">
		  <label class="form-check-label" for="ok_taste">Okay</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="taste" id="average_taste" value="average">
		  <label class="form-check-label" for="average_taste">Average</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="taste" id="good_taste" value="good">
		  <label class="form-check-label" for="good_taste">Good</label>
		</div>
            </div>
            <div class="form-group">
              <label for="notes">Notes</label>
              <input type="text" class="form-control" id="notes" name="notes" maxlength="100" placeholder="">
            </div>
            <button type="submit" class="btn btn-primary" id="submit-btn">Submit</button>
          </form>
	</div>

	<div class="container">
		<div class="row">
		</div>
		<div class="row">			
			<canvas id="myChart"></canvas>
		</div>
	</div>

	<div class="container">
		<h1>Data Table</h1>
		<table class="table table-bordered">
		<thead>
			<tr>
			<th scope="col">Timestamp</th>		
			<th scope="col">Brew Method</th>
			<th scope="col">Roaster</th>
			<th scope="col">Coffee Type</th>
			<th scope="col">Coffe Weight</th>
			<th scope="col">Water Weight</th>
			<th scope="col">Brew Time</th>
			<th scope="col">Taste</th>
			<th scope="col">Notes</th>
			</tr>
		</thead>
		<tbody id="dt-tbody">
			<?php $cg->table_from_db() ?>
		</tbody>
		</table>	
	</div>	
			

		
        <!-- bootstrap -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<!-- bootstrap -->
	<script src="//rawgithub.com/indrimuska/jquery-editable-select/master/dist/jquery-editable-select.min.js"></script>

	<script>
		//AJAX
		$(function(){
			$('form').on('submit',function(e){
				e.preventDefault();
				$.ajax({
					type: 'POST',
					url: 'index_class.php',
					data: $('form').serialize(),
					success: function(){
						alert('form was submited');
					}
				});
			});
		});
		//editable select
		$('#brew_method').editableSelect();
		$('#roaster').editableSelect();
		$('#coffee_type').editableSelect();


	</script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script>
		//chart.js
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
			type: 'line',

		    // The data for our dataset
			data: {
		    		labels: [<?php $cg->chart_string_from_db("timestamp"); ?> ],
				datasets: [{
					label: 'Coffee Weight',
					backgroundColor: 'rgb(255, 99, 132)',
					borderColor: 'rgb(255, 99, 132)',
					yAxisID:'num',
					data: [<?php $cg->chart_from_db("weight"); ?>],
					fill:false,
					hidden:true
				},{
					label:'Water Weight',
					backgroundColor:'#58D68D',
					borderColor:'#58D68D',
					yAxisID:'num',
					data:[<?php $cg->chart_from_db("h2o_weight"); ?>],
					fill:false,
					hidden:true			
				},{
					label:'Coffee:Water Ratio',
					backgroundColor:'#36a2eb',
					borderColor:'#36a2eb',
					yAxisID:'num',
					data:[],
					fill:false

				},{
					label:'Taste',
					backgroundColor:'#A569BD',
					borderColor:'#A569BD',
					yAxisID:'taste',
					data:[<?php $cg->chart_string_from_db("taste");?>],
					fill:false
				}]
			},

		    // Configuration options go here
			options: {
				title:{
					display:true,
					text: 'Coffee Graphs'
				},
				animation:false,
				scales:{
					yAxes:[{
						id:'num',
						type:'linear',
						position:'left'
					},{
						id:'taste',
						type:'category',
						labels:['good','okay','average','bad','poor'],
						position:'right'
					}]
				}
			}
		});
		for (var i=0; i<chart.data.datasets[0].data.length; i++){
			chart.data.datasets[2].data.push(chart.data.datasets[0].data[i]/chart.data.datasets[1].data[i]);
		}
		chart.update();
	</script>
    </body>
</html>
