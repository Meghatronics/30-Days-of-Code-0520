import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String kApiKey = '083b7597c1950574aa4f4ad93abbc459';
const String kImageApiLink = 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/';
const String kGenreApiLink =
    'https://api.themoviedb.org/3/genre/movie/list?language=en-US&api_key=';
const String kMovieApiLink =
    'https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&include_adult=true&year=2020&api_key=';

Map<int, String> genre = {};
List<Movie> movieDatabase = [];

class Movie {
  Movie({@required this.title, this.genre, this.description, this.movieImage});

  String title;
  String genre;
  String description;
  String movieImage;
}

class MovieManager {
  static Future<void> loadGenres() async {
    http.Response genreResponse;
    try {
      genreResponse = await http.get('$kGenreApiLink$kApiKey');
    } catch (e) {
      print(e);
      return;
    }
    if (genreResponse.statusCode != 200)
      //TODO Add what to do when API request fails
      print(genreResponse.statusCode);
    else {
      genre.clear();
      var genreResponseDecoded = jsonDecode(genreResponse.body)['genres'];
      for (int i = 0; i < genreResponseDecoded.length; i++) {
        int id = genreResponseDecoded[i]['id'];
        String name = genreResponseDecoded[i]['name'];

        genre[id] = name;
      }
    }
    
  }

  static Future<void> loadMovies() async {
    http.Response movieResponse;
    try {
      movieResponse = await http.get('$kMovieApiLink$kApiKey');
    } catch (e) {
      print(e);
      return;
    }

    if (movieResponse.statusCode != 200)
      //TODO Add what to do when API request fails
      print(movieResponse.statusCode);
    else {
      movieDatabase.clear();
      var movieResponseDecoded = jsonDecode(movieResponse.body)['results'];

      for (int i = 0; i < movieResponseDecoded.length; i++) {
        String movieTitle = movieResponseDecoded[i]['title'];
        List movieGenre = movieResponseDecoded[i]['genre_ids'];
        String movieDescription = movieResponseDecoded[i]['overview'];
        String movieImage = movieResponseDecoded[i]['backdrop_path'];

        movieDatabase.add(Movie(
          title: movieTitle,
          genre: genre[movieGenre[0]],
          description: movieDescription,
          movieImage: movieImage,
        ));
      }
    }
    print(movieDatabase.length);
  }

  static String getTitle(int index) => movieDatabase[index].title;

  static String getGenre(int index) =>
      movieDatabase[index].genre ?? 'genre information unavailable';

  static String getDescription(int index) =>
      movieDatabase[index].description ?? 'No description available for movie';

  static ImageProvider getImage(int index) {
    String storedImage = movieDatabase[index].movieImage;
     ImageProvider img;
    try{
    img = NetworkImage(storedImage == null ? null : '$kImageApiLink$storedImage');

    }catch(e){
      img = null;
    }
    return img;
  }

  static Color getAvatarColor() => Color.fromARGB(Random().nextInt(100),
      Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

  static int catalogSize() => movieDatabase.length;
}
