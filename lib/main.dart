import 'package:flutter/material.dart';
import 'package:logindesafio3/component/component_button.dart';
import 'package:logindesafio3/component/component_button_ii.dart';

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
          children: const [

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

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHover=false;
  @override
  Widget build(BuildContext context) {
    return loginUser(MediaQuery.of(context).size.width);
  }

  Widget loginUser(double width){
    bool habilitado= true;
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
              child: Form(
                child: Column(
                  children: [
                    //CORREO
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Correo",
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        filled: true,
                        fillColor: const Color(0xffc9c9c9),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 20,),

                    //CONTRASEÑA
                    TextField(
                      obscureText: habilitado,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Contraseña",
                        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        filled: true,
                        fillColor: const Color(0xffc9c9c9),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        suffixIcon:  Align(
                          widthFactor: 2.5,
                          heightFactor: 1.0,
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off_outlined)),
                    ),),),
                    const SizedBox(height: 20,),

                    //OLVIDASTE TU CONTRASEÑA
                    MouseRegion(
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
                    ),

                    //FALTA EL BUTTON INGRESAR


                  ],
                ),
              ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*InkWell(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 70),
                  decoration: const BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: const Icon(Icons.facebook,size: 40,color: Colors.white,),
                ),
              ),*/
              CustomButton2(
                text: '',
                icon: Icons.g_mobiledata_rounded,
                backgroundColor: Colors.indigo,
                onTap:  () => print('lo hicimos!!'),
                //height: 50,
                width: 200,
                iconSize: 40,
              ),
              const SizedBox(width: 20,),
             /* InkWell(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 70),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: const Icon(Icons.g_mobiledata,size: 40,color: Colors.white,),
                ),
              ),*/
              CustomButton2(
                   text: '',
                   icon: Icons.g_mobiledata_rounded,
                   backgroundColor: Colors.red,
                   onTap:  () => print('lo hicimos!!'),
                  //height: 50,
                   width: 200,
                   iconSize: 40,
              )
              /*CustomButton(
                iconData: Icons.g_mobiledata,
                backgroundColor: Colors.red,
                onTap:  () => print('lo hicimos!!'),
                fontSize: 45,
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 30.0, right: 30.0),
              )*/
            ],
          ),
          const SizedBox(height: 20,),

          //REGISTRATE AQUI
          Row(
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
          ),
        ],
      ),
    );
  }
}
