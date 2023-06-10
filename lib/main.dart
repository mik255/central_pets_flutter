import 'package:flutter/material.dart';
import 'app/modules/account/login/account_page_builder.dart';
import 'app/modules/buying_flow/page/store_page.dart';
import 'app/modules/home/home.dart';
import 'mainStances.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MainStances.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home:  const AccountPageBuilder());
  }
}
