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
        backgroundColor: Colors.grey,
        body: Stack(
          children:[

            //COMENTE EL GATITO PARA QUE SE VEA DE FONDO GRIS
            /*Container(
              alignment: Alignment.center,
              child: const Image(image: NetworkImage(
                  "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"
              ),
                fit: BoxFit.cover,
              )
            ),*/
        Login(),
          ],
        ),
      ),
    );
  }
}
