import 'package:becky_app/models/reminder.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RemindersController extends ChangeNotifier {
  // List<Reminder> _reminderList = [
  //   // Reminder(title: "title", description: "desc", freq: 3, isComplete: true)
  // ];

  late Box<Reminder> _reminderBox;
  RemindersController() {
    _reminderBox = Hive.box<Reminder>('reminders');
  }

  List<Reminder> get reminders => _reminderBox.values.toList();

  void addReminder(
      String title, String desc, int freq, bool isComplet, DateTime startdate) {
    Reminder reminder = Reminder(
        title: title,
        times: List.generate(
          freq,
          (index) {
            DateTime reminderTime = DateTime.fromMicrosecondsSinceEpoch(
                    startdate.microsecondsSinceEpoch)
                .add(Duration(hours: (24 ~/ freq) * index));

            String formattedTime =
                "${reminderTime.hour.toString().padLeft(2, '0')}:${reminderTime.minute.toString().padLeft(2, '0')}";

            return formattedTime;
          },
        ),
        description: desc,
        freq: freq,
        isComplete: isComplet,
        startdate: startdate);
    print("🔥🔥saved");
    _reminderBox.add(reminder);
    notifyListeners();
  }

  void deleteReminder(int index) {
    if (index >= 0 && index < _reminderBox.length) {
      _reminderBox.deleteAt(index);
      notifyListeners();
    }
  }

  void toggleComplete(int index) {
    Reminder reminder = _reminderBox.getAt(index)!;
    reminder.isComplete = !reminder.isComplete;
    reminder.save();
    notifyListeners();
  }
}
