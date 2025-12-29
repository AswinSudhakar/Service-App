import 'package:equatable/equatable.dart';
import '../../domain/entities/service.dart';
import '../../domain/entities/service_category.dart';

abstract class ServiceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServiceLoading extends ServiceState {}

class CategoriesLoaded extends ServiceState {
  final List<ServiceCategory> categories;
  CategoriesLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class ServicesLoaded extends ServiceState {
  final List<Service> services;
  ServicesLoaded(this.services);

  @override
  List<Object?> get props => [services];
}

class ServiceDetailLoaded extends ServiceState {
  final Service service;
  ServiceDetailLoaded(this.service);

  @override
  List<Object?> get props => [service];
}

class ServiceError extends ServiceState {
  final String message;
  ServiceError(this.message);
}
