import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveSetup {
  HiveSetup._() {
    // _init = _initHive();
  }

  static Future get initHive => _initHive();

  static Future _initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }
}
