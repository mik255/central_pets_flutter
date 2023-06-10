import 'package:flutter/material.dart';

import 'atoms/styles/texts.dart';

class CircularBadge extends StatelessWidget {
  const CircularBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: Stack(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffe3073c),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "2",
                style: TextStyles.whiteSubtitleBoldW700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
