part of 'models.dart';

class UserModel extends Equatable {
  final int id;
  final String fullname;
  final String username;
  final String? profilePhotoUrl;
  final DivisionModel division;
  final BadanUsahaModel badanUsaha;
  final RoleModel role;

  const UserModel({
    required this.id,
    required this.fullname,
    required this.username,
    this.profilePhotoUrl,
    required this.division,
    required this.badanUsaha,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        fullname: json['fullname'],
        username: json['username'],
        profilePhotoUrl: json['profile_picture'] ?? json['profile_picture'],
        division: DivisionModel.fromJson(json['division']),
        badanUsaha: BadanUsahaModel.fromJson(json['badan_usaha']),
        role: RoleModel.fromJson(json['role']),
      );

  @override
  List<Object?> get props => [
        // Ini inisialisasi field2 yg memang sama, tapi value boleh beda
        id,
        fullname,
        username,
        profilePhotoUrl,
        division,
        badanUsaha,
        role,
      ];
}
