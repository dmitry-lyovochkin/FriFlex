import 'package:equatable/equatable.dart';

class MainEntity extends Equatable{
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
  final double? tempKf;

  const MainEntity(
  {
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf
  });

  @override
  List<Object?> get props => [temp, feelsLike, tempMin, pressure, seaLevel, grndLevel, humidity, tempKf];
}