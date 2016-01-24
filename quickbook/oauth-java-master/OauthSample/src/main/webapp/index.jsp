<html xmlns="http://www.w3.org/1999/xhtml" xmlns:ipp="">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://appcenter.intuit.com/Content/IA/intuit.ipp.anywhere-1.3.2.js">
        </script>
<script>intuit.ipp.anywhere.setup({
          menuProxy: '',
          grantUrl: 'http://localhost:8080/OauthSample/RequestToken'});
     </script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>customer locator</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<style>
	.jumbotron {
    background-color: rgba(0, 0, 0, 0.5);
	}
	</style>
  </head>

  <body background="./google_maps.jpeg">
	<div id="content" style="background:./google_maps.jpeg">
    <div class="container" style ="padding-top:35px;">
      <div class="header clearfix">
        <nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Customer Locator</a>
    </div>
          <!--<ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="#">Home</a></li>
            <li role="presentation"><a href="#">About</a></li>
            <li role="presentation"><a href="#">Contact</a></li>
          </ul>-->
		  <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active" style="padding-top:5px;"><a href="#"><b>Welcome Amerca_US1</b></a></li>
          </ul>
        </nav>
        <h4 class="text-muted">Customer Locator</h4>
      </div>

      <div class="jumbotron" style ="color:white;font-family:Quattrocento Sans,sans-serif;">
        <h1>Customer Locator</h1>
        <p class="lead">Have you ever thought finding your existing customers for expanding for business would get so easier??</p>
        <p><center><a class="btn btn-lg btn-primary" href="#" role="button" onclick = "googleMaps();">Locate Customers</a></center></p>
      </div>
      </div>
      </div>
    </div>

	<div id="map"></div>
	<script type="text/javascript">
	var map;
	//var jsonString = " 'data' : [{lat: '33.34',long: '-112.02',name: 'kkk'}, {lat: '32.12',long: '-110.93',name:'lll'},{lat: '31.80',long: '-106.40',name:'dsds'},{lat: '33.93',long: '-118.40',name:'sdd'},{lat: '32.73',long: '-117.17',name:'asda'},{lat: '28.55',long: '-81.33',name: 'sdd'},{lat: '41.90',long: '-87.65',name: 'asdas'}]";
	var jsonstring = '[{"lat": "33.34","long": "-112.02","name": "kkk"}, {"lat": "32.12","long": "-110.93","name":"lll"}]';
	function initMap() {
	var myLatLng = {lat: -34.397, lng: 150.644};
	  map = new google.maps.Map(document.getElementById('map'), {
		center: {lat: -34.397, lng: 150.644},
		zoom: 8
	  });
	  
	  var marker = new google.maps.Marker({
		position: myLatLng,
		map: map,
		title: 'Hello World!'
	  });
	}
	function googleMaps()
	{
		alert('google maps called');
		$.ajax({
					type: 'POST',
					url: 'quickbooks/getAllcustomer',
					success: function(jsonstring)
					{
							var jsonobj = eval(jsonstring);
							$.ajax({
								type: "POST",
								dataType: 'html',
								url: "./GoogleMapsPlotting.html",
								success:function(html)
								{
									$('#content').html(html);
									var googlemapdata = new Array();
									var mapOptions = {
										  center: {lat: 38.83, lng: -77.01},
										  zoom: 4
										};
									var map = new google.maps.Map(document.getElementById('map'), mapOptions);
									var infowindow = new google.maps.InfoWindow();
									var marker, i;
									for (i = 0; i < jsonobj.length; i++) 
									{ 
									  marker = new google.maps.Marker({
										position: new google.maps.LatLng(jsonobj[i].lat, jsonobj[i].long),
										map: map
									  });
										google.maps.event.addListener(marker, 'click', (function(marker, i) {
										return function() {
										 var setcontentlong = 'Mobiles' ; 
										  infowindow.setContent(setcontentlong);
										  infowindow.open(map, marker);
										}
									  })(marker, i));
									 }
									
								}
							})
						}
								
							
							
				
					
				});
}
    </script>
    <script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4-upo717TaxGsks10u9MdNRgUvq8ezmo">
    </script>	
  </body>
</html>