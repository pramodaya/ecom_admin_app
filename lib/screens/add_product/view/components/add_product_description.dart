import 'package:ecom_admin_app/components/custom_material_icon.dart';
import 'package:ecom_admin_app/screens/add_product/view_model/add_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_surfix_icon.dart';
import '../../../../constants.dart';
import '../../../../models/Product.dart';
import '../../../../size_config.dart';

class AddProductDescription extends StatefulWidget {
  const AddProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  State<AddProductDescription> createState() => _AddProductDescriptionState();
}

class _AddProductDescriptionState extends State<AddProductDescription> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AddProductViewModel addProductViewModel =
        context.watch<AddProductViewModel>();
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(4), 0,
            getProportionateScreenWidth(4), 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            //   child: Text(
            //     widget.product.title,
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Container(
            //     padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            //     width: getProportionateScreenWidth(64),
            //     decoration: BoxDecoration(
            //       color:
            //           widget.product.isFavourite ? const Color(0xFFFFE6E6) : const Color(0xFFF5F6F9),
            //       borderRadius: const BorderRadius.only(
            //         topLeft: Radius.circular(20),
            //         bottomLeft: Radius.circular(20),
            //       ),
            //     ),
            //     child: SvgPicture.asset(
            //       "assets/icons/Heart Icon_2.svg",
            //       color:
            //           widget.product.isFavourite ? const Color(0xFFFF4848) : const Color(0xFFDBDEE4),
            //       height: getProportionateScreenWidth(16),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: getProportionateScreenWidth(20),
            //     right: getProportionateScreenWidth(64),
            //   ),
            //   child: Text(
            //     widget.product.description,
            //     maxLines: 3,
            //   ),
            // ),

            buildProductTitleFormField(context, addProductViewModel),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(2)),
              child: Text(
                widget.product.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildProductDescFormField(context, addProductViewModel),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(2)),
              child: Text(
                widget.product.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildProductPriceFormField(context, addProductViewModel),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(2)),
              child: Text(
                widget.product.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildProductStockQtyFormField(context, addProductViewModel),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(2)),
              child: Text(
                widget.product.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: getProportionateScreenWidth(20),
            //     vertical: 10,
            //   ),
            //   child: GestureDetector(
            //     onTap: () {},
            //     child: Row(
            //       children: const [
            //         Text(
            //           "See More Detail",
            //           style: TextStyle(
            //               fontWeight: FontWeight.w600, color: kPrimaryColor),
            //         ),
            //         SizedBox(width: 5),
            //         Icon(
            //           Icons.arrow_forward_ios,
            //           size: 12,
            //           color: kPrimaryColor,
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

TextFormField buildProductTitleFormField(
    BuildContext context, AddProductViewModel vm) {
  return TextFormField(
    keyboardType: TextInputType.text,
    onChanged: (value) async {
      // if (value.isNotEmpty) {
      //   removeError(error: kEmailNullError);
      // } else if (emailValidatorRegExp.hasMatch(value)) {
      //   removeError(error: kInvalidEmailError);
      // }
      // return null;
      vm.setProductTitle(value);
    },
    validator: (value) {
      // if (value!.isEmpty) {
      //   addError(error: kEmailNullError);
      //   return "";
      // } else if (!emailValidatorRegExp.hasMatch(value)) {
      //   addError(error: kInvalidEmailError);
      //   return "";
      // }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "Title",
      hintText: "Enter product title",
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: CustomMaterialIcon(icon: Icons.title,),
    ),
  );
}

TextFormField buildProductDescFormField(
    BuildContext context, AddProductViewModel vm) {
  return TextFormField(
    keyboardType: TextInputType.multiline,
    minLines: 3,
    maxLines: 10,
    onChanged: (value) async {
      // if (value.isNotEmpty) {
      //   removeError(error: kEmailNullError);
      // } else if (emailValidatorRegExp.hasMatch(value)) {
      //   removeError(error: kInvalidEmailError);
      // }
      // return null;
      vm.setProductDescription(value);
    },
    validator: (value) {
      // if (value!.isEmpty) {
      //   addError(error: kEmailNullError);
      //   return "";
      // } else if (!emailValidatorRegExp.hasMatch(value)) {
      //   addError(error: kInvalidEmailError);
      //   return "";
      // }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "Description",
      hintText: "Enter product description",
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: CustomMaterialIcon( icon: Icons.description),
    ),
  );
}

TextFormField buildProductPriceFormField(
    BuildContext context, AddProductViewModel vm) {
  return TextFormField(
    keyboardType: TextInputType.number,
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)'))
    ],
    onChanged: (value) async {
      // if (value.isNotEmpty) {
      //   removeError(error: kEmailNullError);
      // } else if (emailValidatorRegExp.hasMatch(value)) {
      //   removeError(error: kInvalidEmailError);
      // }
      // return null;
      vm.setProductPrice(double.parse(value));
    },
    validator: (value) {
      // if (value!.isEmpty) {
      //   addError(error: kEmailNullError);
      //   return "";
      // } else if (!emailValidatorRegExp.hasMatch(value)) {
      //   addError(error: kInvalidEmailError);
      //   return "";
      // }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "Price",
      hintText: "Enter product price",
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: CustomMaterialIcon(icon: Icons.price_change)
    ),
  );
}

TextFormField buildProductStockQtyFormField(
    BuildContext context, AddProductViewModel vm) {
  return TextFormField(
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    onChanged: (value) async {
      // if (value.isNotEmpty) {
      //   removeError(error: kEmailNullError);
      // } else if (emailValidatorRegExp.hasMatch(value)) {
      //   removeError(error: kInvalidEmailError);
      // }
      // return null;
      vm.setProductStockQty(int.parse(value));
    },
    validator: (value) {
      // if (value!.isEmpty) {
      //   addError(error: kEmailNullError);
      //   return "";
      // } else if (!emailValidatorRegExp.hasMatch(value)) {
      //   addError(error: kInvalidEmailError);
      //   return "";
      // }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "Stock Qty",
      hintText: "Enter product stock quantity",
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: CustomMaterialIcon(icon: Icons.production_quantity_limits,),
    ),
  );
}
