import 'package:flutter/material.dart';

import '../../../components/product_cart.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {

  var p1 = demoProducts;
  List<Widget> productList = [];
  List<Widget> rowList = [];

  PopularProducts(){
    productList = getWidgets(productList);

  
    rowList = productList.map((element) {
              return element;
            }).toList();
  // productList.map((e) => rowList.add(e));
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SectionTitle(title: "Popular Products", press: () {}),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          ...rowList.map((e) {return e;}
          ),
        ],
      ),
    );
  }
}

List<Widget> getWidgets(List<Widget> wlist) {
    var p1 = demoProducts;
    for (int i = 0; i < p1.length-1; i++) {
      wlist.add(
        Container(
          alignment: FractionalOffset.center,
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 40.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProductCard(product: p1[i]),
            ProductCard(product: p1[i+1]),
            
          ],
              ),
        ));
    }
    return wlist;
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