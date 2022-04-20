// import 'dart:convert';

// import 'package:weather_application_2/features/data/datasources/weather_remote_data_source.dart';
// import 'package:weather_application_2/features/data/models/weather_model.dart';
// import 'package:http/http.dart' as http;

// abstract class WeatherRepository {
//   Future<WeatherModel> getWeatherCity(String cityController);
// }

// class WeatherRepositoryLoaded implements WeatherRepository {

//   @override
//   Future<WeatherModel> getWeatherCity(String cityController) async {
//     // return WeatherModel(cityController);
//     // final int cityController = await DataService.getLocationID(sehir);
//     return await DataService.getWeatherCity(cityController);
//   }
  
// }

// class NetworkException implements Exception {}

// class WeatherFailure implements Exception {}

// class WeatherRepository {
//   WeatherRepository({MetaWeatherApiClient? weatherApiClient})
//       : _weatherApiClient = weatherApiClient ?? MetaWeatherApiClient();

//   final MetaWeatherApiClient _weatherApiClient;

//   Future<Weather> getWeather(String city) async {
//     final location = await _weatherApiClient.locationSearch(city);
//     final woeid = location.woeid;
//     final weather = await _weatherApiClient.getWeather(woeid);
//     return Weather(
//       temperature: weather.theTemp,
//       location: location.title,
//       condition: weather.weatherStateAbbr.toCondition,
//     );
//   }
// }

// extension on WeatherState {
//   WeatherCondition get toCondition {
//     switch (this) {
//       case WeatherState.clear:
//         return WeatherCondition.clear;
//       case WeatherState.snow:
//       case WeatherState.sleet:
//       case WeatherState.hail:
//         return WeatherCondition.snowy;
//       case WeatherState.thunderstorm:
//       case WeatherState.heavyRain:
//       case WeatherState.lightRain:
//       case WeatherState.showers:
//         return WeatherCondition.rainy;
//       case WeatherState.heavyCloud:
//       case WeatherState.lightCloud:
//         return WeatherCondition.cloudy;
//       default:
//         return WeatherCondition.unknown;
//     }
//   }
// }


// class WeatherRepository {
  // Future<Weather> getLocationWeather() async {
  //   Location location = Location();
  //   await location.getCurrentLocation();
  //   final String rawWeather = await WeatherAPI.getRawWeatherLL(
  //       longtitude: location.longtitude.toString(),
  //       latitude: location.latitude.toString());
  //   return Weather.fromJSON(rawWeather);
  // }

  // Future<WeatherModel> getWeatherForCity(String cityName) async {
  //   final Map<String, dynamic> location = (await WeatherApi.getWeatherCity(cityName)) as Map<String, dynamic>;
  //   return WeatherModel.fromJson(location);
  // }
// class WeatherRepo{
//   Future<WeatherModel> getWeatherForCity(String cityName) async {
//     final parameters = {
//       'appid': '254c9c65adc2f48f757587f78aae369f',
//       'q': cityName,
//       'units': 'metric',
//     }; 
//     final uri = Uri.https('api.openweathermap.org', '/data/2.5/forecast/', parameters);
//     final response = await http.get(uri);

//       if (response.statusCode == 200) {
//       return WeatherModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Error');
//     }
//   }
    //   WeatherModel parsedJson(final response){
    // final jsonDecoded = json.decode(response);

    // final jsonWeather = jsonDecoded["main"];

    // return WeatherModel.fromJson(jsonWeather);
  
