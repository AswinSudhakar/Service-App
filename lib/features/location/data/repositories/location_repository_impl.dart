import '../../domain/entities/city.dart';
import '../../domain/repositories/location_repository.dart';
import '../datasources/location_local_datasource.dart';
import '../models/city_model.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationLocalDataSource local;

  LocationRepositoryImpl(this.local);

  @override
  City? getSelectedCity() {
    return local.getSelectedCity();
  }

  @override
  Future<void> saveSelectedCity(City city) {
    return local.saveSelectedCity(
      CityModel(id: city.id, name: city.name),
    );
  }
}
