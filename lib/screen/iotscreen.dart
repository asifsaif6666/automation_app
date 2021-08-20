import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';

class IotScreen extends StatefulWidget {
  const IotScreen({Key? key}) : super(key: key);

  @override
  _IotScreenState createState() => _IotScreenState();
}

class _IotScreenState extends State<IotScreen> {
  bool value = false;

  final dbR = FirebaseDatabase.instance.reference();

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.clear_all),
                Text(
                  'My Room',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.settings)
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Temperature',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '20',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      dbR.child("Light").set({"Switch": !value});
                      onUpdate();
                    },
                    label: Text(value ? 'OFF' : 'ON'),
                    elevation: 20,
                    backgroundColor: value ? Colors.yellow : Colors.grey,
                    icon: value
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}





// Future<void> writeData() {
//     dbRef.child('LightState').set({"switch": !value});
//   }