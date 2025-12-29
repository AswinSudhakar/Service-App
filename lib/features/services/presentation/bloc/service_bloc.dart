import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_services_by_category.dart';
import '../../domain/usecases/get_service_detail.dart';
import 'service_event.dart';
import 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final GetCategories getCategories;
  final GetServicesByCategory getServicesByCategory;
  final GetServiceDetail getServiceDetail;

  ServiceBloc({
    required this.getCategories,
    required this.getServicesByCategory,
    required this.getServiceDetail,
  }) : super(ServiceLoading()) {
    on<LoadCategories>((_, emit) async {
      emit(ServiceLoading());
      try {
        emit(CategoriesLoaded(await getCategories(const NoParams())));
      } catch (_) {
        emit(ServiceError('Failed to load categories'));
      }
    });

    on<LoadServices>((event, emit) async {
      emit(ServiceLoading());
      try {
        emit(ServicesLoaded(
          await getServicesByCategory(event.categoryId),
        ));
      } catch (_) {
        emit(ServiceError('Failed to load services'));
      }
    });

    on<LoadServiceDetail>((event, emit) async {
      emit(ServiceLoading());
      try {
        emit(ServiceDetailLoaded(
          await getServiceDetail(event.serviceId),
        ));
      } catch (_) {
        emit(ServiceError('Failed to load service'));
      }
    });
  }
}
