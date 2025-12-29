import 'package:hive/hive.dart';
import '../models/city_model.dart';

class LocationLocalDataSource {
  static const _boxName = 'locationBox';
  static const _cityKey = 'selected_city';

  Future<Box> _openBox() async {
    return Hive.openBox(_boxName);
  }

  CityModel? getSelectedCity() {
    final box = Hive.box(_boxName);
    final data = box.get(_cityKey);
    if (data == null) return null;
    return CityModel.fromJson(Map<String, dynamic>.from(data));
  }

  Future<void> saveSelectedCity(CityModel city) async {
    final box = await _openBox();
    await box.put(_cityKey, city.toJson());
  }
}
