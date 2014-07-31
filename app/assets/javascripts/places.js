function init_autocomplete() {
  var input = /** @type {HTMLInputElement} */(
    document.getElementById('q'));

  var autocomplete = new google.maps.places.Autocomplete(input);
  google.maps.event.addListener(autocomplete, 'place_changed', function() {

      var place = autocomplete.getPlace();
      var js_lat = place.geometry.location.lat();
      var js_lng = place.geometry.location.lng();
      var js_name = place.name;
      document.getElementById('lat').value = js_lat;
      document.getElementById('lng').value = js_lng;
  });
}