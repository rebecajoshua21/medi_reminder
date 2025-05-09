import 'package:becky_app/models/reminder.dart';
import 'package:flutter/material.dart';

class RemindersController extends ChangeNotifier {
  List<Reminder> _reminderList = [
    Reminder(title: "title", description: "desc", freq: 3, isComplete: true)
  ];

  List<Reminder> get reminders => _reminderList;

  void addReminder(String title, String desc, int freq, bool isComplet) {
    Reminder reminder = Reminder(
        title: title, description: desc, freq: freq, isComplete: isComplet);
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
