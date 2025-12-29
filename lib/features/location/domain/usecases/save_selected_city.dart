import '../../../../core/usecase/usecase.dart';
import '../entities/city.dart';
import '../repositories/location_repository.dart';

class SaveSelectedCity implements UseCase<void, City> {
  final LocationRepository repository;

  SaveSelectedCity(this.repository);

  @override
  Future<void> call(City city) {
    return repository.saveSelectedCity(city);
  }
}
