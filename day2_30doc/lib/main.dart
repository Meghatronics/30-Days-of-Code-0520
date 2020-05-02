import 'package:day1_30doc/MovieList.dart';
import 'package:flutter/material.dart';
import 'package:day1_30doc/MovieListBody.dart';

void main() => runApp(MovieListing());

class MovieListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   
        title: 'Movie Listing',
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.local_movies), onPressed: (){
                MovieManager test = MovieManager();
                test.getMovies();
              }, ),
              backgroundColor: Color.fromARGB(120, 240, 50, 100),
              title: Text('Top 2020 Movies'),
            ),
            body: MovieListBody(),
          ),
        ));
  }
}

