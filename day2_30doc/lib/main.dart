import 'package:flutter/material.dart';
import 'package:day1_30doc/MovieListBody.dart';
import 'package:day1_30doc/MovieList.dart';
void main() => runApp(MovieListing());

class MovieListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         theme: ThemeData(
             primaryColor: Color(0xff81283F),
             accentColor: Color(0x4f81283f)),
        title: 'Movie Listing',
        home:LoadScreen());
  }
}


class LoadScreen extends StatefulWidget {
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  int screen = 1;
  void fetchMovies() async {
   await MovieManager.loadGenres();
   await MovieManager.loadMovies();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MovieListBody()));
 
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
   }

  @override
  Widget build(BuildContext context) {
         return Scaffold();
  }
}