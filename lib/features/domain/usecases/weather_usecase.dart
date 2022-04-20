// import 'package:weather_application_2/features/domain/entities/weather_entity.dart';
// import 'package:weather_application_2/features/domain/repositories/weather_repository.dart';

// class GetAllWeatherUseCase extends UseCase<WeatherEntity>, void> {
//   final WeatherRepository weatherRepository;

//   GetAllWeatherUseCase({
//     required this.weatherRepository,
//   });
// }
// import 'package:weather_application_2/features/data/models/weather_model.dart';
// import 'package:weather_application_2/features/domain/repositories/weather_repository.dart';

// class GetWeatherUseCase extends UseCase<WeatherModel, void> {
//   final WeatherRepository weatherRepository;

//   GetAllStoreUseCase(this.weatherRepository);

//   @override
//   Future<WeatherModel> call({void params}) async {
//     return await weatherRepository.getWeatherCity();
//   }
// }