import 'package:hive/hive.dart';

part 'reminder.g.dart';

@HiveType(typeId: 0)
class Reminder extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final DateTime startdate;
  @HiveField(3)
  final int freq;
  @HiveField(4)
  final List<String> times;
  @HiveField(5)
  bool isComplete;

  Reminder(
      {required this.title,
      required this.startdate,
      required this.times,
      required this.description,
      required this.freq,
      required this.isComplete});
}
