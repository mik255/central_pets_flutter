import 'package:flutter/material.dart';

class PriceDescount extends StatelessWidget {
  const PriceDescount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 126,
      height: 17,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text(
            "R\$ 23,67",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          SizedBox(width: 6),
          Text(
            "R\$ 23,67",
            style: TextStyle(
              color: Color(0x5b000000),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
