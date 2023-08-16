

// signup shared preferences
import 'dart:convert';

import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future<void> setUserData(
  TextEditingController usernameController, 
  TextEditingController mailController, 
  PhoneNumber phoneController, 
  TextEditingController passwordController) 
  async {
  
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', usernameController.text);
    prefs.setString('email', mailController.text);
    prefs.setString('phoneNumber', phoneController.completeNumber);
    
    //hash password with bcrypt
    String password = passwordController.text;
    String salt = BCrypt.gensalt();
    String hashedPassword = BCrypt.hashpw(password, salt);
    prefs.setString('password', hashedPassword);

    prefs.setString('role', 'user');

} 

Future<List> getUserData(pwd) 
  async {  
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? '';
    String email = prefs.getString('email') ?? '';
    String phone = prefs.getString('phoneNumber') ?? '';

    // verify hash password exists
    String hashedPassword = prefs.getString('password') ?? '';
    bool ishashedPassword = BCrypt.checkpw(pwd, hashedPassword);
    
    String role = prefs.getString('role') ?? '';

    return [name, email, phone, ishashedPassword, hashedPassword, role];
} 