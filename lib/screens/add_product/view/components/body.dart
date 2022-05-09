import 'package:ecom_admin_app/screens/add_product/view_model/add_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../components/default_button.dart';
import '../../../../models/Product.dart';
import '../../../../size_config.dart';
import 'color_dots.dart';
import 'add_product_description.dart';
import 'top_rounded_container.dart';
import 'add_product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddProductViewModel addProductViewModel = context.watch<AddProductViewModel>();
    return ListView(
      children: [
       ProductImages(product: product) ,
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              AddProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              Column(
                children: [
                  // ColorDots(product: product),
                  TopRoundedContainer(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.15,
                        right: SizeConfig.screenWidth * 0.15,
                        bottom: getProportionateScreenWidth(40),
                        top: getProportionateScreenWidth(15),
                      ),
                      child: DefaultButton(
                        text: "Save Product",
                        press: () async{
                          addProductViewModel.saveProduct(context);
                        },
                      
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}



