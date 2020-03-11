<?php include("header.php");
// echo "hereqw";exit();
// $product=get_records($tblproducts,"trash!=1");
$id = 0;
if(isset($_GET['id'])){
  $id = dec_password($_GET['id']);
}
$category = get_records($tblcategories,"id='".$id."' and status='1' and trash='0'");
if(!(count($category)>0)){
  redirect("index");exit;
}
$products = get_records($tblproducts,"category_id='".$id."' and status>0 and  trash='0' and latitude!='' and longitude!=''");

$lat_lng = '';
if(count($products)>0){
  foreach ($products as $v) {
    $lat_lng .= '{lat: '.$v['latitude'].', lng: '.$v['longitude'].'},';
  }
}
$cat_id = dec_password($_GET['id']); 
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Hello, world!</title>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script src="jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="script.js" type="text/javascript"></script>
<!-- <script src="bootstrap.min.js" type="text/javascript"></script> -->



    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 600px;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    
  </head>
  <body>
    
	<div class="container-fluid">
    <div class="row">
    	  <div class="col-12 col-lg-8">
    		  <div id="map"></div>
        </div>
        <div class="col-12 col-lg-4" style="overflow-y: auto;height: 600px;margin-bottom: 30px;">
        	<h3>Listing <?php echo $category[0]['title']; ?></h3>
        	<div id="listing_area"></div>
        </div>
    </div>
  </div>
    <script>

      function initMap() {

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 3,
          center: {lat: -28.024, lng: 140.887}
        });

        // Create an array of alphabetical characters used to label the markers.
        ///var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        // Add some markers to the map.
        // Note: The code uses the JavaScript Array.prototype.map() method to
        // create an array of markers based on a given "locations" array.
        // The map() method here has nothing to do with the Google Maps API.
        var markers = locations.map(function(location, i) {
          return new google.maps.Marker({
            position: location,
            ///label: labels[i % labels.length]
          });
        });
		
		map.addListener('click', function(e) {
			my_function(e.latLng);
		});
		
		// Add a marker clusterer to manage the markers.
        var markerCluster = new MarkerClusterer(map, markers,
            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
      }
	  
	  function my_function(latlng){
      // alert('here'+latlng);
      // pid=1;
      var cid='<?php echo dec_password($_GET['id']); ?>';
      // alert(cid);
      if (cid>0) 
      {
               $.ajax({
                    type: "GET",
                    url: "ajaxphp.php",
                    dataType :'html',
                    data: {cid:cid,p:'getAllProduct'},
                    success: function(data){
                          $("#listing_area").html(data);
                    }
                });
      }
		  // $('#listing_area').html('Ajax Call');
	  }
	  
	  // var labels = ['test1','test2','test3'];
      var locations = [
        <?php echo $lat_lng;?>
		/**
		,
        {lat: -33.848588, lng: 151.209834},
		
		{lat: -32.718234, lng: 149.363181},
        {lat: -32.727111, lng: 149.371124},
        {lat: -32.848588, lng: 149.209834},
		
        {lat: -33.851702, lng: 151.216968},
        {lat: -34.671264, lng: 150.863657},
        {lat: -35.304724, lng: 148.662905},
        {lat: -36.817685, lng: 175.699196},
        {lat: -36.828611, lng: 175.790222},
        {lat: -37.750000, lng: 145.116667},
        {lat: -37.759859, lng: 145.128708},
        {lat: -37.765015, lng: 145.133858},
        {lat: -37.770104, lng: 145.143299},
        {lat: -37.773700, lng: 145.145187},
        {lat: -37.774785, lng: 145.137978},
        {lat: -37.819616, lng: 144.968119},
        {lat: -38.330766, lng: 144.695692},
        {lat: -39.927193, lng: 175.053218},
        {lat: -41.330162, lng: 174.865694},
        {lat: -42.734358, lng: 147.439506},
        {lat: -42.734358, lng: 147.501315},
        {lat: -42.735258, lng: 147.438000},
        {lat: -43.999792, lng: 170.463352}
		/**/
      ]
    </script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVmLHD_P8I-G2Ip-2nOG1tA1v5wK-qhH4&callback=initMap">
    </script>
    
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  </body>
</html>
<?php
include("footer.php");
?>