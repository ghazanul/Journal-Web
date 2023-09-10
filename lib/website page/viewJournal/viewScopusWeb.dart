// ignore_for_file: unused_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:journal_web/journals/journalItemWeb.dart';

class viewScopusWeb extends StatelessWidget {
  final List journals;
  const viewScopusWeb({super.key, required this.journals});

  @override
  Widget build(BuildContext context) {
    int x = 0;
    for (var y in journals) {
      if (y['scopus']){
        x++;
      }
    }
    return Column(
      children: [
        for(int j = 0; j < x; j += 9)
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          for (var temp in journals)
          if (temp['scopus'])
            journalItemWeb(
                description: temp['description'],
                title: temp['title'],
                urlJournal: temp['url'],
                pathImage: temp['image'])
        ]),
      ],
    );
  }
}
