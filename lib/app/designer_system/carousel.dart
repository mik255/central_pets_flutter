import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key, required this.items, required this.spacing})
      : super(key: key);
  final List<Widget> items;
  final double spacing;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> with TickerProviderStateMixin {
  PageController pageController = PageController();
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    );
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );


    super.initState();
  }
 @override
  void dispose() {
    pageController.dispose();
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    return SizedBox(
      height: 250,
      width: width-32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [...widget.items],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    AnimatedBuilder(
                        animation:
                            Listenable.merge([pageController]),
                        builder: (context, child) {

                          return Stack(
                            children: [
                              ...List.generate(
                                  widget.items.length,
                                  (index){
                                    bool selected = (pageController.page??0) == ((widget.items.length-1)-index);
                                    return Transform.translate(
                                      offset: Offset(
                                          (width / 2) - (widget.spacing * index), 0),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 100),
                                        height: 11,
                                        width: selected?(25 - (((pageController.page??0).abs()-(pageController.page??0))*11)):11,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: widget.spacing),
                                        decoration: BoxDecoration(
                                            color: selected
                                                ? Colors.black
                                                : Colors.grey,
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                      ),
                                    );
                                  }),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
