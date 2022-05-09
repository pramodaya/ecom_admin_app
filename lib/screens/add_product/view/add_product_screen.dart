import 'package:ecom_admin_app/screens/add_product/view_model/add_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/Product.dart';
import '../view/components/body.dart';
import '../view/components/custom_app_bar.dart';

class AddProductScreen extends StatelessWidget {
  static String routeName = "/add_product";

  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  AddProductViewModel usersViewModel = context.watch<AddProductViewModel>();

    final AddProductArguments agrs =
        ModalRoute.of(context)!.settings.arguments as AddProductArguments;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.product.rating),
      ),
      body: Body(product: agrs.product),
    );
  }
}

class AddProductArguments {
  final Product product;

  AddProductArguments({required this.product});
}
