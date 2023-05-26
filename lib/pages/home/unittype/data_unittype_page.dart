import 'package:flutter/material.dart';
import 'package:gais/controllers/controllers.dart';
import 'package:gais/pages/home/unittype/add_unittype_page.dart';
import 'package:gais/theme.dart';
import 'package:get/get.dart';

class DataUnitTypePage extends StatelessWidget {
  DataUnitTypePage({super.key});
  final controller = Get.put(UnitTypeController());

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddUnitTypePage()),
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<UnitTypeController>(
        id: 'unittype',
        builder: (controller) => !controller.isLoading
            ? controller.unittype.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (_, i) => ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            width: 135,
                            child: Text(
                              controller.unittype[i].unitType,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    itemCount: controller.unittype.length,
                    separatorBuilder: (_, index) => const Divider(
                      height: 10,
                      color: Colors.white,
                    ),
                  )
                : const Center(
                    child: Text("Tidak ada data"),
                  )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
