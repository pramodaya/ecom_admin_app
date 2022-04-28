import 'package:flutter/material.dart';

import '../../../components/product_cart.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(padding: EdgeInsets.all(5),
          child: Row(
            children : [
                            ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular) {
                    return ProductCard(product: demoProducts[index]);
                  }

                  return const SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ]
          ),
          )
        )
      ],
    );
  }
}





// SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [

              

//               ...List.generate(
//                 demoProducts.length,
//                 (index) {
//                   if (demoProducts[index].isPopular) {
//                     return ProductCard(product: demoProducts[index]);
//                   }

//                   return const SizedBox
//                       .shrink(); // here by default width and height is 0
//                 },
//               ),
//               SizedBox(width: getProportionateScreenWidth(20)),
//             ],
//           ),
//         )