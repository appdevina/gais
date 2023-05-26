part of 'services.dart';

class UnitTypeService {
  static Future<ApiReturnValue<List<UnitTypeModel>?>> getUnitType() async {
    final response = await ApiService().get(
      '${ApiUrl.baseUrl}/unittype',
      headers: await ApiUrl.headerWithToken(),
    );

    if (response.value == null) {
      return ApiReturnValue(value: null, message: response.message);
    }

    List<UnitTypeModel> value = (response.value['data'] as Iterable)
        .map((e) => UnitTypeModel.fromJson(e))
        .toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<UnitTypeModel?>> addUnitType({
    required String name,
  }) async {
    final response = await ApiService().post('${ApiUrl.baseUrl}/unittype',
        headers: await ApiUrl.headerWithToken(),
        body: {
          'unit_type': name,
        });
    log(response.value.toString());

    if (response.value == null) {
      return ApiReturnValue(value: null, message: response.message);
    }

    return ApiReturnValue(
        value: UnitTypeModel.fromJson(response.value['data']),
        message: response.message);
  }
}
