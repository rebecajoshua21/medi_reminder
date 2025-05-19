import 'package:becky_app/controllers/reminders_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    var reminderService = Provider.of<RemindersController>(
      context,
    );
    var reminders = reminderService.reminders;

    final completedReminders =
        reminders.where((reminder) => reminder.isComplete).length;
    final totalReminders = reminders.length;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 238, 248),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Takwimu',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 183, 219, 248),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Maendeleo kwa ujumla",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Center(
                                    child: Text(
                                      "${(completedReminders / totalReminders * 100).toStringAsFixed(0)}%",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  LinearPercentIndicator(
                                    // width: 140.0,
                                    lineHeight: 12.0,
                                    percent:
                                        completedReminders / totalReminders,
                                    backgroundColor: Colors.grey[100],
                                    progressColor: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // Expanded(
                          //   child: Container(
                          //     height: 120,
                          //     decoration: BoxDecoration(
                          //       color: Colors.blue,
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //     child: PieChart(
                          //         duration: const Duration(milliseconds: 500),
                          //         PieChartData(
                          //             centerSpaceRadius: 30,
                          //             sections: [
                          //               PieChartSectionData(
                          //                   radius: 20,
                          //                   value: 20,
                          //                   color: Colors.blue),
                          //               PieChartSectionData(
                          //                   radius: 20,
                          //                   value: 60,
                          //                   color: Colors.green),
                          //               PieChartSectionData(
                          //                   radius: 20,
                          //                   value: 40,
                          //                   color: Colors.red)
                          //             ])),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Weekly performance',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 183, 219, 248),
                            borderRadius: BorderRadius.circular(10)),
                        child: LineChart(LineChartData(lineBarsData: [
                          LineChartBarData(
                              isCurved: true,
                              color: Colors.green,
                              spots: [
                                FlSpot(0, 0),
                                FlSpot(4, 5),
                                FlSpot(6, 6),
                                FlSpot(8, 8),
                                FlSpot(12, 2)
                              ]),
                          LineChartBarData(color: Colors.red, spots: [
                            FlSpot(0, 3),
                            FlSpot(6, 5),
                            FlSpot(8, 6),
                            FlSpot(10, 9),
                            FlSpot(12, 5)
                          ]),
                        ]))),
                    const SizedBox(height: 10),
                    const Text('Missed reminders',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Container(
                      height: 250,
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: ListTile(
                              tileColor: Colors.white,
                              leading: Text(
                                "12:23",
                                style: TextStyle(fontSize: 16),
                              ),
                              title: Text("Some Text",
                                  style: TextStyle(fontSize: 18)),
                              trailing: Icon(
                                Icons.alarm_off,
                                color: Colors.red,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
