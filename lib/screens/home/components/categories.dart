import 'package:ecom_admin_app/screens/add_product/view/add_product_screen.dart';
import 'package:ecom_admin_app/screens/category/view/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../../user_list/views/home_scree.dart';
import '../../authantication/sign_up/sign_up_screen.dart';
import '../../cart/cart_screen.dart';
import '../../order/view/order_screen.dart';

class Categories extends StatelessWidget {

  Product emptyProduct = getEmptyProduct();
  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> categories = [
      // {
      //   "icon": Icons.category_outlined,
      //   "text": "Category",
      //   "screen": "category"
      // },
      {"icon": Icons.production_quantity_limits, "text": "Product", "screen": "product"},
       {"icon": Icons.bento_outlined, "text": "Order", "screen": "order"},
      // {
      //   "icon": Icons.local_offer_outlined,
      //   "text": "Offres",
      //   "screen": "offers"
      // },
      // {
      //   "icon": Icons.folder_special_outlined,
      //   "text": "Special Offers",
      //   "screen": "specialoffers"
      // },
      // {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: Icon(
              categories[index]["icon"],
              color: Colors.pink,
              size: getProportionateScreenWidth(26),
            ),
            text: categories[index]["text"],
            press: () {
              switch (categories[index]["screen"]) {
                case "category":
                  Navigator.pushNamed(context, CategoryScreen.routeName);
                  break;
                case "product":
                  Navigator.pushNamed(context, AddProductScreen.routeName,
                      arguments: AddProductArguments(product: emptyProduct)
                      );
                  break;
                case "offers":
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                  break;
                case "specialoffers":
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                  break;
                case "order": 
                  Navigator.pushNamed(context, OrderScreen.routeName);
              }
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final Icon? icon;
  final String? text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(80),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: icon,
              // child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
