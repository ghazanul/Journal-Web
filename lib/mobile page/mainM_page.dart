// ignore_for_file: unused_import, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journal_web/mobile%20page/viewJournal/viewAllMobile.dart';
import 'package:journal_web/mobile%20page/viewJournal/viewScopusMobile.dart';
import 'package:journal_web/mobile%20page/viewJournal/viewSintaMobile.dart';
import 'package:url_launcher/url_launcher.dart';

class mainM_page extends StatefulWidget {
  const mainM_page({super.key});

  @override
  State<mainM_page> createState() => _mainM_pageState();
}

class _mainM_pageState extends State<mainM_page> {
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

  int sintaLevel = 0;
  int menuIndex = 0;
  List toWeb = [
    "Pusat Jurnal",
    "Pusat Jurnal (OJS 3)",
    "Pusat Jurnal Mahasiswa"
  ];
  List sintaList = ["Sinta 1", "Sinta 2", "Sinta 3", "Sinta 4", "Sinta 5"];
  String? dropdownItem = null;
  @override
  Widget build(BuildContext context) {
    Widget loadWidget = viewAllMobile(journals: journals);

    setState(() {
      if (menuIndex == 0) {
        loadWidget = viewAllMobile(journals: journals);
      } else if (menuIndex == 1) {
        loadWidget = viewScopusMobile(journals: journals);
      } else if (menuIndex == 2) {
        loadWidget = viewSintaMobile(
          journals: journals,
          sintaLevel: sintaLevel,
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 22, 22, 22),
        shadowColor: Colors.black45,
        elevation: 2,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'RUMAH JURNAL',
                  style: GoogleFonts.abel(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.04),
                ),
                Text(
                  'UNIVERSITAS ISLAM NEGERI AR-RANIRY',
                  style: GoogleFonts.abel(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.03),
                )
              ],
            ),
            Image.asset(
              "assets/logoUIN.png",
              width: MediaQuery.of(context).size.width * 0.15,
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 22, 22, 22),
        width: 180,
        child: Padding(
          padding: const EdgeInsets.only(top : 50.0),
          child: Stack(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        menuIndex = 0;
                        dropdownItem = null;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: menuIndex == 0
                          ? Color.fromARGB(255, 56, 56, 56)
                          : Color.fromARGB(0, 168, 168, 168),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal : 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "All",
                              style: GoogleFonts.abel(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                            Image.asset("assets/icon/menu.png"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        menuIndex = 1;
                        dropdownItem = null;
                      });
                    },
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          color: menuIndex == 1
                          ? Color.fromARGB(255, 56, 56, 56)
                          : Color.fromARGB(0, 168, 168, 168),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal : 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Scopus",
                                style: GoogleFonts.abel(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                              Image.asset("assets/icon/scopus.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: menuIndex == 2
                          ? Color.fromARGB(255, 56, 56, 56)
                          : Color.fromARGB(0, 168, 168, 168),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Center(
                        child: DropdownButton(
                          icon: Image.asset("assets/icon/sinta.png"),
                          dropdownColor: Color.fromARGB(255, 56, 56, 56),
                          value: dropdownItem,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.bold),
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Text(
                            "Sinta",
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
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
                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 13.0),
                    child: Container(
                      height: 2,
                      color: Color.fromARGB(255, 56, 56, 56),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal : 10.0, vertical: 25),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.035,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(255, 56, 56, 56),
                      ),
                      child: Center(
                        child: DropdownButton(
                          iconSize: 0,
                          dropdownColor: Color.fromARGB(255, 56, 56, 56),
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.bold),
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Image.asset("assets/browser.png", width: 15, color: Colors.white,),
                              SizedBox(width: 5,),
                                Text(
                                  "Original Web",
                                  style: GoogleFonts.abel(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.03,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          onChanged: (x) {
                            setState(() async {
                              switch (x.toString()) {
                                case "Pusat Jurnal":
                                  await launch("https://jurnal.ar-raniry.ac.id/",
                                      forceWebView: true);
                                  break;
                                case "Pusat Jurnal (OJS 3)":
                                  await launch("https://journal.ar-raniry.ac.id/",
                                      forceWebView: true);
                                  break;
                                case "Pusat Jurnal Mahasiswa":
                                  await launch("https://jim.ar-raniry.ac.id/",
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
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          //background
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.cover)),
          ),

          //maincontent
          SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [loadWidget],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
