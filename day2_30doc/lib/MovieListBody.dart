import 'package:flutter/material.dart';
import 'package:day1_30doc/MovieList.dart';

List<MovieDisplayCard> databaseMovieList=[];

class MovieListBody extends StatelessWidget {
  void fetchMovies() {
    MovieManager movie = MovieManager();
    for (int i = 0; i < movie.catalogSize(); i++) {
      databaseMovieList.add(MovieDisplayCard(i));
    }
  }

  
  @override
  Widget build(BuildContext context) {

  fetchMovies();
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: databaseMovieList,
      ),
    );
  }
}

class MovieDisplayCard extends StatelessWidget {

  MovieDisplayCard(this.movieNumber);
  final int movieNumber;
 
  @override
  Widget build(BuildContext context) {
    MovieManager movie = MovieManager();
    Color backColor = movie.getAvatarColor();
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: backColor,
      ),
      title: Text(movie.getTitle(movieNumber)),
      subtitle: Text(movie.getCategory(movieNumber)),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(movieNumber, backColor)));
      },
    );
  }
}

class MovieDetails extends StatelessWidget {
  MovieDetails(this.movieNumber, this.backColor);
  final int movieNumber;
  final Color backColor;
 final MovieManager movie = MovieManager();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.all(Radius.elliptical(20, 14)),
            ),
            margin: EdgeInsets.all(30),
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Text(
                      movie.getTitle(movieNumber),
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Icon(Icons.local_movies, color: Colors.black54),
                      Text(
                        movie.getCategory(movieNumber),
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),

                  Expanded(
                      flex: 2,
                      child: Text(movie.getDescription(movieNumber),
                          style: TextStyle(
                            fontSize: 19,
                          ))),
                ]),
          ),
        ),
      ),
    );
  }
}
