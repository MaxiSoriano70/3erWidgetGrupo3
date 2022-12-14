import 'package:flutter/material.dart';
import 'package:logindesafio3/component/widget_login.dart';

import 'models/user_models.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  List<User> users=[
    User("Celeste@gmail.com","Cele123"),
    User("Martin@silentiumapps.com","Martin123")
  ];

  void isUser(String mailUser, String password){
    bool isUser=false;
    for(int i=0;i<users.length;i++){
      if(users[i].mail==mailUser && users[i].password==password){
        isUser=true;
      }
    }
    if(isUser==true){
      print("Usuario encontrado");
    }
    else{
      print("Usuario no encontrado");
    }
  }

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
            children: [
              Image.asset('assets/bingo.png', height: double.infinity, width: double.infinity, fit: BoxFit.cover,),
              Login(
                onTapLogin: (user) {
                  print("${user.mail} ${user.password}");
                  isUser(user.mail,user.password);
                  },
                onTapForgotPassword: (){print("Hicieron Click en Olvidaste Tu Contraseña");},
                onTapRegisterFacebook: (){print("Hicieron Click en Ingresar con Facebook");},
                onTapRegisterGoogle: (){print("Hicieron Click en Ingresar con Google");},
                onTapRegisterHere: (){print("Hicieron Click en Registrate Aquí");},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
