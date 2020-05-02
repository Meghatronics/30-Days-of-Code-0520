import 'package:flutter/material.dart';
import 'package:day1_30doc/MovieList.dart';

List<MovieDisplayCard> databaseMovieList = [];

class MovieListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < MovieManager.catalogSize(); i++) {
      databaseMovieList.add(MovieDisplayCard(i));
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.local_movies),
          onPressed: () {},
        ),
        title: Text('Top 2020 Movies'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: databaseMovieList,
        ),
      ),
    );
  }
}

class MovieDisplayCard extends StatelessWidget {
  MovieDisplayCard(this.movieNumber);
  final int movieNumber;

  @override
  Widget build(BuildContext context) {
    Color backColor = MovieManager.getAvatarColor();
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: backColor,
        ),
        title: Text(
          MovieManager.getTitle(movieNumber),
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
        subtitle: Text(MovieManager.getGenre(movieNumber),
            style: TextStyle(
              fontWeight: FontWeight.w600,
            )),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetails(movieNumber, backColor)));
        },
      ),
    );
  }
}

class MovieDetails extends StatelessWidget {
  MovieDetails(this.movieNumber, this.backColor);
  final int movieNumber;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: MovieManager.getImage(movieNumber),
            ),
          ),
          margin: EdgeInsets.all(0),
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.elliptical(20, 14)),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          MovieManager.getTitle(movieNumber),
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Icon(Icons.local_movies, color: Colors.black54),
                            Text(
                              MovieManager.getGenre(movieNumber),
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(MovieManager.getDescription(movieNumber),
                            style: TextStyle(
                              fontSize: 19,
                            )),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
