import 'package:event_driver_arch/mainStances.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/button_nav_bar.dart';
import '../../designer_system/atoms/styles/texts.dart';
import '../../designer_system/carousel.dart';
import '../../designer_system/drawer.dart';
import '../../designer_system/organsms/appBar/appBar.dart';
import '../../designer_system/organsms/buttonNavBar.dart';
import '../../designer_system/organsms/card_banner.dart';
import '../../designer_system/organsms/card_category.dart';
import '../../designer_system/organsms/store_comp.dart';
import '../../designer_system/organsms/tabBar.dart';
import '../buying_flow/page/store_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with
        //  AutomaticKeepAliveClientMixin<HomePage>,
        TickerProviderStateMixin {
  late TabController tabController;
  var tabsData = ['Home', 'Category', 'Store'];
  late AnimationController animationController;
  late Animation<double> animationController2;

  @override
  void initState() {
    tabController = TabController(length: tabsData.length, vsync: this);

    super.initState();
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animationController2 = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
    );
    animationController.reset();
    animationController.forward();

    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        key: scaffoldKey,
        body: Center(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeTransition(
                          opacity: Tween<double>(
                            begin: 0,
                            end: 1,
                          ).animate(CurvedAnimation(
                            parent: animationController,
                            curve: Curves.ease,
                          )),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.2),
                              end: Offset.zero,
                            ).animate(CurvedAnimation(
                              parent: animationController,
                              curve: Curves.ease,
                            )),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Carousel(
                                  spacing: 32,
                                  items: [
                                    BannerCard2(
                                      scaffoldKey: scaffoldKey,
                                      height: 180,
                                      width: 250,
                                      description: 'Banner description this is a banner',
                                      path: 'assets/food_banner.jpeg',
                                    ),
                                    BannerCard(
                                      scaffoldKey: scaffoldKey,
                                      height: 180,
                                      width: 200,
                                      description: 'Banner',
                                      path: 'assets/pat_banner.jpg',
                                    ),
                                    BannerCard2(
                                      scaffoldKey: scaffoldKey,
                                      height: 180,
                                      width: 250,
                                      description: 'Banner description this is a banner',
                                      path: 'assets/food_banner.jpeg',
                                    ),
                                    BannerCard(
                                      scaffoldKey: scaffoldKey,
                                      height: 180,
                                      width: 280,
                                      description: 'Banner',
                                      path: 'assets/pet_banner_2.jpg',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Categories',
                                style: GoogleFonts.fredoka(
                                  letterSpacing: 1.08,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                              )),
                              const SizedBox(
                                height: 8,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    AnimatedBuilder(
                                        animation: animationController2,
                                        builder: (context, child) {
                                          return AnimatedContainer(
                                            duration: const Duration(milliseconds: 300),
                                            height: 100,
                                            width:
                                                400 - (animationController2.value * 400),
                                          );
                                        }),
                                    CardCategory(
                                      category: 'Serviços',
                                      path: 'assets/category_pets.png',
                                      scaffoldKey: scaffoldKey,
                                    ),
                                    CardCategory(
                                      category: 'Veterinários',
                                      path: 'assets/veterinario_category.png',
                                      scaffoldKey: scaffoldKey,
                                      color: Colors.amber,
                                    ),
                                    CardCategory(
                                      category: 'Produtos',
                                      path: 'assets/shop_clean_category.png',
                                      scaffoldKey: scaffoldKey,
                                      color: Colors.green,
                                    ),
                                    CardCategory(
                                      category: 'Entregas',
                                      path: 'assets/dog_delivery.png',
                                      scaffoldKey: scaffoldKey,
                                      color: Colors.blue[200]!,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Text(
                                'Top lojas',
                                style: TextStyles.blackButtonBoldW700,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              StoreComp(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (
                                        BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                      ) {
                                        return const StorePage();
                                      },
                                      transitionsBuilder: (
                                        BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child,
                                      ) {
                                        return SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(0, 1),
                                            end: Offset.zero,
                                          ).animate(animation),
                                          child: child,
                                        );
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 300),
                                    ),
                                  );
                                },
                              ),
                              const StoreComp(),
                              const StoreComp(),
                              const StoreComp(),
                              const StoreComp(),
                              const StoreComp()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 60,
                    child: CustomAppBar(
                      bottom: ValueNotifier(
                        CustomTabBar(
                          controller: tabController,
                          tabs: [
                            ...tabsData.map((e) => InkWell(
                              onTap: () {
                                tabController.animateTo(tabsData.indexOf(e));
                              },
                              child: Tab(
                                icon: Text(e,
                                    style: TextStyles.blackButtonBoldW700),
                              ),
                            )),
                          ],
                        ),
                      ),
                      bottomEmable: ValueNotifier<bool>(true),
                      enabled: MainStances.enableAppBar,
                      leadingIconAnimatedState: MainStances.customAppBarStateLeading,
                      scaffoldKey: scaffoldKey,
                    ),
                  ),
                ),
              ],
            )),
        bottomNavigationBar: buttonNavBar(),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class SearchTextField extends StatefulWidget {
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _animationController!.forward();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedBuilder(
          animation: _animationController!,
          builder: (context, child) {
            return AnimatedOpacity(
              opacity: _animation!.value,
              duration: Duration(milliseconds: 500),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Pesquisar',
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.grey[200],
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                onChanged: (value) {
                  // Faça algo com o valor da pesquisa
                  print('Valor da pesquisa: $value');
                },
              ),
            );
          }),
    );
  }
}


