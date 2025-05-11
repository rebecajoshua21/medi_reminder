import 'package:becky_app/page/home_page.dart';
import 'package:becky_app/page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var userProvider = Provider.of<UserServices>(context);
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // if (snapshot.data?.emailVerified == true) {
            // String userId = FirebaseAuth.instance.currentUser!.uid;
            // userProvider.getUser(userId);
            return HomePage();
            // } else {
            // return VerificationPage();
            // }
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
