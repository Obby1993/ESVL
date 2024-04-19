import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }


  addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // const navbarLogo = document.getElementById('navbar-logo');
      // const markerImageUrl = navbarLogo ? navbarLogo.src : null;

      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      console.log();
      // const customMarker = this.createCustomMarker();
      // const customMarker = document.createElement("div")
      // customMarker.className = "marker"
      // customMarker.style.backgroundImage = `url('${markerImageUrl}')`
      // customMarker.style.backgroundSize = "contain"
      // customMarker.style.width = "35px"
      // customMarker.style.height = "35px"
      // customMarker
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }
  createCustomMarker() {
    const customMarker = document.createElement('div');
    customMarker.className = 'custom-marker';
    customMarker.style.backgroundImage = 'url(/assets/logo_esvl_transparent.png)';
    customMarker.style.backgroundSize = 'cover';
    customMarker.style.width = '50px';
    customMarker.style.height = '50px';

    return customMarker;
  }
  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.addMarkersToMap()
    this.fitMapToMarkers()
  }
}
