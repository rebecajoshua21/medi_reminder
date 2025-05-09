import 'package:becky_app/widgets/date_bubble.dart';
import 'package:becky_app/widgets/timeline_tile.dart';
import 'package:becky_app/widgets/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TableCalendar(
          // locale: 'sw_KE',
          selectedDayPredicate: (day) {
            // DateTime _selectedDate;
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
          focusedDay: DateTime.now(),
          firstDay: DateTime.now(),
          lastDay: DateTime.now().add(Duration(days: 1000))),
    );
    // return Scaffold(
    //   backgroundColor: Colors.blue[100],
    //   // floatingActionButton:
    //   //               FloatingActionButton(onPressed: createNewTask,
    //   //               backgroundColor: Colors.blue,child: const Icon(Icons.add,color: Colors.white,size: 30,),
    //   //               ),

    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 15.0),
    //       child: Column(
    //         children: [
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Container(
    //                   decoration: BoxDecoration(
    //                     borderRadius:
    //                         const BorderRadius.all(Radius.circular(20)),
    //                     border: Border.all(color: Colors.blueAccent),
    //                   ),
    //                   child: const Padding(
    //                     padding: EdgeInsets.all(4.0),
    //                     child: Row(
    //                       children: [
    //                         Text(
    //                           'March',
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                         Icon(Icons.keyboard_arrow_down),
    //                       ],
    //                     ),
    //                   )),
    //               Row(
    //                 children: [
    //                   Icon(
    //                     Icons.email_rounded,
    //                     size: 30,
    //                     color: Colors.blue[600],
    //                   ),
    //                   const SizedBox(
    //                     width: 20,
    //                   ),
    //                   Icon(
    //                     Icons.calendar_month,
    //                     size: 30,
    //                     color: Colors.blue[600],
    //                   )
    //                 ],
    //               )
    //             ],
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           SizedBox(
    //               height: 90,
    //               child: ListView.builder(
    //                 scrollDirection: Axis.horizontal,
    //                 itemCount: dates.length,
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return DateBubble(
    //                       date: dates[index], day: days[index % 7]);
    //                 },
    //               )),
    //           Expanded(
    //               child: Container(
    //             child: ListView(
    //               children: const [
    //                 MyTimelineTile(
    //                   isFirst: true,
    //                   isLast: false,
    //                   isPast: true,
    //                 ),
    //                 MyTimelineTile(
    //                   isFirst: false,
    //                   isLast: false,
    //                   isPast: true,
    //                 ),
    //                 MyTimelineTile(
    //                   isFirst: false,
    //                   isLast: true,
    //                   isPast: false,
    //                 ),
    //                 MyTimelineTile(
    //                   isFirst: false,
    //                   isLast: false,
    //                   isPast: false,
    //                 ),
    //                 MyTimelineTile(
    //                   isFirst: false,
    //                   isLast: false,
    //                   isPast: false,
    //                 ),
    //                 MyTimelineTile(
    //                   isFirst: false,
    //                   isLast: false,
    //                   isPast: false,
    //                 ),
    //                 MyTimelineTile(
    //                   isFirst: false,
    //                   isLast: true,
    //                   isPast: false,
    //                 ),
    //               ],
    //             ),
    //           )),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

// Widget _widget() {
//   return SafeArea(
//     child: TableCalendar(
//         // locale: 'sw_KE',
//         selectedDayPredicate: (day) {
//           DateTime _selectedDate;
//           // return isSameDay(_selectedDay, day);
//         },
//         onDaySelected: (selectedDay, focusedDay) {
//           // setState(() {
//           //   _selectedDay = selectedDay;
//           //   _focusedDay = focusedDay; // update `_focusedDay` here as well
//           // });
//         },
//         focusedDay: DateTime.now(),
//         firstDay: DateTime.now(),
//         lastDay: DateTime.now().add(Duration(days: 20))),
//   );
// }
