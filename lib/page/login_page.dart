import 'package:becky_app/page/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 51, 14),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          height: 250,
          width: 300,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 203, 255, 189),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  Text("Password"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Container(
                  width: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 12, 51, 14),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
