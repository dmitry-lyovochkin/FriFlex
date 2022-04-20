
import 'package:equatable/equatable.dart';

class CloudsEntity extends Equatable{
  final int? all;

  const CloudsEntity({
    required this.all
  });

  @override
  List<Object?> get props => [all];
}