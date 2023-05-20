import 'package:flutter/material.dart';
import 'package:gais/theme.dart';
import 'package:gais/widgets/data_item.dart';

class DataUnitTypePage extends StatelessWidget {
  const DataUnitTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        title: Text(
          'Unit Type',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 30,
          ),
          DataItem(title: 'title'),
          DataItem(title: 'title'),
          DataItem(title: 'title')
        ],
      ),
    );
  }
}
