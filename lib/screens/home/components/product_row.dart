import 'package:ecom_admin_app/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../components/product_cart.dart';

class ProductRow extends StatelessWidget {

  final Product product1;
  final Product? product2;

  const ProductRow({ 
    Key? key ,
    required this.product1,
    this.product2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ProductCard(product: product1,)),
        Expanded(child:  (product2!=null)? ProductCard(product: product2!): SizedBox()),
      ],
    );
  }
}