var API_BASE_URL = 'https://api.spotify.com';
var MAIN_KEY = 'spotify';

$('.clear-button').on('click',clearMemory);

$('.searchform').on('submit',function(event){
	event.preventDefault();

	var data = $('.form-search-field').val();
	var searchUrl = API_BASE_URL + '/v1/search?type=track&query='
	+ data;

	$.ajax({
        type: "GET",
        url: searchUrl,
        data: '',
        success: manageSearchResults,
        error: handleError,
        dataType: "json"
    });   
});

function manageSearchResults (response) {
    var result = response.tracks.items[0];
    console.log(result);
    storeSearchResults(result);
    loadSearchResult(result);
    // showSearchResults
}

function storeSearchResults (value) {
    localStorage.setItem(MAIN_KEY, JSON.stringify(getCurrentStored().concat(value)));
    console.log("Value Stored!!")
    }

function getCurrentStored () {
    console.log('Reading position...')
    return localStorage.getItem(MAIN_KEY)
      ? JSON.parse(localStorage.getItem(MAIN_KEY))
      : []
  }

function loadSearchResult(result){
    console.log("loading new info!");
    $('metadata p:first').html(result.name);
    $('metadata p:last').html(result.artists[0].name);
    $('cover').html("<img src='"+result.album.images[0].url+"'>");
}

function clearMemory(){
    localStorage.removeItem(MAIN_KEY);
    console.log("Memory Cleared");
}

function handleError(){
    console.log(error);
}