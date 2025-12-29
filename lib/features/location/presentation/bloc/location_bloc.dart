import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_selected_city.dart';
import '../../domain/usecases/save_selected_city.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetSelectedCity getSelectedCity;
  final SaveSelectedCity saveSelectedCity;

  LocationBloc({
    required this.getSelectedCity,
    required this.saveSelectedCity,
  }) : super(LocationInitial()) {
    on<LoadLocation>((event, emit) async {
      final city = await getSelectedCity(const NoParams());
      if (city != null) {
        emit(LocationSelected(city));
      }
    });

    on<SelectCity>((event, emit) async {
      await saveSelectedCity(event.city);
      emit(LocationSelected(event.city));
    });
  }
}
