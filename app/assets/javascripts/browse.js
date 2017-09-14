$(document).ready(function () {
  var $browse_list = $("#browse-list");
  
  var genre_id = { 28: "Action", 12: "Adventure", 16: "Animation", 35: "Comedy", 
  99: "Documentary", 18: "Drama", 10751: "Family", 14: "Fantasy", 36: "History", 
  27: "Horror", 10402: "Music", 9648: "Mystery", 10479: "Romance", 
  878: "Science Fiction", 10770: "TV Movie", 53: "Thriller", 10752: "War", 37: "Western" }
  
  browseMovies();

  function browseMovies() {
    $.ajax({
      type: "GET",
      url: "https://api.themoviedb.org/3/movie/popular?api_key=4aa07b165bfe3ed8596da63f31c9a2bc&language=en-US&page=1",
      dataType: "json",
      success: function (result) {
        for (var i = 0; i < result["results"].length; i++) {
          var image = "https://image.tmdb.org/t/p/w500/" + result["results"][i]["poster_path"];
          var genre = genre_id[result["results"][i]["genre_ids"][0]];
          var movie_title = result["results"][i]["title"]; 
          var movie_id = result["results"][i]["id"];
          var movie_release = result["results"][i]["release_date"];
          $browse_list.append("<tr>" 
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
        $browse_list.html("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText)
      }
    });
    
  }
  

});
