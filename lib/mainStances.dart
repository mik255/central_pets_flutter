import 'package:event_driver_arch/data/mapper/user/userMapper.dart';
import 'package:event_driver_arch/data/repository/local/sharedPrefs_impl.dart';
import 'package:event_driver_arch/domain/http/abstract_http.dart';
import 'package:event_driver_arch/domain/repository/local/localRepository.dart';
import 'package:logger/logger.dart';
import 'app/designer_system/organsms/appBar/appBar.dart';
import 'app/designer_system/organsms/buttonNavBar.dart';
import 'app/designer_system/organsms/pageBase.dart';
import 'app/designer_system/organsms/tabBar.dart';
import 'package:flutter/material.dart';

import 'app/models/config.dart';
import 'app/models/user.dart';
import 'data/http_impl/dio_Impl.dart';

class MainStances {
  static ValueNotifier<LeadingState> customAppBarStateLeading = ValueNotifier(LeadingState.menu);
  static ValueNotifier<bool> customAppBarStateBottonEmable = ValueNotifier(false);
  static ValueNotifier<bool> enableAppBar = ValueNotifier(false);
  static final pageController = PageBaseController(PageBaseState(index: 0));
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final mainScaffoldKey = GlobalKey<ScaffoldState>();
  static final IHttpClient httpClient = DioImpl(
    baseUrl: 'http://demo6271311.mockable.io'
  );
  static late User user;
  static var logger = Logger();
  static late ILocalRepository localRepository;
  static Config config = Config(
    keepConnected: false,
  );
}
