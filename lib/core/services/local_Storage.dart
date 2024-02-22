import 'package:hive/hive.dart';

class appStorage {
  static String NAME = "name";
  static String IMAGE = "image";
  static String IS_UPLOAD = "is_upload";

  static cachedData(String key, dynamic value) {
    var box = Hive.box("user");
    box.put(key, value);
  }

  static Future<dynamic> getcahcedData(
    dynamic key,
  ) async {
    var box = Hive.box("user");
    return box.get(key);
  }
}
