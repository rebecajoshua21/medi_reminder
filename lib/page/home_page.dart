import 'package:becky_app/controllers/notificationCon.dart';
import 'package:becky_app/controllers/reminders_controller.dart';
import 'package:becky_app/page/Reminders.dart';
import 'package:becky_app/page/calender_page.dart';
import 'package:becky_app/page/chatbot.dart';
import 'package:becky_app/page/statistics.dart';
import 'package:becky_app/page/updates_page.dart';
import 'package:becky_app/widgets/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:becky_app/page/home.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const Home(),
    const CalenderPage(),
    const ChatPage(),
    const Statistics(),
    const UpdatesPage()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final reminderService =
        Provider.of<RemindersController>(context, listen: false);
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(onPressed: () {}),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 27.0),
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    // return DialogBox(
                    //     controller: TextEditingController(),
                    //     onSave: () {
                    //       Navigator.pop(context);
                    //     },
                    //     onCancel: () {
                    //       Navigator.pop(context);
                    //     });
                    return MedicationReminderDialog(
                      onSave: (name, dosage, ss) {
                        reminderService.addReminder(name, dosage, 3, false);
                        Navigator.pop(context);
                      },
                      onCancel: () {},
                    );
                  });
            },
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 243, 254),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blueAccent,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: 'Kalenda'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Msaada'),
            BottomNavigationBarItem(
                icon: Icon(Icons.analytics), label: 'Takwimu'),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper), label: 'Makala'),
          ],
        ));
  }
}

// class Home extends StatelessWidget {
//   const Home({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Row(
//                   children: [
//                     CircleAvatar(),
//                     SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [Text('Hellow!'), Text('Frank Youze')],
//                     )
//                   ],
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => const Reminders()));
//                   },
//                   child: const CircleAvatar(
//                     child: Icon(Icons.notifications),
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Maendeleo'),
//                   TextButton(onPressed: () {}, child: const Text("Kalenda"))
//                 ],
//               ),
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 200,
//                         width: 400,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 1, color: const Color(0xFF023259)),
//                           color: Colors.white,
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 'MUDA WA DAWA',
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 '12 : 06 PM',
//                                 style: TextStyle(
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.w800,
//                                     color: Colors.blue),
//                               ),
//                               Text(
//                                 '&',
//                                 style: TextStyle(
//                                     fontSize: 30, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 '08 : 06PM',
//                                 style: TextStyle(
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.w800,
//                                     color: Colors.blue),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                           height: 200,
//                           width: 400,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 1,
//                                 color: const Color.fromARGB(255, 1, 53, 96)),
//                             color: Colors.white,
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10)),
//                           ),
//                           child: const Column(
//                             children: [
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 'MUDA WA DAWA',
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 '12 : 06 PM',
//                                 style: TextStyle(
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.w800,
//                                     color: Colors.blue),
//                               ),
//                               Text(
//                                 '&',
//                                 style: TextStyle(
//                                     fontSize: 30, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 '08 : 06PM',
//                                 style: TextStyle(
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.w800,
//                                     color: Colors.blue),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                             ],
//                           )),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             GestureDetector(
//               onTap: () {
//                 showDialog(
//                     context: context,
//                     builder: (context) {
//                       return DialogBox(
//                           controller: TextEditingController(),
//                           onSave: () {
//                             Navigator.pop(context);
//                           },
//                           onCancel: () {
//                             Navigator.pop(context);
//                           });
//                     });
//               },
//               child: Container(
//                   height: 40,
//                   width: 200,
//                   decoration: BoxDecoration(
//                       border: Border.all(width: 1, color: Colors.blue),
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text('Add medications'),
//                       Icon(Icons.add),
//                     ],
//                   )),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 //   LocalNotifications.reminderNotif(
//                 //     title: "Reminder",
//                 //     body: "This is your minute reminder",
//                 //     payload: "payload",

//                 //   );
//                 DateTime customTime = DateTime.now().add(Duration(minutes: 2));

//                 LocalNotifications.reminderNotificatio(
//                     title: "setup",
//                     body: "hello world",
//                     payload: "some payload",
//                     scheduledTime: customTime);
//               },
//               child: Text("Start Reminder"),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }

// import 'package:flutter/material.dart';

class MedicationReminderDialog extends StatefulWidget {
  final Function(String, String, String) onSave;
  final VoidCallback onCancel;

  const MedicationReminderDialog({
    Key? key,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  State<MedicationReminderDialog> createState() =>
      _MedicationReminderDialogState();
}

class _MedicationReminderDialogState extends State<MedicationReminderDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Medication Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _dosageController,
                decoration: InputDecoration(
                  labelText: "Dosage",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _timeController,
                decoration: InputDecoration(
                  labelText: "Frequency",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _timeController,
                decoration: InputDecoration(
                  labelText: "Start date",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const TimePickerDialog(
                  confirmText: "Set",
                  cancelText: "Sitisha",
                  initialEntryMode: TimePickerEntryMode.inputOnly,
                  initialTime: TimeOfDay(hour: 10, minute: 20)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: widget.onCancel,
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.onSave(
                        _nameController.text,
                        _dosageController.text,
                        _timeController.text,
                      );
                      DateTime customTime =
                          DateTime.now().add(Duration(minutes: 2));
                      LocalNotifications.reminderNotificatio(
                          title: _nameController.text,
                          body: _dosageController.text,
                          payload: "some payload",
                          scheduledTime: customTime);
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
