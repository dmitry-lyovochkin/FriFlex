import 'package:equatable/equatable.dart';

class RainEntity extends Equatable{
  final double? d3h;

  const RainEntity({
    required this.d3h
  });

  @override
  List<Object?> get props => [d3h];
}