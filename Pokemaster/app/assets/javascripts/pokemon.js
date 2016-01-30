// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
PokemonApp.Pokemon = function (pokemonUri) {
  this.id = PokemonApp.Pokemon.idFromUri(pokemonUri);
};

PokemonApp.Pokemon.prototype.render = function () {
  console.log("Rendering pokemon: #" + this.id);
};

PokemonApp.Pokemon.idFromUri = function (pokemonUri) {
  var uriSegments = pokemonUri.split("/");
  var secondLast = uriSegments.length - 2;
  return uriSegments[secondLast];
};

$(document).on("ready", function () {

  $(".js-show-pokemon").on("click", function (event) {
    var $button = $(event.currentTarget);
    var pokemonUri = $button.data("pokemon-uri");

    var pokemon = new PokemonApp.Pokemon(pokemonUri);
    pokemon.render();
  });

});

PokemonApp.Pokemon.prototype.render = function () {
  console.log("Rendering pokemon: #" + this.id);

  var self = this;

  $.ajax({
    url: "/api/pokemon/" + this.id,
    success: function (response) {
   	  self.info = response;
      
      $("#pkmn-name").text(self.info.name);
      $("#pkmn-number").text(self.info.pkdx_id);
      $("#pkmn-height").text(self.info.height);
      $("#pkmn-weight").text(self.info.weight);

      $("#pkmn-hp").text(self.info.hp);
      $("#pkmn-attack").text(self.info.attack);
      $("#pkmn-defense").text(self.info.defense);
      $("#pkmn-spa").text(self.info.sp_atk);
      $("#pkmn-spd").text(self.info.sp_def);
      $("#pkmn-speed").text(self.info.speed);
      $("#pkmn-types").text(self.info.types.map(function(value){
      	return value.name;
      }).join(" , "));

      $("#pkmn-description").text(function(){
      		var arr = self.info.descriptions;
      		var max = arr[0].name;
      		var maxIndex = 0;
      		var description;

      		for (var i=1;i<arr.length;i++){
      			if (arr[i].name>max){
      				maxIndex=i;
      				max=arr[i].name;
      			}
      		}

      		var description_uri=max.resource_uri
      		console.log(description_uri)
      	$.ajax({
    		url: description_uri,
    		success: function (response) {
    			description = response.description
    		}
      	});
      	console.log(description);
      	return description
      })

      $("#pokemon-modal").modal("show");
    }
  });
};

PokemonApp.PokemonEvolutions = function (id, info) {
  this.id = id;
  this.info = info;
};

PokemonApp.PokemonEvolutions.prototype.render = function () {
  console.log("Rendering evolutions for: #" + this.id);

  // You will need some AJAX calls!
};















