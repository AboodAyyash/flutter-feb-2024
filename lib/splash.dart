import 'dart:async';

import 'package:app/login.dart';
import 'package:app/profile..dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStorage();
  }

  void getStorage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(preferences.getString("name"));
    print(preferences.getString("email"));
    print(preferences.getString("phone"));
    Timer(Duration(seconds: 1), () {
      var nameStorage = preferences.getString("name");
      var emailStorage = preferences.getString("email");
      var phoneStorage = preferences.getString("phone");
      if (nameStorage == null || emailStorage == null || phoneStorage == null) {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => LoginPage(),
          ),
        );
      } else {
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ProfilePage(
              name: nameStorage,
              email: emailStorage,
              phone: phoneStorage,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/image1.jpeg",
        ),
      ),
    );
  }
}
