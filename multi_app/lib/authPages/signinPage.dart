import 'package:flutter/material.dart';
import 'package:multi_app/authPages/signupPage.dart';
import 'package:multi_app/utils/auth.dart';

import '../components/inputField.dart';
import '../main.dart';


class SigninPage extends StatefulWidget{
  const SigninPage({super.key});

  @override
  SigninPageState createState() => SigninPageState();
}

class SigninPageState extends State<SigninPage>{

  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  final _submit = GlobalKey<FormState>();

   Future<void> _submitForm() async {
    if(_submit.currentState!.validate()){
      var userData = await getUserData(_passwordController.text);
      // print(userData[3]);
      if (userData[3]){
        
      }
      // Navigator.push(
      //       context, 
      //       MaterialPageRoute(builder: (context) => const SigninPage())
      // );
    } else{
      // api validation error
    }
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
                  SizedBox(height: height/15),

                  Form(
                    key: _submit,
                    child: Column(children: [
                      // email
                      customInputField(
                        height: height, 
                        fontSize: f1,
                        hintText: "Email",
                        controller: _mailController,
                        prefixIcon: const Icon(Icons.email),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required field Empty';
                          } else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: height/50),
                      // password
                      customInputField(
                        obscureText: _obscureText,
                        height: height, 
                        fontSize: f1,
                        hintText: "Password",
                        controller: _passwordController,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() =>  _obscureText = !_obscureText),
                          child: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required field Empty';
                          } else{
                            return null;
                          }
                        },
                      ),


                      SizedBox(height: height/30,),


                      // password forgotten
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Password forgotten",
                              style: TextStyle(
                                fontSize: f0,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                                color: Colors.black.withOpacity(.5)
                              ),
                            ),
                          )
                        ],
                      ),  

                      SizedBox(height: height/20,),

                      Container(
                        width: width,
                        height: height/18,
                        child: ElevatedButton(
                          onPressed: _submitForm,
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

                  

                    ]),
                  ),


                  // signup
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=>const SignupPage())),
                        child: Text(
                          "Don't have an account yet ?",
                          style: TextStyle(
                            fontSize: f0,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            color: colorSecondary
                          ),
                        ),
                      )
                    ],
                  ),                        
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}


