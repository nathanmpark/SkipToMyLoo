$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  var map = L.mapbox.map('map', 'rsinclairchin.o8p4f1ph');

  // get JSON object
  // on success, parse it and
  // hand it over to MapBox to map
  // $.ajax({
  //   dataType: 'text',
  //   url: 'toilets',
  //   success: function(data) {
  //     var geojson;
  //     geojson = $.parseJSON(data);
  //     return map.featureLayer.setGeoJSON(geojson);
  //     }
  // });


});
