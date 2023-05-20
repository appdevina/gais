part of 'models.dart';

class BadanUsahaModel extends Equatable {
  final int id;
  final String badanUsaha;

  const BadanUsahaModel({
    required this.id,
    required this.badanUsaha,
  });

  factory BadanUsahaModel.fromJson(Map<String, dynamic> json) =>
      BadanUsahaModel(
        id: json['id'],
        badanUsaha: json['badan_usaha'],
      );

  @override
  List<Object?> get props => [
        id,
        badanUsaha,
      ];
}
