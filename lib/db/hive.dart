import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveDbOperations {
  void initializeHiveDB() async {
    final appDocDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    // await Hive.openBox('myBox');
  }

  //String datainHive;
  saveDataToHive(String actName, String actTime) async {
    await Hive.openBox('myBox');
    await Hive.box('myBox').put(actName, actTime);
  }

  getDataFromHive(String actName) async {
    try {
      await Hive.openBox('myBox');
      return await Hive.box('myBox').get(actName);
    } catch (e) {
      print('Error occured with message => $e');
      return 'Database access failed!';
    }
  }

  myDelay(Function anyFunction) {
    Future.delayed(Duration(seconds: 3), anyFunction);
  }
}
