import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});
  final String name, description, bannerurl, posterurl, vote, launch_on;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Positioned(
                //     bottom: 10,
                //     child: Text(
                //       '⭐ Average Rating - ' + vote,
                //       style: GoogleFonts.roboto(
                //           fontSize: 19, color: Colors.purpleAccent),
                //     )),
              ])),
          SizedBox(height: 15),
          Text(
            '⭐ Average Rating - ' + vote,
            style: GoogleFonts.roboto(fontSize: 19, color: Colors.white),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                name != null ? name : 'Not Loaded',
                style: GoogleFonts.roboto(fontSize: 24, color: Colors.amber),
              )),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Releasing On - ' + launch_on,
                style: GoogleFonts.roboto(fontSize: 14),
              )),
          Row(
            children: [
              // Container(
              //   height: 200,
              //   width: 100,
              //   child: Image.network(posterurl),
              // ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      description,
                      style: GoogleFonts.roboto(fontSize: 18),
                    )),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
