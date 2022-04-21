import 'dart:convert';
import 'package:weather_application_2/features/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeather(String cityName);
  Future<WeatherModel> fetchThreeDaysWeather(String cityName);
}

class WeatherRepo implements WeatherRepository {
  @override
  Future<WeatherModel> fetchThreeDaysWeather(String cityName) async {
     final parameters = {
      'appid': '254c9c65adc2f48f757587f78aae369f',
      'q': cityName,
      'units': 'metric',
    };

    final uri = Uri.https('api.openweathermap.org', '/data/2.5/forecast/', parameters);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }

  @override
  Future<WeatherModel> fetchWeather(String cityName) async {
     final parameters = {
      'appid': '254c9c65adc2f48f757587f78aae369f',
      'q': cityName,
      'units': 'metric',
    };

    final uri = Uri.https('api.openweathermap.org', '/data/2.5/forecast/', parameters);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }
}

class NetworkError extends Error{}