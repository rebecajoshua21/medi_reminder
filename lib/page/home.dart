import 'package:becky_app/controllers/reminders_controller.dart';
import 'package:becky_app/page/calender_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:medifriend/Pages/notification_page.dart';
// import 'package:medifriend/widgets/today_schedule.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<String> fetchUserName() async {
    // Assuming you have a Firestore instance and a collection named 'users'

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    final userId = user.uid;
    final firestore = FirebaseFirestore.instance;
    final userDoc = await firestore.collection('users').doc(userId).get();

    if (userDoc.exists) {
      print(userDoc.data());
      return userDoc.data()?['username'] ?? 'Unknown User';
    } else {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    var reminderService = Provider.of<RemindersController>(
      context,
    );
    var reminders = reminderService.reminders;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blueGrey,
                            backgroundImage: AssetImage('assets/image.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Habari!",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                FutureBuilder<String>(
                                  future: fetchUserName(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text(
                                        "Loading...",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text(
                                        "Error",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      );
                                    } else {
                                      return Text(
                                        snapshot.data ?? "Unknown User",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white60,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.calendar_month,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CalenderPage()));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white60,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.notifications_active_rounded,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            onPressed: () {
// Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
                            },
                          ),
                        ),
                      ])
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Ratiba ya leo",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Row(
                            children: [
                              Text(
                                'Leo',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      //border: Border.all(color: Colors.black),
                      color: Colors.blue[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reminders.isNotEmpty
                                ? reminders.first.times[0]
                                : "No Data",
                            style: const TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Muda wa kumeza dawa",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 104, 101, 101)),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 3, 54, 131)),
                              color: Colors.blue[100],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Center(
                                child: Text(
                                  'zaidi..',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Ratiba zijazo",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Row(
                            children: [
                              Text(
                                'Wiki hii',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: reminders.isEmpty
                    ? Center(
                        child: Text(
                          "Hakuna ratiba ya dawa",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: reminders.length,
                        itemBuilder: (BuildContext context, int index) {
                          final reminder = reminders[index];
                          return MedicalReminderTile(
                            title: reminder.title,
                            subtitle: reminder.description,
                            time: reminder.times[0],
                            isCompleted: reminder.isComplete,
                            onToggle: () {
                              reminderService.toggleComplete(index);
                            },
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class MedicalReminderTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool isCompleted;
  final VoidCallback? onToggle;

  const MedicalReminderTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isCompleted,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isCompleted ? Colors.grey : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: isCompleted ? Colors.grey : Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Next Dose: $time",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isCompleted ? Colors.grey : Colors.blue,
                  ),
                ),
              ],
            ),
            Checkbox(
              value: isCompleted,
              onChanged: (_) => onToggle?.call(),
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
