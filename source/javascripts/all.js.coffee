#= require jquery
#= require bespoke.js
#= require bespoke-keys
#= require bespoke-hash
#= require bespoke-touch
#= require bespoke-theme-voltaire

deck = bespoke.from("#presentation", [
  bespoke.themes.voltaire(),
  bespoke.plugins.keys(),
  bespoke.plugins.hash(),
  bespoke.plugins.touch()
])

$('a.slide-left').on 'click', (e)->
  e.preventDefault()
  deck.prev()

$('a.slide-right').on 'click', (e)->
  e.preventDefault()
  deck.next()

map_style = [{
  "stylers": [
    { "saturation": -100 },
    { "lightness": 30 }
  ]
}]

map_options =
  center:
    lat: -37.373657
    lng: 175.080957
  zoom: 10
  styles: map_style
  disableDefaultUI: true

map = new google.maps.Map(document.getElementById("map"), map_options)

deck.on 'activate', (e)->
  slide = $(e.slide)
  if slide.data("map-lat")? && slide.data("map-lng")?
    map.panTo
      lat: slide.data("map-lat")
      lng: slide.data("map-lng")
