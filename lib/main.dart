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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool isScure = true;

  String password = "";

  IconData passIcon = Icons.remove_red_eye;

  TextEditingController textEditingController = TextEditingController();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              // enabled: false,
              autofocus: false,
              keyboardType: TextInputType.text,
              maxLength: 10,
              maxLines: 1,
              obscureText: isScure,
              obscuringCharacter: "*",
              readOnly: false,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Here Your Password",
                labelText: "Password",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    passIcon,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      isScure = !isScure;

                      if (isScure) {
                        passIcon = Icons.remove_red_eye;
                      } else {
                        passIcon = Icons.visibility_off;
                      }
                    });
                    print(textEditingController.text);
                  },
                ),
              ),
              controller: textEditingController,
              onChanged: (value) {
                password = value;
                print(textEditingController.text);
              },
              onSubmitted: (value) {
                print(value);
              },
              onTap: () {
                print("OnTap");
              },
            ),
          ),
          customRow(width),
        ],
      ),
    );
  }

  Widget customRow(width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customButton(width, color: Colors.red),
        SizedBox(
          width: 20,
        ),
        Text("text"),
        SizedBox(
          width: 20,
        ),
        Text("text2"),
      ],
    );
  }

  Widget customButton(width, {color = Colors.amber}) {
    return InkWell(
      onTap: () {
        print("password $password");
        cal();
      },
      child: Container(
        width: width > 450 ? 10 : width / 4,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        child: Text(
          _counter.toString(),
          style: TextStyle(
            fontSize: 40,
            backgroundColor:
                const Color.fromARGB(255, 148, 33, 33), //Color(0xFF000000),
            color: Colors.deepOrange[200],
          ),
        ),
      ),
    );
  }

  void cal() {
    setState(() {
      _counter += 1;
      print(_counter);
    });
  }
}


// Login Page has (userName and password TF, Login Button => print userName and password TFs Data)