import 'package:equatable/equatable.dart';
import '../../domain/entities/city.dart';

abstract class LocationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationSelected extends LocationState {
  final City city;
  LocationSelected(this.city);

  @override
  List<Object?> get props => [city];
}
