import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherLoadEvent extends WeatherEvent {
  final String cityName;

  const WeatherLoadEvent({required this.cityName});

 @override
  List<Object> get props => [cityName]; 
}

