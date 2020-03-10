<style>
#map {
	min-height:200px;
  width: 100%;
}
</style>

<div id="map"></div>

<script>
	var markers = [];
      function initAutocomplete() {
        <?php
        $latitude = ($latitude)?$latitude:"51.5073509";
        $longitude = ($longitude)?$longitude:"-0.1277583";
        ?>
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
	  center: {lat: <?php echo $latitude; ?>, lng: <?php echo $longitude; ?>}
        });
        
        var myLatlng = new google.maps.LatLng(<?php echo $latitude; ?>,<?php echo $longitude; ?>);
	       addMarker(myLatlng,map);
	
        
        
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
      }
      
      function addMarker(location,map) {
		for (var i = 0; i < markers.length; i++) {
			markers[0].setMap(null);
		}
		markers = [];
		var marker = new google.maps.Marker({
			position: location,
			icon: 'https://bookirea.com/img/map-marker.png',
			map: map
		});
		markers.push(marker);
	}
	
    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVmLHD_P8I-G2Ip-2nOG1tA1v5wK-qhH4&libraries=places&callback=initAutocomplete"
         async defer></script>
    
    <style type="text/css">.gm-svpc { z-index: -1; }</style>
  </body>
</html>
