import 'package:equatable/equatable.dart';
import 'package:weather_application_2/features/data/models/weather_model.dart';

class WeatherListEntity extends Equatable{
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final Sys? sys;
  final String? dtTxt;
  final Rain? rain;

  const WeatherListEntity(
  {
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
    required this.rain
  });

  @override
  List<Object?> get props => [dt, main, weather, clouds, wind, visibility, pop, sys, dtTxt, rain];
}