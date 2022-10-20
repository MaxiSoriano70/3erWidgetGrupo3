import 'package:flutter/material.dart';
import 'package:logindesafio3/component/component_button.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:email_validator/email_validator.dart';

class User {
  String? _mail;
  String? _password;

  User(String mail, String password){
    _mail=mail;
    _password=password;
  }

  String get password => _password!;

  set password(String value) {
    _password = value;
  }

  String get mail => _mail!;

  set mail(String value) {
    _mail = value;
  }
}


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<User> users=[];
  void fillList(){
    users.add(User("Celeste@gmail.com","Cele123"));
    users.add(User("Martin@silentiumapps.com","Martin123"));
  }

  bool isHover = false;
  bool isEnable = true;

  late String mailUser;
  late String password;
  final formKey=GlobalKey<FormState>();

  void isUser(String mailUser, String password){
    bool _isUser=false;
    for(int i=0;i<users.length;i++){
      if(users[i].mail==mailUser && users[i].password==password){
        print(users[i].mail);
        print(users[i].password);
        _isUser=true;
      }
    }
    if(_isUser==false){
      print("Usuario no encontrado");
    }
  }

  void showValues(BuildContext context){
    //ESTO VALIDA SI ES NULL
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      print("$mailUser $password");
      isUser(mailUser, password);
    }
  }

  getEnable() {
    return isEnable;
  }

  @override
  // ignore: must_call_super
  void initState() {
    fillList();
  }

  @override
  Widget build(BuildContext context) {
    return loginUser(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height);
  }

  Widget loginUser(double width,double height){
    return Container(
      width: width*0.8,
      height: height*0.6,
      margin: EdgeInsets.fromLTRB(width*0.1, height*0.25, width*0.1, height*0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //MATERIAL
          cardRegister(width),
          const SizedBox(height: 20,),
          //INGRESAR CON
          titleEnterWith(),
          const SizedBox(height: 20,),
          //BUTTONS
          registerWithNetworks(),
          const SizedBox(height: 20,),
          //REGISTRATE AQUI
          registerHere(),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget cardRegister(double width){
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(32)),
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
        child: registerUser(),
      ),
    );
  }

  Widget registerUser() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //CORREO
          TextFormField(
            onSaved: (value){
              mailUser=value!;
            },
            validator: (value){
              if(value!.isEmpty){
                return "Llene esta campo";
              }
            },
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Correo",
              contentPadding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
              filled: true,
              fillColor: const Color(0xffedfafd),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20)
              ),
            ),
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16),
          ),
          const SizedBox(height: 15,),

          //CONTRASEÑA
          TextFormField(
              onSaved: (value){
                password=value!;
              },
              validator: (value){
                if(value!.isEmpty){
                  return "Llene esta campo";
                }
              },
              obscureText: getEnable(),
              cursorColor: Colors.black,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16),
              decoration: InputDecoration(
                  hintText: "Contraseña",
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  filled: true,
                  fillColor: const Color(0xffedfafd),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  suffixIcon:  Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: AnimatedIconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        icons: [
                          AnimatedIconItem(
                            icon: const Icon(
                              Icons.visibility_off_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                            onPressed: () => setState(() {
                              isEnable = false;
                            }),
                            backgroundColor: Colors.transparent,),
                          AnimatedIconItem(
                            icon: const Icon(
                              Icons.remove_red_eye_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                            onPressed: () => setState(() {
                              isEnable = true;
                            }),
                            backgroundColor: Colors.transparent,)
                        ],
                      )
                  ))),
          const SizedBox(height: 15,),
          //OLVIDASTE TU CONTRASEÑA
          forgotPassword(),
          const SizedBox(height: 25,),
          CustomButton2(
            text: 'Ingresar',
            backgroundColor: Colors.teal,
            onTap:  (){
              showValues(context);
            },
            height: 45,
            width: 390,
            textSize: 17,
          ),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return MouseRegion(
      onEnter: (e){
        setState(() {
          isHover=true;
        });
      },
      onExit: (e){
        setState(() {
          isHover=false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: InkWell(
          onTap: (){
          },
          hoverColor: Colors.white,
          child: Text("¿Olvidaste tu contraseña?",style: TextStyle(color: isHover?Colors.black:Colors.grey),),
        ),
      ),
    );
  }

  Widget titleEnterWith(){
    return const Text("Ingresar con",
      style:TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    );
  }

  Widget registerWithNetworks(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton2(
          text: '',
          icon: EvaIcons.facebook,
          backgroundColor: Colors.indigo,
          onTap:  () => print('lo hicimos!!'),
          height: 40,
          width: MediaQuery.of(context).size.width*0.45/2.5,
          iconSize: 25,

        ),
        const SizedBox(width: 20,),
        CustomButton2(
          text: '',
          icon: EvaIcons.google,
          backgroundColor: Colors.red,
          onTap:  () => print('lo hicimos!!'),
          height: 40,
          width: MediaQuery.of(context).size.width*0.45/2.5,
          iconSize: 25,
        )
      ],
    );
  }

  Widget registerHere() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Si no tenés cuenta ",
          style:TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        InkWell(
          onTap: (){},
          child: const Text("registrate aquí",
              style:TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )
          ),
        )
      ],
    );
  }
}
