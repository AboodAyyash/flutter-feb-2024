import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final pushButtonTextStyle = GoogleFonts.abhayaLibre(
      textStyle: Theme.of(context).textTheme.bodyLarge,
    );
    final counterTextStyle = GoogleFonts.montserrat(
      fontStyle: FontStyle.normal,
      textStyle: Theme.of(context).textTheme.displayLarge,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        actions: [
          IconButton(
            onPressed: () {
              var localizationDelegate = LocalizedApp.of(context).delegate;

              print(localizationDelegate.currentLocale.languageCode);
              if (localizationDelegate.currentLocale.languageCode == "ar")
                changeLocale(context, "en");
              if (localizationDelegate.currentLocale.languageCode == "en")
                changeLocale(context, "ar");
            },
            icon: Icon(
              Icons.translate,
            ),
          )
        ],
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
              "${translate("name")}: ${widget.name}",
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
          SizedBox(
            height: 20,
          ),
          widget.phone == "0787878787"
              ? Image.network(
                  "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                  width: 50,
                  height: 50,
                )
              : Image.asset(
                  "assets/images/image1.jpeg",
                  height: 100,
                ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Style 1",
              style: pushButtonTextStyle,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Style 2",
              style: counterTextStyle,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Style 3",
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 48,
                color: Colors.amber,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Multi Language",
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 48,
                color: Colors.amber,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              translate("thankYou"),
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 48,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              translate("hello"),
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 48,
                fontWeight: FontWeight.w700,
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
