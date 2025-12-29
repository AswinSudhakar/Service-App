import '../entities/city.dart';

abstract class LocationRepository {
  City? getSelectedCity();
  Future<void> saveSelectedCity(City city);
}
