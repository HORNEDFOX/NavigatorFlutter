import 'package:flutter/material.dart';

class NavigatorPushNamedPage extends StatefulWidget {
  const NavigatorPushNamedPage({Key? key}) : super(key: key);

  @override
  _NavigatorPushNamedPageState createState() => _NavigatorPushNamedPageState();
}

class _NavigatorPushNamedPageState extends State<NavigatorPushNamedPage> {
  String _address = "No address";
  final String _namePage = "Navigator Push Named Page";

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
                  const Icon(Icons.home_rounded),
                  const SizedBox(width: 8,),
                  Text(_address),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: () async {
              var result = await Navigator.pushNamed(context, 'home/formpage', arguments: _namePage,);
              setState(() {
                _address = result.toString();
              });
            }, child: const Text("Form Page")),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text("Back")),
          ],
        ),
      ),
    );
  }
}

