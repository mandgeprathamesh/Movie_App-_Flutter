import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/description.dart';

class TVMovies extends StatelessWidget {
  const TVMovies({super.key, required this.tv});
  final List tv;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular TV Shows",
            style: GoogleFonts.robotoFlex(fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: tv[index]['original_name'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['poster_path'],
                                  description: tv[index]['overview'],
                                  vote: tv[index]['vote_average'].toString(),
                                  launch_on: tv[index]['release_date'] == null
                                      ? "Not Known"
                                      : tv[index]['release_date'],
                                )));
                  },
                  child: tv[index]['original_name'] != null
                      ? Container(
                          padding: EdgeInsets.all(12),
                          width: 250,
                          child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tv[index]['backdrop_path']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 140,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text(
                                tv[index]['original_name'] != null
                                    ? tv[index]['original_name']
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
