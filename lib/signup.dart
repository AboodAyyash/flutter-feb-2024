import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final String name;
  const SignupPage({super.key, required this.name});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.abc))
        ],
      ),
    );
  }
}
