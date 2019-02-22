// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

const bangkokLocation = {lat: 13.736717, lng: 100.523186}

function searchShop(map, lat, lng) {
  axios.get("map/search", {params: {latitude: lat, longitude: lng}}).then(resolve => {
  	let shops = resolve.data.data
  	shops.map(shop => {
  		let marker = new google.maps.Marker({
  			position: {lat: shop.latitude, lng: shop.longitude},
  			map: map,
  			icon: {url: shop.icon}
  		});

  		let infowindow = new google.maps.InfoWindow({
         content: shop.name
      });

			marker.addListener('click', function() {
				infowindow.open(map, marker);
			});  		
  	})
  })
}

function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: bangkokLocation.lat, lng: bangkokLocation.lng},
    zoom: 14
  });

	map.addListener('dragend', function() {
		let lat = this.center.lat();
		let lng = this.center.lng();

		searchShop(map, lat, lng)
  });

	searchShop(map, bangkokLocation.lat, bangkokLocation.lng)
}