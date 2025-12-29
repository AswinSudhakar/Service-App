import 'package:equatable/equatable.dart';
import '../../domain/entities/city.dart';

abstract class LocationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLocation extends LocationEvent {}

class SelectCity extends LocationEvent {
  final City city;
  SelectCity(this.city);

  @override
  List<Object?> get props => [city];
}
