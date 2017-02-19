# window.ready = ->
#   $('#map').empty();
#   $('#script-maps').remove();
#   script = document.createElement('script');
#   script.id = '#script-maps';
#   script.type = 'text/javascript';
#   script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyBVlSp5SjlgUhWmaTVgRpsG1MzIS3wDhdg&callback=initMap'
#   document.body.appendChild(script);

$ ->
  window.initMap = ->
    markersArray = []
    lat_field = $('#place_latitude')
    lng_field = $('#place_longitude')
    google.maps.event.addDomListener(window, 'turbolinks:load', initMap);
    if $('#map').size() > 0
      console.log('map is big');
      window.map = new google.maps.Map document.getElementById('map'), {
        center: {lat: -34.397, lng: 150.644}
        zoom: 8
      }
      window.map.addListener 'click', (e) ->
        console.log('hahah');
        lat_field.val e.latLng.lat()
        lng_field.val e.latLng.lng()

        markersArray.pop().setMap(null) while(markersArray.length)
        marker = new google.maps.Marker
          position: e.latLng
          map: window.map
        window.map.panTo e.latLng
        markersArray.push marker
