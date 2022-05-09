import 'package:ecom_admin_app/screens/add_product/view_model/add_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/Product.dart';
import '../view/components/body.dart';
import '../view_model/order_view_model.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = "/order";

  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  OrderViewModel usersViewModel = context.watch<OrderViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBar(),
      ),
      body: Body(),
    );
  }
}
