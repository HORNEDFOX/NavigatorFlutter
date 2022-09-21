import 'package:flutter/material.dart';
import 'package:navigatorflutter/navigatorPushPage.dart';
import 'package:navigatorflutter/navigatorPushNamedPage.dart';

import 'formPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
      ),
      home: NavigatorPage(),
      initialRoute: 'home',
      routes: <String, WidgetBuilder>{
        'home/navigationnamed': (BuildContext context) =>
            const NavigatorPushNamedPage(),
        'home/formpage': (BuildContext context) => FormPage(),
      },
    );
  }
}

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigatorPushPage()));
              },
              child: const Text("Navigator Push"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'home/navigationnamed');
                },
                child: const Text("Navigator Push Named")),
          ],
        ),
      ),
    );
  }
}
