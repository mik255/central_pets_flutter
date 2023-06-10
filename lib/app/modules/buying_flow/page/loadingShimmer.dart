import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../designer_system/atoms/circular_shape.dart';
import '../../../designer_system/atoms/smooth_shape.dart';
import '../../../designer_system/button_black_white.dart';
import '../../../designer_system/organsms/pageBase.dart';
import '../../../designer_system/texts/text_bold.dart';

class StorePageLoadingShimmer extends StatefulWidget {
  const StorePageLoadingShimmer({Key? key}) : super(key: key);

  @override
  State<StorePageLoadingShimmer> createState() =>
      _StorePageLoadingShimmerState();
}

class _StorePageLoadingShimmerState extends State<StorePageLoadingShimmer> {

  @override
  Widget build(BuildContext context) {

    return PageBase(
        controller: PageBaseController(PageBaseState(index: 0)),
        children: [
          Shimmer(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBEBF4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 16,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEBEBF4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 16,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFEBEBF4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                        CircularShape(
                          height: 40,
                          width: 40,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEBEBF4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 16,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFEBEBF4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                          spacing: 16,
                          children: [
                            {'name': 'Café', 'selected': false},
                            {'name': 'Padaria', 'selected': true},
                            {'name': 'Hamburgueria', 'selected': false},
                            {'name': 'Gelateria', 'selected': false},
                            {'name': 'restaurante', 'selected': false},
                            {'name': 'Bar', 'selected': false},
                          ]
                              .map(
                                (e) => shade(
                                  ButtonBlackWhite(
                                    text: e['name'] as String,
                                    selected: e['selected'] as bool,
                                  ),
                                ),
                              )
                              .toList()),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    shade(TextBold('Menu')),
                    const SizedBox(
                      height: 16,
                    ),
                    ...List.generate(
                        8,
                        (index) => shade(
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      direction: Axis.vertical,
                                      spacing: 16,
                                      children: [
                                        Container(
                                          height: 16,
                                          width: 200,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFEBEBF4),
                                            borderRadius:
                                                BorderRadius.horizontal(
                                                    left: Radius.circular(8)),
                                          ),
                                        ),
                                        Container(
                                          height: 16,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEBEBF4),
                                            borderRadius:
                                                BorderRadius.horizontal(
                                                    left: Radius.circular(8)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SmoothShapeContainer(
                                      height: 70,
                                      width: 90,
                                      child: Image.network(
                                        'https://source.unsplash.com/featured/?food&${Random().nextInt(10000)}',
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                  ],
                ),
              ),
            ),
          ),
        ]);
  }

  Widget shade(Widget child) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Color(0xFFEBEBF4), Color(0xFFEBEBF4)],
          stops: [0.0, 1.0],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
