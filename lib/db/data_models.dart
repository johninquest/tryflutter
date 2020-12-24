import 'package:hive/hive.dart';

// part 'timedata.g.dart';

@HiveType(typeId: 0)
class MyHiveDataModel {
  @HiveField(0)
  String actionId;

  @HiveField(1)
  String actionTimestamp;

  @HiveField(2)
  bool isDeleted;

  MyHiveDataModel(this.actionId, this.actionTimestamp, this.isDeleted);
}

class EventModel {
  final int id;
  final String eventName;
  final String eventTime;

  EventModel({this.id, this.eventName, this.eventTime});

  Map<String, dynamic> toMap() {
    return {
      'eventId': id,
      'eventNaame': eventName,
      'eventTime': eventTime,
    };
  }
}
