import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({Key? key, required this.path, this.child})
      : super(key: key);
  final String path;
  final Widget? child;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController animationController2;
  late AnimationController animationController3;
  late Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animationController3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    animation = CurvedAnimation(
      parent: animationController3,
      curve: Curves.easeInOut,
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController3.forward();
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.amber,
            body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        AnimatedBuilder(
                            animation: animationController3,
                            builder: (context, child) {
                              return Container(
                                alignment: FractionalOffset.topLeft,
                                height: animation.value *
                                    10000,
                                width: animation.value *
                                    10000,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                        animation.value * 10000),
                                    bottomRight: Radius.circular(
                                        animation.value * 10000),
                                  ),
                                  color: Colors.blue,
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: widget.child ??
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FadeTransition(
                                  opacity: Tween<double>(
                                    begin: 0,
                                    end: 1,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: animationController
                                        ..reset()
                                        ..forward(),
                                      curve: Curves.ease,
                                    ),
                                  ),
                                  child: SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0, 1),
                                      end: Offset.zero,
                                    ).animate(
                                      CurvedAnimation(
                                        parent: animationController
                                          ..reset()
                                          ..forward(),
                                        curve: Curves.ease,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.black54,
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Center(
                                                    child: Icon(
                                                      size: 15,
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Image.asset(
                                            widget.path,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeTransition(
                        opacity: Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(
                          CurvedAnimation(
                            parent: animationController
                              ..reset()
                              ..forward(),
                            curve: Curves.ease,
                          ),
                        ),
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: animationController
                                ..reset()
                                ..forward(),
                              curve: Curves.ease,
                            ),
                          ),
                          child:  SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Product Name',
                                  style: GoogleFonts.fredoka(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Product Description',
                                  style: GoogleFonts.fredoka(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Aprecie o prazer irresistível de um bolo de chocolate deliciosamente tentador. Nosso bolo de chocolate é uma obra-prima da confeitaria, cuidadosamente preparado com ingredientes da mais alta qualidade para oferecer uma experiência culinária excepcional. Aprecie o prazer irresistível de um bolo de chocolate deliciosamente tentador. Nosso bolo de chocolate é uma obra-prima da confeitaria, cuidadosamente preparado com ingredientes da mais alta qualidade para oferecer uma experiência culinária excepcional.',
                                  style: GoogleFonts.fredoka(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
