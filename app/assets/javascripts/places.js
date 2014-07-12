function initialize() {
      var input = /** @type {HTMLInputElement} */(
          document.getElementById('q'));

      var autocomplete = new google.maps.places.Autocomplete(input);
}