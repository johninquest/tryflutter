import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveDbOperations {

  void initializeHiveDB() async {
    final appDocDir = await path_provider.getApplicationDocumentsDirectory();
     Hive.init(appDocDir.path);
  // await Hive.openBox('myBox');
  }

  String datainHive;
  saveToHive(String actName, String actTime) async {
    await Hive.openBox('myBox');
    await Hive.box('myBox').put(actName, actTime);
  }

  getDataInHive(String actName) async {
    await Hive.openBox('myBox');
    var savedData = await Hive.box('myBox').get(actName);
    this.datainHive = savedData;
    print(savedData);
    return savedData;
  }

  myDelay(Function anyFunction) {
    Future.delayed(Duration(seconds: 3), anyFunction);
  }
}
