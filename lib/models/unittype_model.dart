part of 'models.dart';

class UnitTypeModel extends Equatable {
  final int id;
  final String unitType;

  const UnitTypeModel({
    required this.id,
    required this.unitType,
  });

  factory UnitTypeModel.fromJson(Map<String, dynamic> json) => UnitTypeModel(
        id: json['id'],
        unitType: json['unit_type'],
      );

  UnitTypeModel copyWith({String? unitType}) =>
      UnitTypeModel(id: id, unitType: unitType ?? this.unitType);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'unit_type': unitType,
    };
  }

  @override
  List<Object?> get props => [
        id,
        unitType,
      ];
}
