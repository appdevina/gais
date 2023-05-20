class UserModel {
  int? id;
  String? unitType;
  String? token;

  UserModel({
    this.id,
    this.unitType,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unitType = json['unit_type'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'unit_type': unitType,
      'access_token': token,
    };
  }
}
