

import 'package:event_driver_arch/domain/repository/local/localRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesImpl extends ILocalRepository{

  Future<SharedPreferencesImpl> init() async{
    prefs = await SharedPreferences.getInstance();
    return this;
  }
  late SharedPreferences prefs;
  @override
  Future<bool> clear() {
    return prefs.clear();
  }

  @override
  Future<bool> containsKey(String key)async{
   return prefs.containsKey(key);
  }

  @override
  String? get(String key){
   return prefs.getString(key);
  }

  @override
  Future<int> getLength()async {
    return prefs.getKeys().length;
  }

  @override
  Future<List<String>> getList()async {
    return prefs.getKeys().toList();
  }

  @override
  Future<bool> remove(String key) {
    return prefs.remove(key);
  }

  @override
  Future<bool> set(String key, String value) async{
    return await prefs.setString(key, value);
  }

}