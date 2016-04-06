
jQuery(document).ready(function($) {
  var mapSelectorClass = drupalSettings.newsplus.googleMapsInit.googleMapCanvas;
  var mapSelector = "." + mapSelectorClass;

  if ($(mapSelector).length>0) {
    var myLatlng = new google.maps.LatLng(drupalSettings.newsplus.googleMapsInit.googleMapLatitude, drupalSettings.newsplus.googleMapsInit.googleMapLongitude);
    var myZoom = drupalSettings.newsplus.googleMapsInit.googleMapZoom;

    function initialize() {

      var mapOptions = {
        zoom: myZoom,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: myLatlng,
        scrollwheel: false
      };

      var mapBlocks = document.getElementsByClassName(mapSelectorClass);

      for (var i = 0 ; i < mapBlocks.length; i++) {
        var map = new google.maps.Map(mapBlocks[i],mapOptions);
        var marker = new google.maps.Marker({
          map:map,
          draggable:true,
          position: myLatlng
        });
        google.maps.event.addDomListener(window, "resize", function() {
          map.setCenter(myLatlng);
        });
      }

    }
    google.maps.event.addDomListener(window, "load", initialize);

  }

});
