import 'package:equatable/equatable.dart';

abstract class WeatherDetailEvent extends Equatable {
  const WeatherDetailEvent();

  @override
  List<Object> get props => [];
}

class WeatherDetailLoadEvent extends WeatherDetailEvent { // описываю приходящие ивенты
  final String cityName;

  const WeatherDetailLoadEvent({required this.cityName});

 @override
  List<Object> get props => [cityName]; 
}

