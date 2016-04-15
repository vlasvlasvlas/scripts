<script   src="https://code.jquery.com/jquery-1.12.3.js"   integrity="sha256-1XMpEtA4eKXNNpXcJ1pmMPs8JV+nwLdEqwiJeCQEkyc="   crossorigin="anonymous"></script>

<script>

$.getJSON("http://geoip.nekudo.com/api/", function(result){

  ip_lat = JSON.stringify(result.location.latitude);
  ip_lng = JSON.stringify(result.location.longitude);
  
  map.setView(new L.LatLng(ip_lat, ip_lng), 12);

  });

</script>
