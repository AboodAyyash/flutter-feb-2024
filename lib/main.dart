import 'dart:async';

import 'package:app/login.dart';
import 'package:app/profile..dart';
import 'package:app/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}




// Next class => Listview, Future function, async and await

/* 
Login page (userName , password) (Forms Data) => login button ---> Profile,   Signup Button ----> Signup 
Signup Page (userName, password, phone) (Forms Data) => signup button ---> Profile,   Login Button ----> Login
Profile Page ()
 */