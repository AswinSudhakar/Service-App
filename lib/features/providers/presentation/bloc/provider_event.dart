import 'package:equatable/equatable.dart';

abstract class ProviderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProviders extends ProviderEvent {
  final String serviceId;
  LoadProviders(this.serviceId);

  @override
  List<Object?> get props => [serviceId];
}

class LoadPendingProviders extends ProviderEvent {}

class ApproveProviderEvent extends ProviderEvent {
  final String providerId;
  ApproveProviderEvent(this.providerId);

  @override
  List<Object?> get props => [providerId];
}
