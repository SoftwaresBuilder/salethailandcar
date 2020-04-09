<?php include("header.php");
// echo "hereqw";exit();
// $product=get_records($tblproducts,"trash!=1");
$id = 0;
$for_marker=0;
if(isset($_GET['slug'])){
  $slug = $_GET['slug'];
}
$category = get_records($tblcategories,"slug_en='".$slug."' and status='1' and trash='0'");
// pr($category);
if(!(count($category)>0)){
  redirect("index");exit;
}
$id=$category[0]['id'];
$products = get_records($tblproducts,"category_id='".$id."' and status>0 and  trash='0' and latitude!='' and longitude!=''");

$lat_lng = '';
$lat = "";
$lng = "";
$p_id = array();
$p_price = array();
if(count($products)>0){
  foreach ($products as $v) {
    $lat_lng .= '{lat: '.$v['latitude'].', lng: '.$v['longitude'].', slug: "'.$v['slug_en'].'", price: '.$v['price'].', title: "'.$v['title_'.$lang].'"},';
    $lat = $v['latitude'];
    $lng = $v['longitude'];
    $p_id[] = $v['id'];
    $p_price[] = $v['price'];
  }
}
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
          <h3><?= translate("Listing");?> <?php echo $category[0]['title_'.$lang]; ?></h3>
          <a href="<?php echo makepage_url("search","?slug=".$slug);?>"> List View</a>
          <div class="row">
              <input type="hidden" name="lat" id="lat" value="<?php echo $lat ?>">
              <input type="hidden" name="lng" id="lng" value="<?php echo $lng ?>">
          <div class="col-6">
            <input name="location" type="text" pattern=".{3,}" onblur="search_on_map()" id="location" class="form-control" placeholder="<?php echo translate("Enter Location");?>" value="" >
          </div>
          <div class="col-6">
            <select class="form-control" id="price_sort" onchange="search_on_map();">
                  <option value=""><?php echo translate("Sort By");?></option>                       
                  <option value="price DESC"><?php echo translate("Price Low to High");?></option>
                  <option value="price ASC"><?php echo translate("Price High to Low");?></option>
            </select>

          </div>
          </div>
          <div id="listing_area"></div>
        </div>
    </div>
  </div>
    <script>

      function initMap() {

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 5,
          center: {lat: <?php echo $lat ?>, lng: <?php echo $lng ?>}
        });

        // Create an array of alphabetical characters used to label the markers.
        ///var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        // Add some markers to the map.
        // Note: The code uses the JavaScript Array.prototype.map() method to
        // create an array of markers based on a given "locations" array.
        // The map() method here has nothing to do with the Google Maps API.
        var pinImage = "images/marker2.png";

        var markers = locations.map(function(location, i) {
          
          var marker = new google.maps.Marker({
            position: location,
            icon: pinImage,
            title: 'Pricee : '+location.title
          });

          var contentString = '<div id="heading">'+location.title+'</div><div>Price: '+location.price+'</div><div><a href="product_detail.php?slug='+location.slug+'">View Detail</a></div>';
          var infowindow = new google.maps.InfoWindow({
            content: contentString
          });
          marker.addListener('click', function() {
            infowindow.open(map, marker);
          });

          return marker;
        });
        //////////
        // google.maps.event.addListener(map, 'click', function(event) {
        //   placeMarker(map, event.latLng);
        // });

        // function placeMarker(map, location) {
        //   var marker = new google.maps.Marker({
        //     position: location,
        //     map: map
        //   });
        //   var infowindow = new google.maps.InfoWindow({
        //     content: 'Latitude: ' + location.lat() +
        //     '<br>Longitude: ' + location.lng()
        //   });
        //   infowindow.open(map,marker);
        // } 
     
    ///////
    map.addListener('click', function(e) {
      search_on_map(e.latLng);
    });
    
    // Add a marker clusterer to manage the markers.
        var markerCluster = new MarkerClusterer(map, markers,
            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
      }

    function search_on_map(latlng=""){
      if(latlng){
        var latlng = latlng.toString();
        var latlng=latlng.replace('(','');
        var latlng=latlng.replace(')','');
      } else {
        var latlng=$('#lat').val()+','+$('#lng').val();
      }
      var location=$('#location').val();
      var sort_by = $('#price_sort').val();
      var cid='<?php echo $id; ?>';
      // alert(cid);
      if (cid>0) 
      {
               $.ajax({
                    type: "GET",
                    url: "ajaxphp.php",
                    dataType :'html',
                    data: {cid:cid,location:location,sort_by:sort_by,latlng:latlng,p:'getAllProduct'},
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
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVmLHD_P8I-G2Ip-2nOG1tA1v5wK-qhH4&callback=initMap&language=<?= $lang;?>">
    </script>
    
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<?php
include("footer.php");
?>