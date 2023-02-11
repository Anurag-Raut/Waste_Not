import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wastenot/customer/pages/login/cutomerlogin.dart';
import 'package:wastenot/customer/pages/login/home_page.dart';
import 'package:wastenot/customer/pages/signup/customersignup.dart';

class PAuthPage extends StatefulWidget {
  const PAuthPage({super.key});

  @override
  State<PAuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<PAuthPage> {
   
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
 // user is logged in
          if (snapshot.hasData) {
            return HomePage();
          }

          // user is NOT logged in
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
