import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_providers_by_service.dart';
import '../../domain/usecases/get_pending_providers.dart';
import '../../domain/usecases/approve_provider.dart';
import 'provider_event.dart';
import 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState> {
  final GetProvidersByService getProvidersByService;
  final GetPendingProviders getPendingProviders;
  final ApproveProvider approveProvider;

  ProviderBloc({
    required this.getProvidersByService,
    required this.getPendingProviders,
    required this.approveProvider,
  }) : super(ProviderLoading()) {
    on<LoadProviders>((event, emit) async {
      emit(ProviderLoading());
      try {
        emit(ProvidersLoaded(
          await getProvidersByService(event.serviceId),
        ));
      } catch (_) {
        emit(ProviderError('Failed to load providers'));
      }
    });

    on<LoadPendingProviders>((_, emit) async {
      emit(ProviderLoading());
      try {
        emit(ProvidersLoaded(
          await getPendingProviders(const NoParams()),
        ));
      } catch (_) {
        emit(ProviderError('Failed to load pending providers'));
      }
    });

    on<ApproveProviderEvent>((event, emit) async {
      await approveProvider(event.providerId);
      add(LoadPendingProviders());
    });
  }
}
