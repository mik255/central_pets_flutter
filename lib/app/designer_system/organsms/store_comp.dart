import 'dart:math';
import 'package:event_driver_arch/app/designer_system/organsms/store_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../atoms/circular_shape.dart';
import '../atoms/styles/decorators/decorators.dart';

class StoreComp extends StatefulWidget {
  const StoreComp({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;

  @override
  State<StoreComp> createState() => _StoreCompState();
}

class _StoreCompState extends State<StoreComp> {
  final randomNumber = Random().nextInt(10000);
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: GestureDetector(
                      onTap: () {
                       widget.onTap!();
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 50,
                        width: 100,
                        child: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                    ),
                    secondChild: GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                        height: isExpanded ? 50 : 0,
                        child: const Icon(
                          Icons.close,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 10,
                  children: [
                    Wrap(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.elasticInOut,
                            clipBehavior: Clip.antiAlias,
                            height: isExpanded ? 150 : 50,
                            width: isExpanded ? 150 : 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  isExpanded ? 25 : 100),
                              boxShadow: [CustomDecorators.shadow],
                            ),
                            child: Image.asset(
                              'assets/category_pets.png',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: StoreInfo(
                        expanded: isExpanded,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.ease,
                      height: isExpanded ? 500 : 0,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 1000),
                        opacity: isExpanded ? 1 : 0,
                        curve: Curves.elasticInOut,
                        child: Builder(builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                boxShadow: [CustomDecorators.shadow],
                              ),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          const Text(
                                            'Ultimas avaliações',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                spacing: 10,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 10,
                                                    backgroundColor:
                                                        Colors.grey[300],
                                                    child: Image.network(
                                                      'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    'name',
                                                    style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontSize: 13,
                                                      fontFamily: "Inter",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              const Text(
                                                'Gostei bastante do atendimento, o pedido chegou rápido e quente. Recomendo!',
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                spacing: 10,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 10,
                                                    backgroundColor:
                                                        Colors.grey[300],
                                                    child: Image.network(
                                                      'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    'name',
                                                    style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontSize: 13,
                                                      fontFamily: "Inter",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              const Text(
                                                'Gostei bastante do atendimento, o pedido chegou rápido e quente. Recomendo!',
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                spacing: 10,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 10,
                                                    backgroundColor:
                                                        Colors.grey[300],
                                                    child: Image.network(
                                                      'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    'name',
                                                    style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontSize: 13,
                                                      fontFamily: "Inter",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              const Text(
                                                'Gostei bastante do atendimento, o pedido chegou rápido e quente. Recomendo!',
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: 1,
            color: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
