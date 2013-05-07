function initialize() {
  var myLatlng = new google.maps.LatLng(54.444567,18.55962);
  var mapOptions = {
    center: myLatlng,
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);
  var marker = new google.maps.Marker({
    position: myLatlng,
      map: map,
      title:"TRUG"
  });
}
google.maps.event.addDomListener(window, 'load', initialize);
