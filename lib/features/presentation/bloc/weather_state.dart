import 'package:equatable/equatable.dart';

import 'package:weather_application_2/features/data/models/weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

// class WeatherInitialState extends WeatherState {
//   const WeatherInitialState();

//   @override
//   List<Object> get props => [];
// }

class WeatherLoadingState extends WeatherState {

  @override
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherLoadedState({required this.weatherModel});

  @override
  List<Object> get props => [weatherModel];
}

class WeatherErrorState extends WeatherState {
  final String message;
  
  const WeatherErrorState({required this.message});

   @override
  List<Object> get props => [message];
}
