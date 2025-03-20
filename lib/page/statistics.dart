import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 238, 248),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Statistics',
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
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: PieChart(
                                duration: const Duration(milliseconds: 500),
                                PieChartData(centerSpaceRadius: 30, sections: [
                                  PieChartSectionData(
                                      radius: 20,
                                      value: 20,
                                      color: Colors.blue),
                                  PieChartSectionData(
                                      radius: 20,
                                      value: 60,
                                      color: Colors.green),
                                  PieChartSectionData(
                                      radius: 20, value: 40, color: Colors.red)
                                ])),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Table',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Overview Graph',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Container(
                      height: 220,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
