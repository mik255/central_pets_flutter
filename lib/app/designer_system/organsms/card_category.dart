import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../modules/buying_flow/widgets/description_page.dart';
import '../atoms/smooth_shape.dart';

class CardCategory extends StatefulWidget {
  const CardCategory({
    Key? key,
    required this.path,
    required this.category,
    required this.scaffoldKey,
    this.color = Colors.blue,
  }) : super(key: key);
  final String path;
  final String category;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Color color;
  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  AnimationController? animationController2;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController!.reset();
    animationController!.forward();
    animationController2!.reset();
    animationController2!.forward();
    return GestureDetector(
      onTap: () {
        widget.scaffoldKey.currentState
            ?.showBottomSheet(
              (context) => WillPopScope(
            onWillPop: () async {
              Navigator.pop(context); //
              return false;
            },
            child: ProductDescription(
              path: widget.path,
            ),
          ),
          transitionAnimationController:
          AnimationController(
            vsync: this,
            duration: const Duration(
                milliseconds: 500),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: SizedBox(
          width: 130,
          height: 180,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 130,
                  height: 100,
                  child: Card(
                    child: FadeTransition(
                      opacity: Tween<double>(begin: 0, end: 1).animate(
                        CurvedAnimation(
                          parent: animationController2!,
                          curve: Curves.ease,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 80,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      widget.category,
                                      style: GoogleFonts.fredoka(
                                        letterSpacing: 1.08,
                                        color: Colors.black87,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 0, end: 1).animate(
                          CurvedAnimation(
                            parent: AnimationController(
                              vsync: this,
                              duration: const Duration(milliseconds: 800),
                            )..forward(),
                            curve: Curves.elasticInOut,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration:  BoxDecoration(
                                color: widget.color,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(250)),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              width: 110,
                              child: Image.asset(
                                widget.path,
                                fit: BoxFit.cover,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
