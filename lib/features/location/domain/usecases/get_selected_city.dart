import '../../../../core/usecase/usecase.dart';
import '../entities/city.dart';
import '../repositories/location_repository.dart';

class GetSelectedCity implements UseCase<City?, NoParams> {
  final LocationRepository repository;

  GetSelectedCity(this.repository);

  @override
  Future<City?> call(NoParams params) async {
    return repository.getSelectedCity();
  }
}
