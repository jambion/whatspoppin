$(document).ready(function () {

  var genre_id = { 28: "Action", 12: "Adventure", 16: "Animation", 35: "Comedy", 
  99: "Documentary", 18: "Drama", 10751: "Family", 14: "Fantasy", 36: "History", 
  27: "Horror", 10402: "Music", 9648: "Mystery", 10479: "Romance", 
  878: "Science Fiction", 10770: "TV Movie", 53: "Thriller", 10752: "War", 37: "Western" }

  var $search_list = $("#search-list");
  
  $("#submit").on("click", function () {
    $('.search-table').attr('style','display:block');
    searchMovies();
  });
  
  function searchMovies() {
    $.ajax({
      url: "https://api.themoviedb.org/3/search/movie?query=" + 
      $("#searchInput").val(),
      data: { "api_key": "4aa07b165bfe3ed8596da63f31c9a2bc" },
      dataType: "json",
      success: function (result) {
        $search_list.html("");
        for (var i = 0; i < result["results"].length; i++) {
          var image = "https://image.tmdb.org/t/p/w500/" + result["results"][i]["poster_path"];
          var genre = genre_id[result["results"][i]["genre_ids"][0]];
          var movie_title = result["results"][i]["title"]; 
          var movie_id = result["results"][i]["id"];
          var movie_release = result["results"][i]["release_date"];
          
          $search_list.append("<tr>" 
          + "<td><img src=\"" + image + "\" width=\"250\"" + "\" /></td>" 
          + "<td><strong>" + movie_title + "</strong><a href='/movies/" + movie_id + "'><br />View/ Review</a></td>"
          + "<td><p>" + genre + "</p></td>"
          + "<td><p>" + movie_release + "</p></td>"
          + "</tr>"
          );
        }
        $(".movie-table").tablesorter(); 
      },
      error: function (xhr, status, error) {
        $search_list.append("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText)
      }
    });
  }
  // sorttable.makeSortable(newTableObject);
});