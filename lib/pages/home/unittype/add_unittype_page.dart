import 'package:flutter/material.dart';
import 'package:gais/controllers/controllers.dart';
import 'package:gais/theme.dart';
import 'package:get/get.dart';

class AddUnitTypePage extends StatelessWidget {
  AddUnitTypePage({super.key});
  final unitTypeController = Get.find<UnitTypeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        title: Text(
          'Add Unit Type',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Text("Nama : "),
                Expanded(
                  child: TextField(
                    controller: unitTypeController.nameController,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async =>
                  await unitTypeController.addUnitType().then((res) {
                Get.snackbar(
                    res.value! ? 'Success' : 'Error', res.message ?? '');
                if (!res.value!) return;
                unitTypeController.nameController.clear();
                Navigator.pop(context);
              }),
              child: const Text("SAVE"),
            ),
          ],
        ),
      ),
    );
  }
}
