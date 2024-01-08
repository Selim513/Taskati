import 'package:hive/hive.dart';

class appStorage {
  static cachedData(String key, String value) {
    var box = Hive.box("user");
    box.put(key, value);
  }

  static Future<String> getcahcedData(String key) async {
    var box = await Hive.box("user");
    return box.get(key);
  }
}
