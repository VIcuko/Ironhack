var API_BASE_URL = 'https://api.spotify.com';
var MAIN_KEY = 'spotify';

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

function handleError(){
    console.log(error);
}