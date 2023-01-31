class UserModel {
  int? id;
  String? fullname;
  String? username;
  String? profilePhotoUrl;
  String? token;

  UserModel({
    this.id,
    this.fullname,
    this.username,
    this.profilePhotoUrl,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    username = json['username'];
    profilePhotoUrl = json['profile_picture'] ?? json['profile_picture'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'username': username,
      'profile_picture': profilePhotoUrl,
      'access_token': token,
    };
  }
}
