import 'package:flutter/material.dart';

import '../main.dart';


class customInputField extends StatelessWidget {
  const customInputField({
    Key? key,
    required this.height,
    this.width,
    required this.fontSize,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText
  }) : super(key: key);

  final double height;
  final double? width;
  final double fontSize;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String hintText;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(                    
      height: height/18,
      decoration: BoxDecoration(
        color: colorPrimary.withOpacity(.2),
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      child: TextFormField(
        // obscureText: ? true : obscureText,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.only( bottom: height/60 ),
          prefixIcon: prefixIcon,
          // prefixIconColor: colorSecondary,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle( fontSize: fontSize ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5)
          )          
        ),
      ),
    );
  }
}