// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:journal_web/mobile%20page/mainM_page.dart';
import 'package:journal_web/website%20page/mainW_page.dart';

class checkDevice extends StatefulWidget {
  const checkDevice({super.key});

  @override
  State<checkDevice> createState() => _checkDeviceState();
}

class _checkDeviceState extends State<checkDevice> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    bool portrait = false;
    setState(() {
      if (widthScreen <= 1322) {
        portrait = true;
      }else {
        portrait = false;
      }
    });
    return Scaffold(
      body: portrait?mainM_page():mainW_page(),
    );
  }
}
