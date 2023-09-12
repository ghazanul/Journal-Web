// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class journalItemMobile extends StatelessWidget {
  final String description;
  final String title;
  final String urlJournal;
  final String pathImage;
  const journalItemMobile(
      {super.key,
      required this.description,
      required this.title,
      required this.urlJournal,
      required this.pathImage});

  @override
  Widget build(BuildContext context) {
    String url = urlJournal;
    return Padding(
      padding: EdgeInsets.symmetric(vertical : MediaQuery.of(context).size.height * 0.01),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  backgroundColor: Color.fromARGB(209, 0, 0, 0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // color: Color.fromARGB(171, 0, 0, 0)
                        ),
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom : 15.0, right: 15, left : 15),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () async {
                                    await launch(url, forceWebView: true);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height:
                                        MediaQuery.of(context).size.height * 0.045,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 2,
                                            offset: Offset(0, 3),
                                          )
                                        ]),
                                    child: Center(
                                      child: Text(
                                        "View Journal",
                                        style: GoogleFonts.abel(
                                            color: Colors.black,
                                            fontSize:
                                                MediaQuery.of(context).size.width *
                                                    0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 1.0),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height *
                                            0.5,
                                        width:
                                            MediaQuery.of(context).size.width * 1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(pathImage),
                                              fit: BoxFit.scaleDown),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      title,
                                      style: GoogleFonts.abel(
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.05,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 15,),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 1,
                                      height: MediaQuery.of(context).size.height * 0.17,
                                      child: ListView(
                                        children: [
                                          Text(
                                            description,
                                            style: GoogleFonts.abel(
                                                color: Colors.white,
                                                fontSize:
                                                    MediaQuery.of(context).size.width *
                                                        0.03,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              });
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(pathImage), fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }
}
