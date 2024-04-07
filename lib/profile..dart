import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  const ProfilePage(
      {super.key,
      required this.email,
      required this.name,
      required this.phone});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: ListView(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              "assets/images/image1.jpeg",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Name: ${widget.name}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Email: ${widget.email}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Phone: ${widget.phone}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          /*  Container(
            height: 100,
            color: Colors.red,
            padding: EdgeInsets.all(20),
            child: Image.network(
              "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
              width: 50,
            ),
          ),
          Image.asset(
            "assets/images/image1.jpeg",
            height: 100,
          ), */
        ],
      ),
    );
  }
}
