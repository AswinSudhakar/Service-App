import 'package:equatable/equatable.dart';

abstract class ServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCategories extends ServiceEvent {}

class LoadServices extends ServiceEvent {
  final String categoryId;
  LoadServices(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

class LoadServiceDetail extends ServiceEvent {
  final String serviceId;
  LoadServiceDetail(this.serviceId);

  @override
  List<Object?> get props => [serviceId];
}
