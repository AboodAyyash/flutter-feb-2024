import 'package:app/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _counter = 0;

  bool isScure = true;

  String password = "";
  String userName = "";
  IconData passIcon = Icons.remove_red_eye;

  TextEditingController textEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStorage();
  }

  void setStorage() async {
    print('sss');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("name", "Ahmad");
  }

  void getStorage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(preferences.getString("name"));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.red,
        height: 50,
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.abc),
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("App Bar"),
        actions: [
          Text("Action"),
          IconButton(
            onPressed: () {
              print("object");
            },
            icon: Icon(Icons.alarm),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                ),
                onChanged: (value) {
                  print(value);
                  userName = value;
                },
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "please add name has at leaset 1 chars";
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Phone",
                ),
                onChanged: (value) {
                  print(value);
                },
                validator: (value) {
                  value = replaceNumbers(value);
                  String patttern = r'(^(?:[+0]9)?[0-9]{9,10}$)';
                  RegExp regExp = new RegExp(patttern);
                  if (value.length > 8) {
                    if (value.toString()[0] == "0" &&
                        value.toString()[1] == "7" &&
                        value.length == 9) {
                      return 'pleaseEnterValidMobileNumber';
                    } else if (value.toString()[0] != "0" &&
                        value.toString()[1] == "7" &&
                        value.length > 10) {
                      return 'pleaseEnterValidMobileNumber';
                    } else if (value.toString()[0] != "0" ||
                        value.toString()[1] != "7") {
                      return 'pleaseEnterValidMobileNumber';
                    } else if (!regExp.hasMatch(value)) {
                      return 'pleaseEnterValidMobileNumber';
                    }
                  } else {
                    return 'pleaseEnterValidMobileNumber';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                onChanged: (value) {
                  print(value);
                },
                validator: (value) {
                  if (value!.length >= 8) {
                    if (value.contains("@")) {
                      return null;
                    } else {
                      return "please add @ char in your password";
                    }
                  } else {
                    return "please add name has at leaset 8 chars";
                  }
                },
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  onTap: () {
                    _formKey.currentState!.validate();
                  },
                  child: Text("Login"),
                ),
                InkWell(
                  onTap: () {
                    /*  if (userName.isNotEmpty) { */
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => SignupPage(
                            /*   name: userName, */
                            ),
                      ),
                    );
                    /*  } else {
                      print("OPS!");
                    } */
                  },
                  child: Text("Signup"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future timer() async {
    print("ss1");
    await Future.delayed(Duration(seconds: 1));
    print("ss3");
    return "";
  }

  String replaceNumbers(value) {
    value = value.replaceAll(RegExp(r'٠'), '0');
    value = value.replaceAll(RegExp(r'١'), '1');
    value = value.replaceAll(RegExp(r'٢'), '2');
    value = value.replaceAll(RegExp(r'٣'), '3');
    value = value.replaceAll(RegExp(r'٤'), '4');
    value = value.replaceAll(RegExp(r'٥'), '5');
    value = value.replaceAll(RegExp(r'٦'), '6');
    value = value.replaceAll(RegExp(r'٧'), '7');
    value = value.replaceAll(RegExp(r'٨'), '8');
    value = value.replaceAll(RegExp(r'٩'), '9');
    return value;
  }
}
