import 'dart:math';
import 'package:event_driver_arch/app/designer_system/button_black_white.dart';
import 'package:event_driver_arch/app/designer_system/organsms/pageBase.dart';
import 'package:event_driver_arch/app/designer_system/price_descount.dart';
import 'package:event_driver_arch/app/designer_system/texts/text_bold.dart';
import 'package:event_driver_arch/app/designer_system/title_description.dart';
import 'package:event_driver_arch/app/modules/buying_flow/controllers/states.dart';
import 'package:event_driver_arch/app/modules/buying_flow/page/productPage.dart';
import 'package:event_driver_arch/domain/models/storyCategory.dart';
import 'package:flutter/material.dart';
import '../../../../mainStances.dart';
import '../../../designer_system/atoms/circular_shape.dart';
import '../../../designer_system/atoms/smooth_shape.dart';
import '../../../designer_system/atoms/styles/texts.dart';
import '../../../designer_system/organsms/appBar/appBar.dart';
import '../../../designer_system/organsms/card_banner.dart';
import '../../../designer_system/organsms/store_info.dart';
import '../../../designer_system/organsms/tabBar.dart';
import '../../../designer_system/product_count.dart';
import '../controllers/actions/selectTab.dart';
import '../widgets/description_page.dart';
import '../widgets/store_card.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> with TickerProviderStateMixin {
  late TabController tabController;
  late AnimationController animationController;
  late AnimationController titleAnimationController;
  String url =
      'https://source.unsplash.com/featured/?food&${Random().nextInt(10)}';

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    titleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    init();
    tabController = TabController(length: tabsData.length, vsync: this);
    super.initState();
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selected = -1;
  @override
  void dispose() {
    animationController.dispose();
    titleAnimationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(milliseconds: 300), () {
      animationController.reset();
      animationController.forward();
      titleAnimationController.reset();
      titleAnimationController.forward();
    });
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    bottom: ValueNotifier(CustomTabBar(
                      controller: tabController,
                      tabs: [
                        ...tabsData.map((e) => InkWell(
                              onTap: () {
                                tabController.animateTo(tabsData.indexOf(e));
                              },
                              child: Tab(
                                icon: Text(e.value.name,
                                    style: TextStyles.blackButtonBoldW700),
                              ),
                            )),
                      ],
                    )),
                    bottomEmable: ValueNotifier<bool>(true),
                    enabled: ValueNotifier<bool>(true),
                    leadingIconAnimatedState:
                        MainStances.customAppBarStateLeading,
                    scaffoldKey: scaffoldKey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const StoreCard(),
                        const SizedBox(
                          height: 16,
                        ),
                        // TextBold('Categorias'),
                        // const SizedBox(
                        //   height: 16,
                        // ),
                        // SingleChildScrollView(
                        //   scrollDirection: Axis.horizontal,
                        //   child: Wrap(
                        //       spacing: 16,
                        //       children: tabsData
                        //           .map((e) => ValueListenableBuilder<StoryCategory>(
                        //                 valueListenable: e,
                        //                 builder: (context, value, child) {
                        //                   return InkWell(
                        //                     onTap: () {
                        //                       //  selectTab(e);
                        //                     },
                        //                     child: ButtonBlackWhite(
                        //                       text: value.name,
                        //                       selected: value.isSelected,
                        //                     ),
                        //                   );
                        //                 },
                        //               ))
                        //           .toList()),
                        // ),
                        const SizedBox(
                          height: 24,
                        ),
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: const Offset(0, 0),
                          ).animate(CurvedAnimation(
                            parent: titleAnimationController,
                            curve: Curves.ease,
                          )),
                          child: FadeTransition(
                            opacity: titleAnimationController,
                            child: TextBold(
                              'Pratos do dia!',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            ...List.generate(
                                8,
                                (index) => GestureDetector(
                                      onTap: () {
                                        scaffoldKey.currentState
                                            ?.showBottomSheet(
                                          (context) => WillPopScope(
                                            onWillPop: () async {
                                              Navigator.pop(context); //
                                              return false;
                                            },
                                            child: const ProductDescription(
                                              path: 'assets/category_pets.jpg',
                                            ),
                                          ),
                                          transitionAnimationController:
                                              AnimationController(
                                            vsync: this,
                                            duration: const Duration(
                                                milliseconds: 500),
                                          ),
                                        );
                                        // Navigator.push(
                                        //   context,
                                        //   PageRouteBuilder(
                                        //     pageBuilder: (
                                        //       BuildContext context,
                                        //       Animation<double> animation,
                                        //       Animation<double>secondaryAnimation,
                                        //     ) {
                                        //       return ProductDescription(
                                        //         url: url,
                                        //         tag: url + index.toString(),
                                        //       );
                                        //     },
                                        //     transitionsBuilder: (
                                        //       BuildContext context,
                                        //       Animation<double> animation,
                                        //       Animation<double>
                                        //           secondaryAnimation,
                                        //       Widget child,
                                        //     ) {
                                        //       return SlideTransition(
                                        //         position: Tween<Offset>(
                                        //           begin: const Offset(0, 1),
                                        //           end: Offset.zero,
                                        //         ).animate(animation),
                                        //         child: child,
                                        //       );
                                        //     },
                                        //     transitionDuration: const Duration(milliseconds: 500),
                                        //     reverseTransitionDuration: const Duration(milliseconds: 300),
                                        //   ),
                                        // );
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SlideTransition(
                                              position: Tween<Offset>(
                                                begin: const Offset(0, 1),
                                                end: const Offset(0, 0),
                                              ).animate(CurvedAnimation(
                                                parent: animationController,
                                                curve: Curves.ease,
                                              )),
                                              child: const Wrap(
                                                direction: Axis.vertical,
                                                spacing: 16,
                                                children: [
                                                  TitleDescription(),
                                                  PriceDescount()
                                                ],
                                              ),
                                            ),
                                            FadeTransition(
                                              opacity: animationController,
                                              child: ScaleTransition(
                                                scale: Tween<double>(
                                                  begin: 0,
                                                  end: 1,
                                                ).animate(CurvedAnimation(
                                                  parent: AnimationController(
                                                    vsync: this,
                                                    duration: const Duration(
                                                        milliseconds: 1000),
                                                  )
                                                    ..reset()
                                                    ..forward(),
                                                  curve: Curves.elasticInOut,
                                                )),
                                                child: Container(
                                                  clipBehavior:
                                                      Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  height: 50,
                                                  width: 50,
                                                  child: Image.asset(
                                                    'assets/category_pets.jpg',
                                                    height: 35,
                                                    width: 35,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
