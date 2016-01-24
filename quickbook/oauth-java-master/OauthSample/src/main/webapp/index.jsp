<html xmlns="http://www.w3.org/1999/xhtml" xmlns:ipp="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Connect Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://appcenter.intuit.com/Content/IA/intuit.ipp.anywhere-1.3.2.js">
        </script>
<script>intuit.ipp.anywhere.setup({
          menuProxy: '',
          grantUrl: 'http://localhost:8080/OauthSample/RequestToken'});
     </script>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 100%;
}
</style>
</head>
<body>
<h1>Google Maps</h1>
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
	$.ajax({
				type: 'POST',
				url: 'quickbooks/getAllcustomer',
				success: function(jsonstring)
				{
						var jsonobj = eval(jsonstring);
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
							var setcontentlong = jsonobj[i].name ;
							  infowindow.setContent(setcontentlong);
							  infowindow.open(map, marker);
							}
						  })(marker, i));
						 }
				}
			});
	}

					
				</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4-upo717TaxGsks10u9MdNRgUvq8ezmo&callback=googleMaps">
    </script>
</body>
</html>
