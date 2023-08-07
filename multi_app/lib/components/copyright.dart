import 'package:flutter/material.dart';


class copyright extends StatelessWidget {
  const copyright({
    Key? key,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text('@2023 Suklu - Produced by HOLMETECH GROUP', 
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w100
        ),                  
    );
  }
}
