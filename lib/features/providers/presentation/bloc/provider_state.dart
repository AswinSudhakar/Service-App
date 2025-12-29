import 'package:equatable/equatable.dart';
import '../../domain/entities/provider.dart';

abstract class ProviderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProviderLoading extends ProviderState {}

class ProvidersLoaded extends ProviderState {
  final List<Provider> providers;
  ProvidersLoaded(this.providers);

  @override
  List<Object?> get props => [providers];
}

class ProviderError extends ProviderState {
  final String message;
  ProviderError(this.message);
}
