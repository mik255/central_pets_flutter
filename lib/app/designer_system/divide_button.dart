

import 'package:flutter/material.dart';

class DevideButton extends StatelessWidget {
  const DevideButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Transform.rotate(
            angle: 1.57,
            child: Container(
              width: 35,
              height: 1,
            ),
          ),
          SizedBox(height: 483),
          Container(
            width: 359,
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1, ),
              color: Color(0x00ffffff),
            ),
          ),
        ],
      ),
    );
  }
}
