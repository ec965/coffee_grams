<html>
    <head>
        <title>Coffee Grams</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link href="/editable-select/jquery-editable-select.css" rel="stylesheet">

    </head>
    <body>
	<?php require_once("form.php"); ?>
	<div class="container">
          <h1>Coffee Grams</h1>
	  <form id="cg_form">
            <div class="form-group">      
		<label class="col-form-label" for="brew_method">Brew Method</label>
		<select class="form-control" id="brew_method" name="brew_method" maxlength="30"  placeholder="Click to type...">	
			<?php $cg->populate_from_db("brew_method"); ?>
		</select>
		<div class="invalid-feedback">Please input a brew method.</div>
            </div> 
            <div class="form-group">
              <label class="col-form-label" for="roaster">Roaster</label>
	      <!--<input type="text" class="form-control" id="roaster" name="roaster" placeholder="">-->
		<select class="form-control" id="roaster" name="roaster" maxlength="30" placeholder="Click to type...">
			<?php $cg->populate_from_db("roaster"); ?> 
		</select>
		<div class="invalid-feedback">Please input a Roaster.</div>
            </div>
            <div class="form-group">
              <label class="col-form-label" for="coffee_type">Coffee Name</label>
	      <!--<input type="text" class="form-control" id="coffee_type" name="coffee_type" placeholder="">-->	
		<select class="form-control" id="coffee_type" name="coffee_type" maxlength="30" placeholder="Click to type...">	
			<?php $cg->populate_from_db("name"); ?>
		</select>
		<div class="invalid-feedback">Please input the coffee name.</div>
            </div>
            <div class="form-group">
              <label class="col-form-label" for="coffee_weight">Coffee Weight</label>
              <input type="text" class="form-control" id="coffee_weight" name="coffee_weight" maxlength="6" placeholder="Enter coffee weight in grams">
	    
		<div class="invalid-feedback">Please input a weight between 0-999.99.</div>
		</div>
            <div class="form-group">
              <label class="col-form-label" for="water_weight">Water Weight</label>
              <input type="text" class="form-control" id="water_weight" name="water_weight" maxlength="6" placeholder="Enter water weight in grams">
	    
		<div class="invalid-feedback">Please input a weight between 0-999.99.</div>
		</div>
            <div class="form-group">
              <label class="col-form-label" for="brew_time">Brew Time</label>
              <input type="text" class="form-control" id="brew_time" name="brew_time" maxlength="8" placeholder="hh:mm:ss">
	    
		<div class="invalid-feedback">Please input a brew time.</div>
		</div>
            <div class="form-group">
              <legend class="col-form-label" id="taste-legend">Taste</legend>
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
		<div class="invalid-feedback">Please select a taste.</div>
            </div>
            <div class="form-group">
              <label class="col-form-label"  for="notes">Notes</label>
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
			<?php $cg->table_from_db(); ?>
		</tbody>
		</table>	
	</div>	
			

		
	<!--jQuery-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!--popper-->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<!-- bootstrap -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<!--editable select-->
	<script src="/editable-select/jquery-editable-select.js"></script>
	<!--input masking-->
	<script src="/input-mask/jquery.inputmask.js"></script>
	<!--chart.js-->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script>
$(document).ready(function(){
	//input masking
	$('#brew_time').inputmask("99:99:99");
 
	//editable select
	$('#brew_method').editableSelect();
	$('#roaster').editableSelect();
	$('#coffee_type').editableSelect();
	
	//form validation - this function is run when the form is submitted
	function form_validation(){
		var errors = 0;
		if( !$('#brew_method').val()){
			//console.log('b meth not selected');
			errors += 1;	
			$('#brew_method').removeClass("is-valid").addClass("is-invalid");
		}
		else{
			$('#brew_method').removeClass("is-invalid").addClass("is-valid");
		}

		if( !$('#roaster').val()){
			//console.log('roaster not selected');
			errors += 1;
			$('#roaster').removeClass("is-valid").addClass("is-invalid");
		}
		else{
			$('#roaster').removeClass("is-invalid").addClass("is-valid");
		}

		if( !$('#coffee_type').val()){
			//console.log('c_type not selected');
			errors += 1;
			$('#coffee_type').removeClass("is-valid").addClass("is-invalid");
		}
		else{
			$('#coffee_type').removeClass("is-invalid").addClass("is-valid");
		}
		
		var c_weight = parseFloat($('#coffee_weight').val());
		if( (c_weight > 999.99) || (c_weight < 0) || !$('#coffee_weight').val() ){
			//console.log('c_weight too big or negative');
			errors +=1;
			$('#coffee_weight').removeClass("is-valid").addClass("is-invalid");
		}
		else{
			$('#coffee_weight').removeClass("is-invalid").addClass("is-valid");
		}
		
		var w_weight = parseFloat($('#water_weight').val());
		if ( (w_weight > 999.99) || (w_weight < 0) || !$('#water_weight').val()){
			//console.log('w_weight too big or negative');
			errors +=1;
			$('#water_weight').removeClass("is-valid").addClass("is-invalid");
		}
		else{
			$('#water_weight').removeClass("is-invalid").addClass("is-valid");
		}
		

		//validate the time against these 3 regex keys
		const time_key1 = new RegExp(/([0-9]{2}):([0-5][0-9]):([0-5])([0-9])/);
		const time_key2 = new RegExp(/[0-5][0-9][0-5][0-9]/);
		const time_key3 = new RegExp(/[0-9][0-5][0-9]/);
		var br_time = $('#brew_time').val();
		
		//console.log(time_key1.test(br_time));
		//console.log(time_key2.test(br_time));
		//console.log(time_key3.test(br_time));

		if ( !( time_key1.test(br_time) || time_key2.test(br_time) || time_key3.test(br_time))){
			//console.log('br_time format is invalid');
			errors+=1;
			$('#brew_time').removeClass("is-valid").addClass("is-invalid");
		}
		else{
			$('#brew_time').removeClass("is-invalid").addClass("is-valid");
		}
		
		if ( !$("input:radio[name='taste']:checked").is(':checked')){
			//console.log('please select a taste');
			errors+=1;
			$('#taste-legend').removeClass("is-valid").addClass("is-invalid");
		}
		else{
			$('#taste-legend').removeClass("is-invalid").addClass("is-valid");
		}
		
		if( $('#notes').text().length > 100){
			//console.log('notes error');
			errors + 1;
			$('#notes').removeClass("is-valid").addClass("is-invalid");
		}
		else{
			$('#notes').removeClass("is-invalid").addClass("is-valid");
		}
			
		if(errors > 0){
			console.log('form invalid');
			return false;
		}
		else{
			console.log('form valid');
			return true;	
		}
	}	



	//AJAX - form POSTing and return data processing

	$('#cg_form').on('submit',function(e){
		e.preventDefault();
		if(form_validation()){
			$.ajax({
				type: 'POST',
				url: 'form.php',
				data: $('#cg_form').serialize(),
				dataType : 'json',
				success: function(data){
					alert('The form was submited.');
					//console.log(data);
					
					//update the table
					var new_tbody = "";
					for(var i=data.length-1; i > -1; i--){
						new_tbody += "<tr>";
						new_tbody += "<td scope=\"row\">" + data[i].timestamp + "</td>";	
						new_tbody += "<td scope=\"row\">" + data[i].brew_method + "</td>";
						new_tbody += "<td scope=\"row\">" + data[i].roaster + "</td>";
						new_tbody += "<td scope=\"row\">" + data[i].name + "</td>";
						new_tbody += "<td scope=\"row\">" + data[i].weight + "</td>";
						new_tbody += "<td scope=\"row\">" + data[i].h2o_weight + "</td>";
						new_tbody += "<td scope=\"row\">" + data[i].brew_time + "</td>";
						new_tbody += "<td scope=\"row\">" + data[i].taste + "</td>";
						new_tbody += "<td scope=\"row\">" + data[i].note + "</td>";
						new_tbody += "</tr>";
					}
					$('#dt-tbody').html(new_tbody);

					//update the chart
					chart.data.labels.push( data[data.length-1].timestamp );
					ratio_weight.push( parseInt(data[data.length-1].weight) / parseInt(data[data.length-1].h2o_weight) );
					chart.data.datasets[1].data.push( data[data.length-1].taste);
					chart.update();
						
				},
				error:function(xhr,resp,text){
					console.log(xhr,resp,text);
				}
			});
		}
	});



	//chart.js
	
	//get the coffee to water ratio
	var c_weight = [<?php $cg->chart_from_db("weight"); ?>];

	var w_weight = [<?php $cg->chart_from_db("h2o_weight"); ?>];
	var ratio_weight = [];
	for (var i=0; i<c_weight.length; i++){
		ratio_weight.push(c_weight[i]/w_weight[i]);
	}

	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
	    // The type of chart we want to create
		type: 'line',

	    // The data for our dataset
		data: {
			labels: [<?php $cg->chart_string_from_db("timestamp"); ?> ],
			datasets: [{
				label:'Coffee:Water Ratio',
				backgroundColor:'#36a2eb',
				borderColor:'#36a2eb',
				yAxisID:'num',
				data:ratio_weight,
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
});
</script>
	
    </body>
</html>
