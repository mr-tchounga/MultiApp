import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../main.dart';


class customInputField extends StatefulWidget {
  const customInputField({
    Key? key,
    required this.height,
    this.width,
    this.controller,
    required this.fontSize,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.validator
  }) : super(key: key);

  final double height;
  final double? width;
  final TextEditingController? controller;
  final double fontSize;
  final Icon? prefixIcon;
  final suffixIcon;
  final String hintText;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  State<customInputField> createState() => _customInputFieldState();
}

class _customInputFieldState extends State<customInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(                    
      height: widget.height/18,
      decoration: BoxDecoration(
        color: colorPrimary.withOpacity(.2),
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        textAlignVertical: TextAlignVertical.bottom,
        controller: widget.controller,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.only( bottom: widget.height/60 ),
          prefixIcon: widget.prefixIcon,
          // prefixIconColor: colorSecondary,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          hintStyle: TextStyle( fontSize: widget.fontSize ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5)
          )
        ),
        validator: widget.validator,
      ),
    );
  }
}


class customPhoneInputField extends StatefulWidget {
  const customPhoneInputField({
    Key? key,
    required this.height,
    required this.fontSize,
    required this.phoneNumber,
  }) : super(key: key);

  final double height;
  final double fontSize;
  final PhoneNumber phoneNumber;  

  @override
  State<customPhoneInputField> createState() => _customPhoneInputFieldState();
}

class _customPhoneInputFieldState extends State<customPhoneInputField> {
  late PhoneNumber _phoneNumber;

  @override
  void initState(){
    super.initState();
    _phoneNumber = widget.phoneNumber;
  }

  void updatePhoneNumber(PhoneNumber newPhoneNumber){
    setState () => _phoneNumber = newPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Container(                    
      height: widget.height/18,
      decoration: BoxDecoration(
        color: colorPrimary.withOpacity(.2),
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      child: Row(
        children: [
          IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
            ),
            initialCountryCode: 'CM',
            onChanged: (phone) => updatePhoneNumber(phone)
          ),
        ],
      ),
    );
  }
}


