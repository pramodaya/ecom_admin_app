import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../components/product_cart.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  List<Product> firebaselist = [];
  List<Widget> productList = [];
  List<Widget> rowList = [];

  PopularProducts() {
    // productList = getWidgets(productList);

    // rowList = productList.map((element) {
    //           return element;
    //         }).toList();
    // productList.map((e) => rowList.add(e));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: <Widget>[
              const Text('He\'d have you all unravel at the'),
              const Text('Heed not the rabble'),
              const Text('Sound of screams but the'),
              const Text('Who scream'),
              const Text('Revolution is coming...'),
              const Text('Revolution, they...'),
            ],
          ),
        ),
      ],
    );

    // return SingleChildScrollView(
    //   scrollDirection: Axis.vertical,
    //   padding: EdgeInsets.symmetric(vertical: 10),
    //   child:
    //   _getProductList()
    //   // Column(
    //   //   children: [
    //   //     Padding(
    //   //       padding:
    //   //           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //   //       child: SectionTitle(title: "Popular Products", press: () {}),
    //   //     ),
    //   //     // SizedBox(height: getProportionateScreenWidth(20)),
    //   //     // ...rowList.map((e) {return e;}
    //   //     // ),
    //   //     _getProductList()
    //   //   ],
    //   // ),
    // );
  }

  List<Widget> getWidgets(List<Widget> wlist) {
    var p1 = demoProducts;
    for (int i = 0; i < p1.length - 1; i++) {
      wlist.add(Container(
        alignment: FractionalOffset.center,
        margin: const EdgeInsets.fromLTRB(0, 0, 10, 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProductCard(product: p1[i]),
            ProductCard(product: p1[i + 1]),
          ],
        ),
      ));
    }
    return wlist;
  }

  Widget _getProductList() {
    List<Widget> rowList = [];
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('product').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }
        var size = snapshot.data!.docs.length;
        snapshot.data!.docs.forEach((element) {
          Map<String, dynamic> item = element.data() as Map<String, dynamic>;
          Product p = Product(
              id: "0",
              stockQty: item['stockQty'],
              images: demoProducts[0].images,
              colors: [],
              title: item['title'],
              price: item['price'],
              description: item['desc']);
          firebaselist.add(p);
        });

        return Expanded(
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10),
              itemCount: firebaselist.length,
              padding: EdgeInsets.all(30),
              itemBuilder: (BuildContext context, int index) {
                print("jsdlf sd sjf ldsjf");
                return Container(
                    alignment: FractionalOffset.center,
                    margin: const EdgeInsets.fromLTRB(05, 05, 05, 05),
                    decoration: BoxDecoration(),
                    child: ProductCard(product: firebaselist[index]));
              }),
        );

        // for (int i = 0; i < firebaselist.length-1; i++) {
        //   rowList.add(
        //     Container(
        //       alignment: FractionalOffset.center,
        //       margin: const EdgeInsets.fromLTRB(0, 0, 10, 40.0),
        //       child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: <Widget>[
        //         ProductCard(product: firebaselist[i]),
        //         ProductCard(product: firebaselist[i+1]),

        //       ],
        //           ),
        //     ));
        // }
        //   // rowList = productList.map((element) {
        // //           return element;
        // //         }).toList();
        // return Container(
        //   child: Column(
        //     children: [
        //      ...rowList.map((e) {return e;}),
        //     ],
        //   ),
        // );

        // return ListView.builder(itemCount: snapshot.data!.docs.length,
        //   itemBuilder: (BuildContext context, int index){
        //     Map<String, dynamic> data =
        //               snapshot.data!.docs[index].data() as Map<String, dynamic>;
        //           String title = data["title"];

        //           return Text(
        //             "hell oworld"
        //           );
        //   },
        // );
      },
    );
  }
}
