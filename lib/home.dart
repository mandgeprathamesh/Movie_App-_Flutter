import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadmovies();
  }

  List topratedmovies = [];
  List tv = [];
  List trendingmovies = [];
  final String apikey = '76be5ccd519001b6d4a1e3413d202872';
  final String readaccestoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NmJlNWNjZDUxOTAwMWI2ZDRhMWUzNDEzZDIwMjg3MiIsInN1YiI6IjY1MDIwNjYzNTU0NWNhMDEzOGQyMTgxMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oaHWkStGzBMNBDXBJBkj3ofsvNHYOQy7DbAtseiFUgw';
  loadmovies() async {
    TMDB tmdbwithcustomlogs = TMDB(ApiKeys(apikey, readaccestoken),
        logConfig: ConfigLogger(
          showErrorLogs: true,
          showLogs: true,
        ));
    Map trendingresult = await tmdbwithcustomlogs.v3.trending.getTrending();
    Map topratedresult = await tmdbwithcustomlogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithcustomlogs.v3.tv.getPopular();
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(
          'MovieMaven',
          style: GoogleFonts.breeSerif(fontSize: 24, color: Colors.amberAccent),
        ),
      ),
      body: ListView(
        children: [
          TVMovies(tv: tv),
          TredingMovies(trending: trendingmovies),
          TopratedMovies(
            toprated: topratedmovies,
          ),
        ],
      ),
    );
  }
}
