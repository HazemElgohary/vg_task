import 'package:equatable/equatable.dart';

class GeneDetailsModel extends Equatable {
  final String name;
  final String health;
  final int index;

  const GeneDetailsModel({
    required this.health,
    required this.name,
    required this.index,
  });

  GeneDetailsModel copyWith({
    String? name,
    String? health,
    int? index,
}) {
    return GeneDetailsModel(
      health: health ?? this.health,
      name: name ?? this.name,
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [
        index,
      ];
}
