import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modules/buying_flow/widgets/description_page.dart';
import '../atoms/smooth_shape.dart';
import '../atoms/styles/decorators/decorators.dart';
import '../atoms/styles/icons.dart';
import '../atoms/styles/texts.dart';

class BannerCard extends StatefulWidget {
  const BannerCard({
    super.key,
    required this.path,
    required this.width,
    required this.height,
    required this.description,
    required this.scaffoldKey,
     this.favorite = false,
  });

  final double height;
  final double width;
  final String path;
  final String description;
  final bool favorite;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<BannerCard> createState() => _BannerCardState();
}

class _BannerCardState extends State<BannerCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Card(

      child: GestureDetector(
        onTap: () {
         widget.scaffoldKey.currentState?.showBottomSheet(
            (context) => WillPopScope(
              onWillPop: () async {
                Navigator.pop(context); //
                return false;
              },
              child: ProductDescription(
                path: widget.path,
              ),
            ),
            transitionAnimationController: AnimationController(
              vsync: this,
              duration: const Duration(milliseconds: 500),
            ),
          );
        },
        child: Card(
          elevation: 0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      widget.path,
                      fit: BoxFit.cover,
                      height: 300,
                      width: widget.width,
                    ),
                  ),
                ],
              ),
              if (widget.favorite)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.favorite
                        ? CustomIcons.favorite
                        : CustomIcons.favoriteBorder,
                  ),
                ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     height: widget.height * 0.3,
              //     decoration: BoxDecoration(
              //       color: Colors.black54,
              //       borderRadius: CustomDecorators.softBorderRadiusBottom,
              //     ),
              //     child: Center(
              //       child: Text(
              //         widget.description,
              //         style: TextStyles.whiteButtonNormalW500,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}


class BannerCard2 extends StatefulWidget {
  const BannerCard2({
    super.key,
    required this.path,
    required this.width,
    required this.height,
    required this.description,
    required this.scaffoldKey,
    this.favorite = false,
  });

  final double height;
  final double width;
  final String path;
  final String description;
  final bool favorite;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<BannerCard2> createState() => _BannerCard2State();
}

class _BannerCard2State extends State<BannerCard2> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController2;
  late AnimationController _animationController3;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationController3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: GestureDetector(
        onTap: () {
          widget.scaffoldKey.currentState?.showBottomSheet(
                (context) => WillPopScope(
              onWillPop: () async {
                Navigator.pop(context); //
                return false;
              },
              child: ProductDescription(
                path: widget.path,
                child:this.widget
              ),
            ),
            transitionAnimationController: _animationController,
          );
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ScaleTransition(
                  scale: Tween<double>(
                    begin: 0.5,
                    end: 1,
                  ).animate(
                    CurvedAnimation(
                      parent: _animationController2..reset()..forward(),
                      curve: Curves.bounceOut,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[200],
                    ),
                    child: ScaleTransition(
                      scale: Tween<double>(
                        begin: 0,
                        end: 1.5,
                      ).animate(
                        CurvedAnimation(
                          parent: _animationController3..reset()..forward(),
                          curve: Curves.elasticInOut,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(250),
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Transform.rotate(
                angle:  -0.25,
                child: Transform.translate(
                  offset: Offset(0, 0),
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.5,
                      end: 0.95,
                    ).animate(
                      CurvedAnimation(
                        parent: _animationController2..reset()..forward(),
                        curve: Curves.ease,
                      ),
                    ),
                    child: Image.asset(
                      'assets/cho_bafinho.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Transform.translate(
                offset: Offset(100, 0),
                child: ScaleTransition(
                  scale: Tween<double>(
                    begin: 0.9,
                    end: 1.3,
                  ).animate(
                    CurvedAnimation(
                      parent: _animationController2..reset()..forward(),
                      curve: Curves.ease,
                    ),
                  ),
                  child: Image.asset(
                    'assets/flay_dog.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.5, -0.6),
              child: ScaleTransition(
                scale: Tween<double>(
                  begin: 0.5,
                  end: 1,
                ).animate(
                  CurvedAnimation(
                    parent: _animationController2..reset()..forward(),
                    curve: Curves.bounceOut,
                  ),
                ),
                child: Container(
                  height: widget.height * 0.3,
                  width: widget.width * 0.4,
                  child: Center(
                    child: Text(
                      "Pet Central!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.fredoka(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.4, 0),
              child: ScaleTransition(
                scale: Tween<double>(
                  begin: 0.5,
                  end: 1,
                ).animate(
                  CurvedAnimation(
                    parent: _animationController2..reset()..forward(),
                    curve: Curves.bounceOut,
                  ),
                ),
                child: Container(
                  height: widget.height * 0.3,
                  width: widget.width * 0.3,
                  child: Center(
                    child: Text(
                        'Tudo para o seu pet!',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.fredoka(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}