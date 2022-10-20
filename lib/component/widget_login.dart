import 'package:flutter/material.dart';
import 'package:logindesafio3/component/component_button.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHover=false;
  bool isEnable = true;
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
          Material(
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            color: Colors.white,
            shadowColor: Colors.grey,
            elevation: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
              width: width*0.8,
              child: widget_card_Ingreso(),
            ),
          ),
          const SizedBox(height: 20,),

          //INGRESAR CON

          const Text("Ingresar con",
            style:TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20,),
          //BUTTONS
         registro_redes_sociales(),
          const SizedBox(height: 20,),

          //REGISTRATE AQUI
         widget_registro_externo(),
        ],
      ),
    );
  }

  getEnable() {
    return isEnable;
  }

  widget_registro_externo() {
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
          onTap: (){},
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

  registro_redes_sociales() {
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
          onTap: (){},
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

  widget_link() {
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
        },
        hoverColor: Colors.white,
        child: Text("¿Te olvidaste del INKWELL?",style: TextStyle(color: isHover?Colors.black:Colors.grey),),
      ),
    );
  }

  widget_card_Ingreso() {
    return Form(
      child: Column(
        children: [
          //CORREO
          TextField(
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
          TextField(
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
                  suffixIcon:  Align(
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
          widget_link(),
          const SizedBox(height: 30,),
          CustomButton2(
            text: 'Ingresar',
            backgroundColor: Colors.teal,
            onTap:  () => print('lo hicimos!!'),
            height: 50,
            width: 345,
            iconSize: 12,
          ),
        ],
      ),
    );
  }

}
