<style>
#map {
	min-height:200px;
  width: 100%;
}
</style>

<div id="map"></div>
<input type="hidden" name="latitude" id="latitude" value="">
<input type="hidden" name="longitude" id="longitude" value="">

<script>
	var markers = [];
      function initAutocomplete() {
      	<?php
      	$latitude = "51.5073509";
        $latitude = ($_SESSION['sysData']['latitude'])?$_SESSION['sysData']['latitude']:$latitude;
      	$longitude = "-0.1277583";
        $longitude = ($_SESSION['sysData']['longitude'])?$_SESSION['sysData']['longitude']:$longitude;
        ?>
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
	  center: {lat: <?php echo $latitude; ?>, lng: <?php echo $longitude; ?>}
        });
        
        var myLatlng = new google.maps.LatLng(<?php echo $latitude; ?>,<?php echo $longitude; ?>);
	addMarker(myLatlng,map);
	
        // Create the search box and link it to the UI element.
        var input = document.getElementById('location');
        var searchBox = new google.maps.places.SearchBox(input);
        ///map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        map.addListener('click', function(event) {
        	addMarker(event.latLng,map);
        });
        // Adds a marker to the map and push to the array.
	
        
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();
          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            
            
            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: 'https://bookirea.com/img/map-marker.png',
              title: place.name,
              position: place.geometry.location
            }));
            
            update_latlng(place.geometry.location);
            
            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
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
		
		update_latlng(location);
	}
	
	function update_latlng(location) {
		document.getElementById('latitude').value=location.lat();
		document.getElementById('longitude').value=location.lng();
	}

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVmLHD_P8I-G2Ip-2nOG1tA1v5wK-qhH4&libraries=places&callback=initAutocomplete"
         async defer></script>
    
    
  </body>
</html>
