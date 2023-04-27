import 'package:flutter/material.dart';
import 'package:gais/theme.dart';

class DataItem extends StatelessWidget {
  final String title;

  const DataItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          bottom: 18,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryColor,
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        ));
  }
}
