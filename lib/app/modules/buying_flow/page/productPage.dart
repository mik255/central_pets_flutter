import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../mainStances.dart';
import '../../../designer_system/atoms/circular_shape.dart';
import '../../../designer_system/atoms/styles/texts.dart';
import '../../../designer_system/organsms/appBar/appBar.dart';
import '../../../designer_system/organsms/card_banner.dart';
import '../../../designer_system/organsms/tabBar.dart';
import '../../../designer_system/price_descount.dart';
import '../../../designer_system/product_count.dart';
import '../../../designer_system/texts/text_bold.dart';
import '../../../designer_system/title_description.dart';
import '../controllers/states.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key,required this.url,required this.tag}) : super(key: key);
  final String url;
  final String tag;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with TickerProviderStateMixin{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController animationController;
  @override
  void initState() {

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: widget.tag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 216,
              child: Stack(
                children: [
                  BannerCard(
                    scaffoldKey: scaffoldKey,
                    favorite: false,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    description:
                    tabsData.firstWhere((e) => e.value.isSelected).value.name,
                    path: widget.url,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircularShape(
                        color: Colors.white,
                        height: 43,
                        width: 43,
                        shadow: false,
                        child: Center(
                          child: CircularShape(
                            height: 35,
                            width: 35,
                            child: const Badge(
                              label: Text("1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
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
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(
                "Burguer Food",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 9),
              SizedBox(
                child: Text(
                  "Maravilhoso burguer com creme, molho,carne de primeira,ovo,pão artesanal",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
        TextBold('Adicione extras!',fontSize: 16,),
        const SizedBox(
          height: 16,
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animationController,
            curve: Curves.easeInOut,
          )),

          child: Column(
            children: [
              ...List.generate(
                  8,
                      (index) => InkWell(
                    onTap: () {
                      Navigator.push(context,
                        PageRouteBuilder(
                          transitionDuration:
                          const Duration(milliseconds: 800),
                          pageBuilder: (context, animation1, animation2) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, -1),
                                end: Offset.zero,
                              ).animate(CurvedAnimation(
                                parent: animation1,
                                curve: Curves.easeInOut,
                              )),
                              child: ProductPage(
                                tag: widget.tag,
                                url: 'https://source.unsplash.com/featured/?food&${Random().nextInt(10000)}',
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            direction: Axis.vertical,
                            spacing: 16,
                            children: [
                              TitleDescription(),
                              PriceDescount()
                            ],
                          ),

                        ],
                      ),
                    ),
                  ))
            ],
          ),
        )

      ],
    );
  }
}
