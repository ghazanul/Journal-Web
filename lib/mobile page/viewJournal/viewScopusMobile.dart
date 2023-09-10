// ignore_for_file: unused_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:journal_web/journals/journalItemMobile.dart';
import 'package:journal_web/journals/journalItemWeb.dart';

class viewScopusMobile extends StatelessWidget {
  final List journals;
  const viewScopusMobile({super.key, required this.journals});

  @override
  Widget build(BuildContext context) {
    List journalsTemp = [];
    for (var y in journals) {
      if (y['scopus']) {
        journalsTemp.add(y);
      }
    }
    return Column(
      children: [
        for(int j = 0; j < journalsTemp.length; j += 2)
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          for (int i = j; i < j + 2 && i < journalsTemp.length; i++)
            journalItemMobile(
                description: journalsTemp[i]['description'],
                title: journalsTemp[i]['title'],
                urlJournal: journalsTemp[i]['url'],
                pathImage: journalsTemp[i]['image'])
        ]),
      ],
    );
  }
}
