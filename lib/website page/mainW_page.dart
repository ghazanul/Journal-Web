// ignore_for_file: unused_import, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_local_variable, deprecated_member_use, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journal_web/journals/journalItemWeb.dart';
import 'package:journal_web/mobile%20page/viewJournal/viewAllMobile.dart';
import 'package:journal_web/website%20page/viewJournal/viewAllWeb.dart';
import 'package:journal_web/website%20page/viewJournal/viewScopusWeb.dart';
import 'package:journal_web/website%20page/viewJournal/viewSinta1Web.dart';
import 'package:url_launcher/url_launcher.dart';

class mainW_page extends StatefulWidget {
  const mainW_page({super.key});

  @override
  State<mainW_page> createState() => _mainW_pageState();
}

class _mainW_pageState extends State<mainW_page> {
  List<dynamic> journals = []; // Store the loaded JSON data here

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String jsonString =
        await rootBundle.loadString('assets/database/dataJournals.json');

    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      journals = jsonData;
    });
  }

  String? dropdownItem = null;
  List sintaList = ["Sinta 1", "Sinta 2", "Sinta 3", "Sinta 4", "Sinta 5"];
  List toWeb = [
    "Pusat Jurnal",
    "Pusat Jurnal (OJS 3)",
    "Pusat Jurnal Mahasiswa"
  ];
  int sintaLevel = 0;
  int menuIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget loadWidget = ViewAllWeb(journals: journals);

    setState(() {
      if (menuIndex == 0) {
        loadWidget = ViewAllWeb(journals: journals);
      } else if (menuIndex == 1) {
        loadWidget = viewScopusWeb(journals: journals);
      } else if (menuIndex == 2) {
        loadWidget = viewSintaWeb(
          journals: journals,
          sintaLevel: sintaLevel,
        );
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          //background
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.cover)),
            ),
          ),

          //appbar
          Align(
            alignment: Alignment.topCenter,
            child: //title (bagian atas)
                Padding(
              padding: const EdgeInsets.only(left: 55.0, right: 120, top: 50),
              child: ListView(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/logoUIN.png",
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Rumah Journal",
                                    style: GoogleFonts.abel(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.018,
                                    )),
                                Text("UNIVERSITAS ISLAM NEGERI AR-RANIRY",
                                    style: GoogleFonts.abel(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.01,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            //Semua
                            InkWell(
                              onTap: () {
                                setState(() {
                                  menuIndex = 0;
                                  dropdownItem = null;
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 120,
                                    child: Center(
                                      child: Text("Semua",
                                          style: GoogleFonts.abel(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.009,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 120,
                                    height: 3,
                                    color: menuIndex == 0
                                        ? const Color.fromARGB(
                                            131, 158, 158, 158)
                                        : Color.fromARGB(0, 158, 158, 158),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            //Scopus
                            InkWell(
                              onTap: () {
                                setState(() {
                                  menuIndex = 1;
                                  dropdownItem = null;
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 120,
                                    child: Center(
                                      child: Text("Scopus",
                                          style: GoogleFonts.abel(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.009,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 120,
                                    height: 3,
                                    color: menuIndex == 1
                                        ? const Color.fromARGB(
                                            131, 158, 158, 158)
                                        : Color.fromARGB(0, 158, 158, 158),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            //Sinta
                            Column(
                              children: [
                                Container(
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Center(
                                      child: DropdownButton(
                                        iconEnabledColor: Colors.white,
                                        dropdownColor: Colors.black54,
                                        style: GoogleFonts.abel(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.009,
                                            fontWeight: FontWeight.bold),
                                        underline: SizedBox(),
                                        isExpanded: true,
                                        hint: Text(
                                          "Sinta",
                                          style: GoogleFonts.abel(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.009,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onChanged: (x) {
                                          setState(() {
                                            dropdownItem = x.toString();
                                            menuIndex = 2;
                                            //set data
                                            switch (dropdownItem) {
                                              case "Sinta 1":
                                                sintaLevel = 1;
                                                break;
                                              case "Sinta 2":
                                                sintaLevel = 2;
                                                break;
                                              case "Sinta 3":
                                                sintaLevel = 3;
                                                break;
                                              case "Sinta 4":
                                                sintaLevel = 4;
                                                break;
                                              case "Sinta 5":
                                                sintaLevel = 5;
                                                break;
                                            }
                                          });
                                        },
                                        items: sintaList.map((e) {
                                          return DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 120,
                                  height: 3,
                                  color: menuIndex == 2
                                      ? const Color.fromARGB(131, 158, 158, 158)
                                      : Color.fromARGB(0, 158, 158, 158),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color.fromARGB(47, 168, 168, 168),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: DropdownButton(
                                    iconSize: 0,
                                    dropdownColor: Colors.black54,
                                    style: GoogleFonts.abel(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.007,
                                        fontWeight: FontWeight.bold),
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    hint: Center(
                                      child: Row(
                                        children: [
                                          SizedBox(width: 13,),
                                          Image.asset(
                                            "assets/browser.png",
                                            width: 40,
                                          ),
                                          Text(
                                            "Original Web",
                                            style: GoogleFonts.abel(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.009,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onChanged: (x) {
                                      setState(() async {
                                        switch (x.toString()) {
                                          case "Pusat Jurnal":
                                            await launch(
                                                "https://jurnal.ar-raniry.ac.id/",
                                                forceWebView: true);
                                            break;
                                          case "Pusat Jurnal (OJS 3)":
                                            await launch(
                                                "https://journal.ar-raniry.ac.id/",
                                                forceWebView: true);
                                            break;
                                          case "Pusat Jurnal Mahasiswa":
                                            await launch(
                                                "https://jim.ar-raniry.ac.id/",
                                                forceWebView: true);
                                            break;
                                        }
                                      });
                                    },
                                    items: toWeb.map((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ],
              ),
            ),
          ),

          //maincontent
          Padding(
            padding: const EdgeInsets.only(
                left: 40.0, right: 40, bottom: 50, top: 175),
            child: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        // FutureBuilder(
                        //   future: loadJsonData(),
                        //   builder: ((context, snapshot){
                        //     if (!snapshot.hasData){
                        //       return loadWidget;
                        //     }else {
                        //       return Center(
                        //         child: CircularProgressIndicator(),
                        //       );
                        //     }
                        //   }),
                        // )

                        loadWidget
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
