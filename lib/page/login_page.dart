import 'package:becky_app/page/home_page.dart';
import 'package:becky_app/page/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _loginWithEmailAndPassword(String email, String password) async {
    try {
      // Use FirebaseAuth to sign in with email and password
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("User logged in: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Login failed: ${e.message}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool? change = false;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 238, 248),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ingia',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('Ingia kwenye akaunti tako'),
            const SizedBox(
              height: 40,
            ),
            const Text("Barua pepe"),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 234, 242, 248)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Nywila"),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 131, 188, 244)),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: change,
                    onChanged: (value) {
                      setState(() {
                        change = value;
                        print(change);
                      });
                    }),
                const Text('Tunza')
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _loginWithEmailAndPassword(
                      _emailController.text, _passwordController.text);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const HomePage()));
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 200,
                    child: const Center(
                      child: Text(
                        'Ingia',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    },
                    child: const Text(
                      'Sajili account mpya',
                      style: TextStyle(color: Colors.blue),
                    ))),
            const SizedBox(
              height: 40,
            ),
            const Center(child: Text('Vigezo na masharti kuzingatiwa'))
          ],
        ),
      )),
    );
  }
}
