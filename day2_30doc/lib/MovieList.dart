import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String kApiKey = '083b7597c1950574aa4f4ad93abbc459';

class Movie {
  Movie({@required this.title, this.category, this.description});

  String title;
  String category;
  String description;
}

class MovieManager {
  void getMovies() async {
    var response = await http.get(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=$kApiKey&language=en-US');
    if (response.statusCode !=200) print(response.statusCode);
    else   print(response.body);
  }

  final List<Movie> _movieDatabase = [
    Movie(
        title: 'Bloodshot',
        category: 'Action',
        description:
            "After he and his wife are murdered, marine Ray Garrison is resurrected by a team of scientists. Enhanced with nanotechnology, he becomes a superhuman, biotech killing machine - Bloodshot. As Ray first trains with fellow super-soldiers, he cannot recall anything from his former life. But when his memories flood back and he remembers the man that killed both him and his wife, he breaks out of the facility to get revenge, only to discover that there's more to the conspiracy than he thought."),
    Movie(
      title: 'No Time to Die',
      category: 'Thriller/Adventure',
      description:
          "Recruited to rescue a kidnapped scientist, globe-trotting spy James Bond finds himself hot on the trail of a mysterious villain, who's armed with a dangerous new technology",
    ),
    Movie(
        title: 'Harley Quinn: Birds of Prey',
        category: 'Action',
        description:
            "It's open season on Harley Quinn when her explosive breakup with the Joker puts a big fat target on her back. Unprotected and on the run, Quinn faces the wrath of narcissistic crime boss Black Mask, his right-hand man, Victor Zsasz, and every other thug in the city. But things soon even out for Harley when she becomes unexpected allies with three deadly women -- Huntress, Black Canary and Renee Montoya."),
    Movie(
        title: 'Wonder Woman 1984',
        category: 'Adventure/Fantasy',
        description:
            "Wonder Woman squares off against the Cheetah, a villainess who possesses superhuman strength and agility."),
    Movie(
        title: 'Onward',
        description:
            "Teenage elf brothers Ian and Barley embark on a magical quest to spend one more day with their late father. Like any good adventure, their journey is filled with cryptic maps, impossible obstacles and unimaginable discoveries. But when dear Mom finds out her sons are missing, she teams up with the legendary manticore to bring her beloved boys back home."),
    Movie(
        title: 'Bad Boys for Life',
        category: 'Comedy/Action',
        description:
            "The wife and son of a Mexican drug lord embark on a vengeful quest to kill all those involved in his trial and imprisonment -- including Miami Detective Mike Lowrey. When Mike gets wounded, he teams up with partner Marcus Burnett and AMMO -- a special tactical squad -- to bring the culprits to justice. But the old-school, wisecracking cops must soon learn to get along with their new elite counterparts if they are to take down the vicious cartel that threatens their lives."),
    Movie(
        title: 'The Way Back',
        category: 'Sport/Drama',
        description:
            "Jack Cunningham was a high school basketball superstar who suddenly walked away from the game for unknown reasons. Years later, he's now stuck in a meaningless job and struggling with alcoholism -- the very thing that ruined his marriage and his hope for a better life. But Jack soon gets a shot at redemption when he becomes the basketball coach for his alma mater, a program that has fallen on hard times since his teenage glory days."),
    Movie(
      title: 'Never Rarely Sometimes',
      category: 'Drama',
      description:
          "Faced with an unintended pregnancy and a lack of local support, Autumn and her cousin, Skylar, travel across state lines to New York City on a fraught journey of friendship, bravery and compassion.",
    ),
    Movie(
        title: 'The Invisible Man',
        category: 'Horror/Thriller',
        description:
            "After staging his own suicide, a crazed scientist uses his power to become invisible to stalk and terrorize his ex-girlfriend. When the police refuse to believe her story, she decides to take matters into her own hands and fight back."),
    Movie(title: 'Mulan', category: 'Action/Adventure'),
    Movie(
        title: 'Black Widow',
        category: 'Adventure/Action',
        description:
            "At birth the Black Widow (aka Natasha Romanova) is given to the KGB, which grooms her to become its ultimate operative. When the U.S.S.R. breaks up, the government tries to kill her as the action moves to present-day New York, where she is a freelance operative"),
    Movie(
        title: 'Ghostbusters: Afterlife',
        category: 'Comedy/Fantasy',
        description:
            "When a single mother and her two children move to a new town, they soon discover that they have a connection to the original Ghostbusters and their grandfather's secret legacy."),
    Movie(title: 'Godzilla vs Kong'),
    Movie(
        title: 'Top Gun: Maverick',
        category: 'Action/Adventure',
        description:
            "Pete 'Maverick' Mitchell keeps pushing the envelope after years of service as one of the Navy's top aviators. He must soon confront the past while training a new squad of graduates for a dangerous mission that demands the ultimate sacrifice."),
    Movie(
        title: 'A Quiet  Place Part 2',
        category: 'Horror/Thriller',
        description:
            "The Abbott family must now face the terrors of the outside world as they fight for survival in silence. Forced to venture into the unknown, they realize that the creatures that hunt by sound are not the only threats that lurk beyond the sand path."),
    Movie(
        title: 'Dolittle',
        category: 'Adventure/Family',
        description:
            "Dr. John Dolittle lives in solitude behind the high walls of his lush manor in 19th-century England. His only companionship comes from an array of exotic animals that he speaks to on a daily basis. But when young Queen Victoria becomes gravely ill, the eccentric doctor and his furry friends embark on an epic adventure to a mythical island to find the cure."),
    Movie(
        title: 'Extraction',
        category: 'Action',
        description:
            "A black-market mercenary who has nothing to lose is hired to rescue the kidnapped son of an imprisoned international crime lord. But in the murky underworld of weapons dealers and drug traffickers, an already deadly mission approaches the impossible."),
  ];

  String getTitle(int index) => _movieDatabase[index].title;

  String getCategory(int index) =>
      _movieDatabase[index].category ?? 'Category information unavailable';

  String getDescription(int index) =>
      _movieDatabase[index].description ?? 'No description available for movie';

  Color getAvatarColor() => Color.fromARGB(Random().nextInt(100),
      Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

  int catalogSize() => _movieDatabase.length;
}
