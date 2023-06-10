import 'package:flutter/material.dart';

import '../../../designer_system/atoms/circular_shape.dart';
import '../../../designer_system/organsms/store_info.dart';

class StoreCard extends StatefulWidget {
  const StoreCard({Key? key}) : super(key: key);

  @override
  State<StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> with TickerProviderStateMixin {
  AnimationController? animationController;
  AnimationController? infoAnimationController;
  Animation<double>? animation;
  Animation<double>? fadeAnimation;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    infoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.ease,
      ),
    );
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.ease,
      ),
    );
    Future.delayed(const Duration(milliseconds: 600), () {
      animationController!.reset();
      animationController!.forward();
      infoAnimationController!.reset();
      infoAnimationController!.forward();
    });

    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation!),
        child: FadeTransition(
          opacity: fadeAnimation!,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 10,
                    children: [
                      CircularShape(
                        height: 35,
                        width: 35,
                        child: Image.network(
                          'https://picsum.photos/200/300?random=1',
                          height: 35,
                          width: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: Offset.zero,
                        ).animate(fadeAnimation!),
                        child: const StoreInfo(
                          expanded: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
