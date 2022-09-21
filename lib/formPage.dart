import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final String ? name;
  FormPage({Key? key, this.name}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late final String namePage;
  final _name = TextEditingController();
  final _address = TextEditingController();

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings argument = ModalRoute.of(context)!.settings;
    if (widget.name == null) {
      namePage = argument.arguments.toString();
    } else {
      namePage = widget.name!;
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Form Page - ${namePage}"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Center(
          child: Column(
            children: [
              Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter name';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.account_circle),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _address,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter address';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          prefixIcon: Icon(Icons.home_rounded),
                        ),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {
                SaveData(context);
              }, child: const Text("Save")),
            ],
          ),
        ),
      ),
    );
  }

  void SaveData(BuildContext context) {
    if (_keyForm.currentState!.validate()) {
      if (widget.name == null) {
        Navigator.pop(context, _address.text);
      } else {
        Navigator.pop(context, _name.text);
      }
    }
  }
}
