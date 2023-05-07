import 'package:ahadith_app/features/showing_data_feature/showing_data_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/hadith.dart';

class DataPage extends StatelessWidget {
  final Hadith hadith;
  final String data;

  const DataPage({super.key, required this.hadith, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [ShowingDataContent(hadith: data)],
      ),
    );
  }
}
