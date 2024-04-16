import 'dart:async';

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
  ScrollController controllerList = ScrollController();

  double current = 0.0;
  double max = 0.0;

  List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerList.addListener(() {
      current = controllerList.offset;
      max = controllerList.position.maxScrollExtent;
      if (current == max) {
        print("STOP!");
        Timer(Duration(seconds: 1), () {
          setState(() {
            list.add(list.length);
          });
        });
      }
    });
  }

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
          ),
          IconButton(
            onPressed: () {
              //controllerList.jumpTo(200);
              controllerList.animateTo(200,
                  duration: Duration(seconds: 1), curve: Curves.bounceIn);
            },
            icon: Icon(
              Icons.list,
            ),
          ),
        ],
      ),
      body: ListView(
        controller: controllerList,
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
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (
                BuildContext context,
                index,
              ) {
                print("Dart Code $index");
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    translate(index.toString()),
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 48,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }),
          CircularProgressIndicator(
            strokeAlign: 0,
          ),

          /*    ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              for (int i = 0; i < 10; i++)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    translate("hello"),
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 48,
                      color: Colors.blue,
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
                    color: Colors.amber,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                mainAxisExtent: 100,
              ),
              itemCount: 10,
              itemBuilder: (
                BuildContext context,
                index,
              ) {
                print("Dart Code $index");
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    translate("hello"),
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 48,
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }),
          */
          /*  ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              for (int i = 0; i < 10; i++)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    translate("hello"),
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 48,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
 */
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
