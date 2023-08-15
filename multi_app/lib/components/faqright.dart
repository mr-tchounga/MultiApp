
import 'package:flutter/material.dart';

class faqConditions extends StatelessWidget {
  const faqConditions({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(height/25),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "FAQ - Conditions d’Utilisation - Politique de Confidentialité",
          style: TextStyle( color: Colors.blue)
        ),
      )
    );
  }
}

