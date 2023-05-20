part of 'models.dart';

class AreaModel extends Equatable {
  final int id;
  final String area;

  const AreaModel({
    required this.id,
    required this.area,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        id: json['id'],
        area: json['area'],
      );

  @override
  List<Object?> get props => [
        id,
        area,
      ];
}
