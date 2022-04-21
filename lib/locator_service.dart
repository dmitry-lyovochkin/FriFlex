import 'package:get_it/get_it.dart';
import 'package:weather_application_2/features/data/repository/weather_repository.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

GetIt injection = GetIt.instance;

Future<void> initializeDependencies() async {
  injection.registerLazySingleton(() => http.Client());

  injection.registerSingleton<WeatherRepository>(WeatherRepo()); /* создается только один раз */

  injection.registerLazySingleton(() => WeatherBloc(injection()));

}