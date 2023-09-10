// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:journal_web/checkDevice.dart';
import 'package:journal_web/mobile%20page/mainM_page.dart';
import 'package:journal_web/website%20page/mainW_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        useMaterial3: true,
      ),
      home: checkDevice(),
    );
  }
}

