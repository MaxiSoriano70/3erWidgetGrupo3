import 'package:flutter/material.dart';
import 'package:logindesafio3/component/component_button.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:email_validator/email_validator.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return loginUser(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height);
  }

  Widget loginUser(double width,double height){
    return Container(
      width: width*0.8,
      height: height*0.7,
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
          const SizedBox(height: 15,),
          //REGISTRATE AQUI
          registerHere(),
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
          height: 35,
          width: MediaQuery.of(context).size.width*0.33,
          iconSize: 35,

        ),
        const SizedBox(width: 20,),
        CustomButton2(
          text: '',
          icon: EvaIcons.google,
          backgroundColor: Colors.red,
          onTap:  () => print('lo hicimos!!'),
          height: 35,
          width: MediaQuery.of(context).size.width*0.33,
          iconSize: 35,
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
