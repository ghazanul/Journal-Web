// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:journal_web/journals/journalItemWeb.dart';

class ViewAllWeb extends StatelessWidget {
  final List journals;
  const ViewAllWeb({super.key, required this.journals});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int j = 0; j < journals.length; j += 9)
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          for (int i = j; i < j + 9 && i < journals.length; i++)
            journalItemWeb(
                description: journals[i]['description'],
                title: journals[i]['title'],
                urlJournal: journals[i]['url'],
                pathImage: journals[i]['image']),
                
        ]),
      ],
    );
  }
}
