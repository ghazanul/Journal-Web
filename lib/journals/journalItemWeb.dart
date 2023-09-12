// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class journalItemWeb extends StatelessWidget {
  final String description;
  final String title;
  final String urlJournal;
  final String pathImage;
  const journalItemWeb(
      {super.key,
      required this.description,
      required this.title,
      required this.urlJournal,
      required this.pathImage});

  @override
  Widget build(BuildContext context) {
    String url = urlJournal;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.0023),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  backgroundColor: Colors.black87,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Stack(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.45,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(pathImage),
                                              fit: BoxFit.scaleDown),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.23,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 15.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                title,
                                                style: GoogleFonts.abel(
                                                    color: Colors.white,
                                                    fontSize: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.02,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                              ),
                                              Container(
                                                height: MediaQuery.of(context).size.height * 0.3,
                                                width: MediaQuery.of(context).size.width * 1,
                                                child: ListView(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            description,
                                                            style: GoogleFonts.abel(
                                                                color: Colors.white,
                                                                fontSize:
                                                                    MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.01,
                                                                fontWeight:
                                                                    FontWeight.bold),
                                                            textAlign: TextAlign.justify,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal : 160),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: InkWell(
                                                    onTap: () async {
                                                      await launch(url,
                                                          forceWebView: true);
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.1,
                                                      height: MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.045,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(25),
                                                          color: Color.fromARGB(47, 168, 168, 168),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.black26,
                                                              blurRadius: 2,
                                                              offset: Offset(0, 3),
                                                            )
                                                          ]),
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Image.asset(
                                                              "assets/browser.png",
                                                              width: 50,
                                                            ),
                                                            SizedBox(width: 5,),
                                                            Text(
                                                              "View Journal",
                                                              style: GoogleFonts.abel(
                                                                  color: Colors.white,
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.009,
                                                                  fontWeight:
                                                                      FontWeight.bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              });
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(pathImage), fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }
}
