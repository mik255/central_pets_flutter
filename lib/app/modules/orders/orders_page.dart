import 'package:event_driver_arch/app/designer_system/organsms/card_banner.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(child: Text('OrdersPage')),
          ],
        ),
      ),
    );
  }
}
