import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/description.dart';

class TopratedMovies extends StatelessWidget {
  const TopratedMovies({super.key, required this.toprated});
  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TopRated Movies",
            style: GoogleFonts.robotoFlex(fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: toprated[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['poster_path'],
                                  description: toprated[index]['overview'],
                                  vote: toprated[index]['vote_average']
                                      .toString(),
                                  launch_on: toprated[index]['release_date'],
                                )));
                  },
                  child: toprated[index]['title'] != null
                      ? Container(
                          padding: EdgeInsets.all(8),
                          width: 150,
                          child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path']),
                                ),
                              ),
                              height: 220,
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 20,
                              child: Text(
                                toprated[index]['title'] != null
                                    ? toprated[index]['title']
                                    : 'Loading',
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ]))
                      : Container(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
