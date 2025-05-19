class Reminder {
  final String title;
  final String description;
  final DateTime startdate;
  final int freq;
  final List<String> times;
  bool isComplete;

  Reminder(
      {required this.title,
      required this.startdate,
      required this.times,
      required this.description,
      required this.freq,
      required this.isComplete});
}
