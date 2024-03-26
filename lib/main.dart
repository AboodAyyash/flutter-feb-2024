import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          width.toString(),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                cal();
              },
              child: Container(
                width: width > 450 ? 10 : width / 4,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.amber,
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
                    backgroundColor: const Color.fromARGB(
                        255, 148, 33, 33), //Color(0xFF000000),
                    color: Colors.deepOrange[200],
                  ),
                ),
              ),
            ),
          ],
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
