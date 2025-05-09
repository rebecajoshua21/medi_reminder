class Reminder {
  final String title;
  final String description;
  final int freq;
  bool isComplete;

  Reminder(
      {required this.title,
      required this.description,
      required this.freq,
      required this.isComplete});
}
