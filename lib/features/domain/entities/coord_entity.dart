import 'package:equatable/equatable.dart';

class CoordEntity extends Equatable{
  final double? lat;
  final double? lon;

  const CoordEntity({
    required this.lat, 
    required this.lon
  });

  @override
  List<Object?> get props => [lat, lon];
  
}