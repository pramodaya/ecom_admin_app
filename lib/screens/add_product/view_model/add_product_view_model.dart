import 'dart:io';

import 'package:ecom_admin_app/models/Product.dart';
import 'package:ecom_admin_app/screens/add_product/domain/add_product_service.dart';
import 'package:ecom_admin_app/screens/add_product/view/add_product_screen.dart';
import 'package:ecom_admin_app/screens/home/home_screen.dart';
import 'package:ecom_admin_app/user_list/repo/api_status.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class AddProductViewModel extends ChangeNotifier {
  AddProductViewModel() {
  }
  bool _loading = false;
  Product _addingProduct = Product(
    id: Uuid().v4().toString(),
    stockQty: 0,
    images: [],
    colors: [],
    title: "",
    price: 00.00,
    description: "",
    rating: 0.0,
    isFavourite: false,
    isPopular: false,
  );

  List<File> _addingImages = [];

  bool get loading => _loading;
  Product get addingProduct => _addingProduct;
  List<File> get addingImages => _addingImages;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setAddingProduct(Product product) {
    _addingProduct = product;
  }

  setAddingImages(List<File> addingImages) async {
    setLoading(true);
    _addingImages = addingImages;
    setLoading(false);
  }

  setProductTitle(String title) {
    _addingProduct.title = title;
  }

  setProductDescription(String desc) {
    _addingProduct.description = desc;
  }

  setProductPrice(double price) {
    _addingProduct.price = price;
  }

  setProductStockQty(int stockQty) {
    _addingProduct.stockQty = stockQty;
  }
  setProductImages(List<String> images){
    _addingProduct.images = images;
  }

  addProduct() async {
    // validation isValid()
  }

  uploadImages() async {
    var resp = await AddProductService.addProductImages(_addingImages, Uuid())
        .whenComplete(() {   
    }).then((value) => 
      setProductImages(value)
    );
  }

  saveProduct(BuildContext context) async {
    var product = _addingProduct;
    await AddProductService.saveProduct(_addingProduct, context);
  }
}
