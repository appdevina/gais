part of 'models.dart';

class RoleModel extends Equatable {
  final int id;
  final String role;

  const RoleModel({
    required this.id,
    required this.role,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json['id'],
        role: json['role'],
      );

  @override
  List<Object?> get props => [
        id,
        role,
      ];
}
