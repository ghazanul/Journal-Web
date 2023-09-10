// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:journal_web/journals/journalItemMobile.dart';

class viewAllMobile extends StatelessWidget {
  final List journals;
  const viewAllMobile({super.key, required this.journals});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int j = 0; j < journals.length; j+=2)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = j; i < j + 2 && i < journals.length; i++)
                journalItemMobile(
                    description: journals[i]['description'],
                    title: journals[i]['title'],
                    urlJournal: journals[i]['url'],
                    pathImage: journals[i]['image']),
            ],
          )
      ],
    );
  }
}
