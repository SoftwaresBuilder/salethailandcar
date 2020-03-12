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

    
	<div class="container-fluid">
    <div class="row">
    	  <div class="col-12 col-lg-8">
    		  <div id="map"></div>
        </div>
        <div class="col-12 col-lg-4" style="overflow-y: auto;height: 600px;margin-bottom: 30px;">
        	<h3>Listing <?php echo $category[0]['title_'.$lang]; ?></h3>
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
	  }
      var locations = [
        <?php echo $lat_lng;?>]
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

<?php
include("footer.php");
?>