import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/description.dart';

class TredingMovies extends StatelessWidget {
  const TredingMovies({super.key, required this.trending});
  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending Movies",
            style: GoogleFonts.robotoFlex(fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 290,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: trending[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                  description: trending[index]['overview'],
                                  vote: trending[index]['vote_average']
                                      .toString(),
                                  launch_on: trending[index]['release_date'],
                                )));
                  },
                  child: trending[index]['title'] != null
                      ? Container(
                          width: 145,
                          child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                trending[index]['title'] != null
                                    ? trending[index]['title']
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
