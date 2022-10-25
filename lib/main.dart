import 'package:flutter/material.dart';
import 'package:logindesafio3/component/widget_login.dart';

import 'models/User_Models.dart';


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
      print(users[i].mail);
      print(mailUser);
      if(users[i].mail==mailUser && users[i].password==password){
        isUser=true;
      }
    }
    if(isUser==false){
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
<<<<<<< HEAD
            children:  [
              Image.asset('assets/fondo.png', fit: BoxFit.cover, height: double.infinity, width: double.infinity,),
              Login()
=======
            children: [
              Login(
                onTapLogin: (user) {
                  print(user);
                  isUser(user.mail,user.password);
                  },
                onTapForgotPassword: (password){print(password);},
                onTapRegisterFacebook: (facebook){print(facebook);},
                onTapRegisterGoogle: (google){print(google);},
                onTapRegisterHere: (registerHere){print(registerHere);},
              ),
>>>>>>> e7a0967be6f056beb2e5e24a53865a84469fc2d8
            ],
          ),
        ),
      ),
    );
  }
}
