import 'package:equatable/equatable.dart';

class DnaModel extends Equatable {
  final String modelName;
  final int start;
  final int end;
  final String dnaName;

  const DnaModel({
    required this.modelName,
    required this.start,
    required this.end,
    required this.dnaName,
  });

  DnaModel copyWith({
    String? modelName,
    String? dnaName,
    int? start,
    int? end,
  }) {
    return DnaModel(
      modelName:  modelName ?? this.modelName,
      start: start ?? this.start,
      end: end ?? this.end,
      dnaName: dnaName ?? this.dnaName,
    );
  }


  @override
  List<Object?> get props => [
    modelName,
      ];
}
