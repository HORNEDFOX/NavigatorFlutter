import 'package:flutter/material.dart';

import 'formPage.dart';

class NavigatorPushPage extends StatefulWidget {
  const NavigatorPushPage({Key? key}) : super(key: key);

  @override
  _NavigatorPushPageState createState() => _NavigatorPushPageState();
}

class _NavigatorPushPageState extends State<NavigatorPushPage> {
  String _name = "No name";
  final String _namePage = "Navigator Push Page";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(_namePage),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle),
                  const SizedBox(width: 8,),
                  Text(_name),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: () async{
              var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage(name: _namePage,)));
              setState(() {
                _name = result.toString();
              });
            }, child: const Text("Form Page")),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Back")),
          ],
        ),
      ),
    );
  }
}
