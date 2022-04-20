import 'package:bloc/bloc.dart';

import 'package:weather_application_2/features/data/models/weather_model.dart';
import 'package:weather_application_2/features/data/repository/weather_repository.dart';
import 'package:weather_application_2/features/domain/repositories/weather_repository.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_event.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherLoadingState()) {
    on<WeatherEvent>((event, emit) async {
      if (event is WeatherLoadEvent) {
      emit(WeatherLoadingState());
    
      await weatherRepository.fetchWeather(event.cityName).then((weather) {
        emit(WeatherLoadedState(weatherModel: weather));
      }).catchError((error) {
        emit(WeatherErrorState(message: error));
      }); 
      } else if (event is WeatherDetailEvent) {
        emit(WeatherLoadingState());

        await weatherRepository.fetchDetailedWeather(event.cityName).then((weather) {
          emit(WeatherLoadedState(weatherModel: weather));
        }).catchError((error) {
          emit(WeatherErrorState(message: 'В сети? ${error}'));
        });
      }
    });
  }
}