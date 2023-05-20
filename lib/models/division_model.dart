part of 'models.dart';

class DivisionModel extends Equatable {
  final int id;
  final String division;
  final AreaModel area;

  const DivisionModel({
    required this.id,
    required this.division,
    required this.area,
  });

  factory DivisionModel.fromJson(Map<String, dynamic> json) => DivisionModel(
        id: json['id'],
        division: json['division'],
        area: AreaModel.fromJson(json['area']),
      );

  @override
  List<Object?> get props => [
        id,
        division,
        area,
      ];
}
