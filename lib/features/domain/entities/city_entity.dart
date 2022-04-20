import 'package:equatable/equatable.dart';
import 'package:weather_application_2/features/data/models/weather_model.dart';

class CityEntity extends Equatable{
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  const CityEntity({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset
  });

  @override
  List<Object?> get props => [id, name, coord, country, population, timezone, sunrise, sunset];
}