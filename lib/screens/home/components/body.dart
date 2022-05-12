import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../components/product_cart.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  List<Product> firebaselist = [];
  List<Widget> productList = [];
  List<Widget> rowList = [];
  List<ProductCard> productCardList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: 
      // CustomScrollView(
      //   primary: false,
      //   slivers: <Widget>[
      //     SliverPadding(
      //       padding: const EdgeInsets.all(20.0),
      //       sliver: SliverGrid.count(
      //         crossAxisSpacing: 10.0,
      //         crossAxisCount: 2,
      //         children: <Widget>[
      //           // ..rowList.map((e) {return e;}
      //           // ...     _getProductList().map((e){ return e; })
      //           _getProductList()
      //         ]
      //           ,
      //       ),
      //     ),
      //   ],
      // ),


      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            // // SpecialOffers(),
            // // SizedBox(height: getProportionateScreenWidth(30)),
            
            // SizedBox(height: getProportionateScreenWidth(30)),
             _getProductList(),
          ],
        ),
      ),
    );
  }

  Widget _getProductList() {
    

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('product').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (!snapshot.hasData) {
          return Text(
               "hellow"
             );
        } else {
          var size = snapshot.data!.docs.length;
          snapshot.data!.docs.forEach((element) {
            Map<String, dynamic> item = element.data() as Map<String, dynamic>;
            List<String>imges = [];
            // item['img'] as List<String>;
            List<dynamic> img = item['img'];
            img.forEach((element) {
              imges.add(element.toString());
             });

            Product p = Product(
                id: "0",
                stockQty: item['stockQty'],
                images: imges,
                colors: [],
                title: item['title'],
                price: item['price'],
                description: item['desc']);
            firebaselist.add(p);
            productCardList.add(ProductCard(product: p));
          });
          return 

            GridView.builder(
              itemCount: productCardList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              gridDelegate: 
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index){
                return Center(
                  child: productCardList[index],
                );
              },
            );            

        }

      },
      
    );
  }
}
