import 'package:becky_app/widgets/util/my_button.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedSpecialist;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  Future<void> _pickDate(BuildContext context) async {
    print("Selected date: $_selectedDate");
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    print("Selected date but null: $_selectedDate");
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
      print("Selected date: $_selectedDate");
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    print("Selected date: $_selectedDate");
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
      });
    }
  }

  final PaymentService paymentService = PaymentService();

  void initiatePayment() {
    paymentService.initiatePayment(
      buyerEmail: "rebecajoshua5@gmail.com",
      buyerName: "rebeca",
      buyerPhone: "0765537023",
      amount: "200",
      webhookUrl: "https://yourwebsite.com/webhook",
      accountId: "zp53430",
      metadata: {
        "product_id": "12345",
        "color": "blue",
        "size": "L",
        "custom_notes": "Please gift-wrap this item."
      },
      apiKey: "null",
      secretKey: "null",
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            color: Colors.blue,
            child: Text(
              "Weka Miadi",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SingleChildScrollView(
            child: TabBar(
              indicatorColor: Colors.blue,
              overlayColor: MaterialStateProperty.all(Colors.blue),
              controller: _tabController,
              // isScrollable: false,

              tabs: [
                Text(
                  "Wataamu",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Tarehe",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Muda",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Malipo",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: TabBarView(controller: _tabController, children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SpecialistTile(
                      isSelected: false,
                    ),
                    SpecialistTile(
                      isSelected: true,
                    ),
                    SpecialistTile(
                      isSelected: false,
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Chagua tarehe ya miadi",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          print("Selected date: $_selectedDate");
                          _pickDate(context);
                        },
                        child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.blue),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Chagua tarehe'),
                                Icon(Icons.add),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Chagua muda ya miadi",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          print("Selected date: $_selectedDate");
                          _pickTime(context);
                        },
                        child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.blue),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Chagua muda'),
                                Icon(Icons.add),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Maelezo ya Miadi",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wataalamu:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          _selectedSpecialist != null
                              ? _selectedSpecialist!
                              : "Hakuna",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tarehe:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          _selectedDate != null
                              ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                              : "Hakuna",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Muda:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          _selectedTime != null
                              ? "${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}"
                              : "Hakuna",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: MyButton(
                        text: "Thibitisha Miadi",
                        onPressed: () {
                          if (_selectedDate != null && _selectedTime != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Miadi imethibitishwa kwa ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year} saa ${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}"),
                              ),
                            );

                            initiatePayment();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("Tafadhali chagua tarehe na muda!"),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}

class SpecialistTile extends StatelessWidget {
  final bool isSelected;
  const SpecialistTile({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 2,
              color: isSelected
                  ? Colors.blue
                  : const Color.fromARGB(255, 218, 218, 218))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DR.SOME DOCTOR",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text("DR.SOME DOCTOR")
                ],
              )
            ],
          ),
          MyButton(text: "Select", onPressed: () {})
        ],
      ),
    );
  }
}

class PaymentService {
  final String apiUrl = "https://api.zeno.africa";

  Future<void> initiatePayment({
    required String buyerEmail,
    required String buyerName,
    required String buyerPhone,
    required String amount,
    required String webhookUrl,
    required String accountId,
    required Map<String, dynamic> metadata,
    required String apiKey,
    required String secretKey,
  }) async {
    Map<String, dynamic> orderData = {
      "buyer_email": buyerEmail,
      "buyer_name": buyerName,
      "buyer_phone": buyerPhone,
      "amount": amount,
      "webhook_url": webhookUrl,
      "account_id": accountId,
      "metadata": json.encode(metadata),
      "api_key": apiKey,
      "secret_key": secretKey
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: orderData,
      );

      if (response.statusCode == 200) {
        print("Payment initiated successfully: ${response.body}");
      } else {
        print(
            "Failed to initiate payment. Status code: ${response.statusCode}");
        print("Error: ${response.body}");
      }
    } catch (e) {
      print("Error initiating payment: $e");
    }
  }
}
