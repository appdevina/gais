class UserModel {
  int? id;
  String? unit_type;
  String? token;

  UserModel({
    this.id,
    this.unit_type,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unit_type = json['unit_type'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'unit_type': unit_type,
      'access_token': token,
    };
  }
}
