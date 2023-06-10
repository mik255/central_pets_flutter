import 'package:flutter/material.dart';

class ButtonBlackWhite extends StatelessWidget {
  const ButtonBlackWhite({Key? key, required this.text, this.selected = false})
      : super(key: key);
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:   Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected?Colors.black:Colors.grey[200],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 7,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: selected?Colors.white:Colors.black,
              fontSize: 14,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
