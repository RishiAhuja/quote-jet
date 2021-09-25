import 'package:flutter/material.dart';
import 'package:quote_app/views/home.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return  MaterialApp(
            title: 'Quote App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Home(),
          );
        }
    );
  }
}

