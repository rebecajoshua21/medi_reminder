import 'package:becky_app/models/reminder.dart';
import 'package:flutter/material.dart';

class RemindersController extends ChangeNotifier {
  List<Reminder> _reminderList = [
    // Reminder(title: "title", description: "desc", freq: 3, isComplete: true)
  ];

  List<Reminder> get reminders => _reminderList;

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
    _reminderList.add(reminder);
    notifyListeners();
  }

  void deleteReminder(int index) {
    if (index >= 0 && index < _reminderList.length) {
      _reminderList.removeAt(index);
      notifyListeners();
    }
  }

  void toggleComplete(int index) {
    if (index >= 0 && index < _reminderList.length) {
      _reminderList[index].isComplete = !_reminderList[index].isComplete;
      notifyListeners();
    }
  }
}
