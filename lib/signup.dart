import 'package:app/profile..dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int _counter = 0;

  bool isScure = true;

  String password = "";
  String userName = "";
  String email = "";
  String phone = "";
  IconData passIcon = Icons.remove_red_eye;

  TextEditingController textEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
        title: Text("Signup"),
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
            /*  Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
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
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
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
                ),
              ],
            ),
             */
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
                onChanged: (value) {
                  print(value);
                  email = value;
                },
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "please add Email has at leaset 1 chars";
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
                  phone = value;
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
                  password = value;
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
                    if (_formKey.currentState!.validate()) {
                      setData().then((value) {
                        Navigator.pop(context);
                      });
                      /*  Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => ProfilePage(
                            name: userName,
                            email: email,
                            phone: phone,
                          ),
                        ),
                      ); */
                    } else {
                      print("OPS!");
                    }
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

  Future setData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("name", userName);
    await preferences.setString("email", email);
    await preferences.setString("phone", phone);
    await preferences.setString("password", password);
    return true;
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
