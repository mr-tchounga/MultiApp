import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:multi_app/authPages/signinPage.dart';
import 'package:multi_app/utils/auth.dart';

import '../components/inputField.dart';
import '../main.dart';


class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage>{

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  PhoneNumber? _phoneNumber;
  String _position = '';
  bool _obscureText = true;
  bool _obscureText2 = true;

  final _submit = GlobalKey<FormState>();
  

  Future<void> _submitForm() async {
    if(_submit.currentState!.validate()){
      setUserData(_usernameController, _mailController, _phoneNumber!, _passwordController);
      // Navigator.push(
      //       context, 
      //       MaterialPageRoute(builder: (context) => const SignupPage())
      // );
      print(await getUserData(_passwordController.text));
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
                  SizedBox(height: height/20),
                   Text("Signup", 
                      style: TextStyle(
                        fontSize: f3,
                        color: colorPrimary,
                        fontWeight: FontWeight.bold
                      ),                  
                  ),
                  SizedBox(height: height/25,),

                  Form(
                    key: _submit,
                    child: Column(
                      children: [
                        // username
                        customInputField(
                          height: height, 
                          fontSize: f1,
                          hintText: "Name",
                          controller: _usernameController,
                          prefixIcon: const Icon(Icons.person),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required field Empty';
                            } else{
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: height/50),

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

                        // phone no
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: height/18,
                          decoration: BoxDecoration(
                            color: colorPrimary.withOpacity(.2),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: IntlPhoneField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15, top: 20),
                              counter: Offstage(),
                              border: InputBorder.none
                            ),
                            initialCountryCode: 'CM',
                            showDropdownIcon: true,
                            dropdownIconPosition: IconPosition.trailing,
                            onChanged: (phone) => _phoneNumber = phone,
                            validator: (value) {
                              print(value);
                              if (value == null || value.number.isEmpty) {
                                return 'Required field Empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: height/50),

                        // position
                        // Container(
                        //   padding: EdgeInsets.only(left: 10),
                        //   height: height/18,
                        //   decoration: BoxDecoration(
                        //     color: colorPrimary.withOpacity(.2),
                        //     borderRadius: BorderRadius.all(Radius.circular(5))
                        //   ),
                        //   child: country(
                        //     decoration: InputDecoration(
                        //       contentPadding: EdgeInsets.only(left: 15, top: 20),
                        //       border: InputBorder.none
                        //     ),
                        //     initialCountryCode: 'CM',
                        //     readOnly: true,
                        //     showDropdownIcon: true,
                        //     dropdownIconPosition: IconPosition.trailing,
                        //     onChanged: (code) => _position = code.countryCode,
                        //     validator: (value) {
                        //       print(value);
                        //       if (value == null || value.number.isEmpty) {
                        //         return 'Required field Empty';
                        //       } else {
                        //         return null;
                        //       }
                        //     },
                        //   ),
                        // ),
                        // SizedBox(height: height/50),
                        
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
                        SizedBox(height: height/50),
                        
                        // repeat password
                        customInputField(
                          obscureText: _obscureText2,
                          height: height, 
                          fontSize: f1,
                          hintText: "Re-enter password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () => setState(() =>  _obscureText2 = !_obscureText2),
                            child: Icon(
                              _obscureText2 ? Icons.visibility : Icons.visibility_off
                            ),
                          ),
                          validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required field empty';
                          } else
                          if (value != _passwordController.text) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                    content: Text('ERREUR: Les mots de passe ne coincide pas!'),
                                  ) );
                            }
                            return null;
                          },
                        ),


                        SizedBox(height: height/15,),

                        
                        // submit
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

                      
                        // signin
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=>const SigninPage())),
                              child: Text(
                                "Already have an account ?",
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
                ],
              ),
            ),
          ),
                  
          SizedBox(height: height/10),
        ],
      )
    );
  }
}


