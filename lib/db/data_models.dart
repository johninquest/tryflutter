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
  final int eventId;
  final String eventName;
  final String eventTime;

  EventModel({this.eventId, this.eventName, this.eventTime});

  Map<String, dynamic> toMap() {
    return {
      'eventId': eventId,
      'eventNaame': eventName,
      'eventTime': eventTime,
    };
  }
}