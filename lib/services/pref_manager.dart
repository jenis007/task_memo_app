import 'package:get_storage/get_storage.dart';
import 'package:encrypt/encrypt.dart' as enc;

class PrefManager {
  static GetStorage getStorage = GetStorage();
  static String key = "key";

  ///THEME MODE
  static Future setKey(dynamic value) async {
    await getStorage.write(key, value);
  }

  static getKey() {
    if (getStorage.read(key) != null) {
      return enc.Key.fromBase16(getStorage.read(key));
    } else {
      return null;
    }
  }
}
