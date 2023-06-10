

import 'package:flutter/material.dart';

class TitleDescription extends StatelessWidget {
  const TitleDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text(
          "Burguer Food",
          style: TextStyle(
            color: Colors.black,
            fontSize: 11,
          ),
        ),
        SizedBox(height: 7),
        SizedBox(
          width: 225,
          child: Text(
            "Maravilhoso burguer com creme, molho,carne de primeira,ovo,pão artesanal",
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
