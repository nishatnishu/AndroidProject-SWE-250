import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trek_mate/pages/homeScreen.dart';
import 'package:trek_mate/pages/loginPage.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return LoginPage();
          } else if (!user.emailVerified) {
            return Scaffold(
              body: Center(
                child: Text('Please verify your email to proceed.'),
              ),
            );
          } else {
            return HomeScreen();
          }
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}