import 'package:becky_app/page/home_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 238, 248),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jisajili",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Jisajili kutengeneza akaunti"),
              SizedBox(
                height: 40,
              ),
              Text("Jina"),
              TextFormField(
                decoration: InputDecoration(
                  hoverColor: Colors.blue,
                  focusColor: Colors.blue,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 131, 188, 244)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Namba ya simu"),
              TextFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 131, 188, 244)),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Email"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 131, 188, 244)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Nywila"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 131, 188, 244)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 200,
                    child: Center(
                        child: Text(
                      "Jisajili",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    )),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Tayari nina account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Text(
                        "Ingia",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ))
                ],
              ),
              Spacer(),
              Center(child: Text('Vigezo na masharti kuzingatiwa'))
            ],
          ),
        ),
      ),
    );
  }
}
