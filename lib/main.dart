import 'package:flutter/material.dart';
import 'package:logindesafio3/component/widget_login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
          child: Stack(
            children: const [
              Login()
            ],
          ),
        ),
      ),
    );
  }
}
