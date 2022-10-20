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
  final Function(List<String>)? onTapRegister;
  final Function(String)? onTapForgotPassword;
  final Function(String)? onTapRegisterFacebook;
  final Function(String)? onTapRegisterGoogle;
  final Function(String)? onTapRegisterHere;

  const Login({Key? key,this.onTapRegister,this.onTapForgotPassword,this.onTapRegisterFacebook,this.onTapRegisterGoogle,this.onTapRegisterHere
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<User> users=[];
  void fillList(){
    users.add(User("Celeste@gmail.com","Cele123"));
    users.add(User("Martin@silentiumapps.com","Martin123"));
  }
  List<String> ontapLogin=[];

  bool isHover = false;
  bool isEnable = true;

  late String mailUser;
  late String password;
  final formKey=GlobalKey<FormState>();

  String isUser(String mailUser, String password){
    bool user=false;
    for(int i=0;i<users.length;i++){
      if(users[i].mail==mailUser && users[i].password==password){
        user=true;
      }
    }
    if(user==false){
      return "Usuario no encontrado";
    }
    else{
      return "Usuario encontrado";
    }
  }

  void showValues(BuildContext context){
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      if(ontapLogin.isEmpty){
        //SOLUCION CON HISTORIAL
        ontapLogin.add(mailUser);
        ontapLogin.add(password);
        bool isValid = EmailValidator.validate(mailUser);
        ontapLogin.add(isValid ?isUser(mailUser, password):"No es un correo valido");
      }else{
        //SOLUCION UNICA
        ontapLogin[0]=mailUser;
        ontapLogin[1]=password;
        bool isValid = EmailValidator.validate(mailUser);
        ontapLogin[2]=(isValid ?isUser(mailUser, password):"No es un correo valido");
      }
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
    return loginUser(MediaQuery.of(context).size.width);
  }

  Widget loginUser(double width){
    return Center(
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
        width: width*0.8,
        child: registerUser(),
      ),
    );
  }

  Widget registerUser() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          //CORREO
          TextFormField(
            onSaved: (value){
              mailUser=value!;
            },
            validator: (value){
             if(value!.isEmpty){
               return "*Campo Obligatorio";
             }
             return null;
            },
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Correo",
              contentPadding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
              filled: true,
              fillColor: const Color(0xffc9c9c9),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20)
              ),
            ),
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18),
          ),
          const SizedBox(height: 20,),

          //CONTRASEÑA
          TextFormField(
              onSaved: (value){
                password=value!;
              },
              validator: (value){
                if(value!.isEmpty){
                  return "*Campo Obligatorio";
                }
                return null;
              },
              obscureText: getEnable(),
              cursorColor: Colors.black,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18),
              decoration: InputDecoration(
                  hintText: "Contraseña",
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  filled: true,

                  fillColor: const Color(0xffc9c9c9),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  suffixIcon: Align(
                      widthFactor: 1.5,
                      heightFactor: 1.0,
                      child: AnimatedIconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        icons: [
                          AnimatedIconItem(
                            icon: const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: () => setState(() {
                              isEnable = false;
                            }),
                            backgroundColor: Colors.transparent,),
                          AnimatedIconItem(
                            icon: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: () => setState(() {
                              isEnable = true;
                            }),
                            backgroundColor: Colors.transparent,)
                        ],
                      )
                  ))),
          const SizedBox(height: 20,),
          //OLVIDASTE TU CONTRASEÑA
          forgotPassword(),
          const SizedBox(height: 30,),
          CustomButton2(
            text: 'Ingresar',
            backgroundColor: Colors.teal,
            onTap:  (){
              showValues(context);
              widget.onTapRegister!(ontapLogin);
            },
            height: 50,
            width: 345,
            iconSize: 12,
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
      child: InkWell(
        onTap: (){
          widget.onTapForgotPassword!("Hicieron click en olvidaste tu contraseña");
        },
        hoverColor: Colors.white,
        child: Text("¿Te olvidaste del INKWELL?",style: TextStyle(color: isHover?Colors.black:Colors.grey),),
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
          onTap:  (){
            widget.onTapRegisterFacebook!("Hicieron click en Facebook");
          },
          //height: 50,
          width: 200,
          iconSize: 40,
        ),
        const SizedBox(width: 20,),
        CustomButton2(
          text: '',
          icon: EvaIcons.google,
          backgroundColor: Colors.red,
          onTap:  (){
            widget.onTapRegisterGoogle!("Hicieron click en Google");
          },
          //height: 50,
          width: 200,
          iconSize: 40,
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
            fontSize: 18,
          ),
        ),
        InkWell(
          onTap: (){
            widget.onTapRegisterHere!("Hicieron click en Reqistrate Aquí");
          },
          child: const Text("registrate aquí",
              style:TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )
          ),
        )
      ],
    );
  }
}
