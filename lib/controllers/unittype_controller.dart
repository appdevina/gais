part of 'controllers.dart';

class UnitTypeController extends GetxController {
  List<UnitTypeModel> unittype = [];
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();

  Future<void> getUnitType() async {
    isLoading = true;
    update(['unittype']);
    final response = await UnitTypeService.getUnitType();

    if (response.value == null) {
      Get.snackbar('Error', response.message ?? 'Terjadi kesalahan');
      return;
    }

    unittype = response.value!;
    isLoading = false;
    update(['unittype']);
  }

  Future<ApiReturnValue<bool>> addUnitType() async {
    final response =
        await UnitTypeService.addUnitType(name: nameController.text);

    if (response.value == null) {
      return ApiReturnValue(value: false, message: response.message);
    }

    unittype.add(response.value!);
    final item = unittype.firstWhere((element) => element.id == 1);
    unittype.sort(
      (a, b) => a.unitType.toLowerCase().compareTo(b.unitType.toLowerCase()),
    );
    update(['unittype']);

    return ApiReturnValue(value: true, message: response.message);
  }

  @override
  void onInit() {
    super.onInit();

    getUnitType();
  }
}
