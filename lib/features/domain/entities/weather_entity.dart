import 'package:equatable/equatable.dart';
import 'package:weather_application_2/features/data/models/weather_model.dart';

class WeatherEntity extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ListModel>? list;
  final City? city;

  const WeatherEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  }); 

  @override
  List<Object?> get props => [cod, message, cnt, list, city];
}

// class WeatherListEntity extends Equatable{
//   int? dt;
//   Main? main;
//   List<Weather>? weather;
//   Clouds? clouds;
//   Wind? wind;
//   int? visibility;
//   double? pop;
//   Sys? sys;
//   String? dtTxt;
//   Rain? rain;

//   WeatherListEntity(
//   {
//     this.dt,
//     this.main,
//     this.weather,
//     this.clouds,
//     this.wind,
//     this.visibility,
//     this.pop,
//     this.sys,
//     this.dtTxt,
//     this.rain
//   });

//   @override
//   List<Object?> get props => [homeStore, bestSeller];
// }

// class MainEntity extends Equatable {
//   double? temp;
//   double? feelsLike;
//   double? tempMin;
//   double? tempMax;
//   int? pressure;
//   int? seaLevel;
//   int? grndLevel;
//   int? humidity;
//   double? tempKf;

//   MainEntity(
//       {this.temp,
//       this.feelsLike,
//       this.tempMin,
//       this.tempMax,
//       this.pressure,
//       this.seaLevel,
//       this.grndLevel,
//       this.humidity,
//       this.tempKf});
// }