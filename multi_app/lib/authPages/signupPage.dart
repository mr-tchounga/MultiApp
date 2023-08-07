import 'package:flutter/material.dart';

import '../components/inputField.dart';
import '../main.dart';


class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage>{

  bool _obscureText = true;

  void _submit(){
    Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const SignupPage())
          // MaterialPageRoute(builder: (context) => const ScanPasswordPage())
    );
  }

  void _previousItem() => Navigator.pop(context);

  @override 
  Widget build(BuildContext context){
    double width = getWidth(context);
    double height = getHeight(context);
    double f0 = width * 0.04;
    double f1 = width * 0.05;
    double f2 = width * 0.07;
    double f3 = width * 0.1;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(height/25),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [             
                  // back icon     
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: height/50),
                    child: GestureDetector(
                      onTap: _previousItem,
                      child: const Icon(
                        Icons.arrow_back_ios, 
                        color: Colors.black45                        
                      ) ,
                    ),
                  ),
                  SizedBox(height: height/7),
                   Text("Signin", 
                      style: TextStyle(
                        fontSize: f3,
                        color: colorPrimary,
                        fontWeight: FontWeight.bold
                      ),                  
                  ),
                  SizedBox(height: height/25,),



                  // username
                  customInputField(
                    height: height, 
                    fontSize: f1,
                    hintText: "Name",
                    prefixIcon: const Icon(Icons.person),
                  ),
                  SizedBox(height: height/50),
                  // email
                  customInputField(
                    height: height, 
                    fontSize: f1,
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email),
                  ),
                  SizedBox(height: height/50),
                  // password
                  customInputField(
                    height: height, 
                    fontSize: f1,
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  SizedBox(height: height/50),
                  // repeat password
                  customInputField(
                    height: height, 
                    fontSize: f1,
                    hintText: "Re-enter password",
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  SizedBox(height: height/50),





                  SizedBox(height: height/25,),

                  


                  Container(
                    width: width,
                    height: height/18,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                        backgroundColor: MaterialStateProperty.all<Color>(colorPrimary)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: height/100),
                            child: Text("Submit",
                                  style: TextStyle(
                                    fontSize: f2,
                                    color: Colors.white
                                  ),  
                                ),
                          ),
                          SizedBox(width: 10,),
                          // Icon( Icons.login ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height/15),                           
                ],
              ),
            ),
          ),



          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(height/25),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "FAQ - Conditions d’Utilisation - Politique de Confidentialité",
                style: TextStyle( color: Colors.blue)
              ),
            )
          ),
        ],
      )
    );
  }
}


