import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_admin_app/models/Product.dart';
import 'package:ecom_admin_app/screens/add_product/domain/add_product_service.dart';
import 'package:ecom_admin_app/screens/order/domain/order_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class OrderViewModel extends ChangeNotifier {
  OrderViewModel() {
    // getOrderList();
  }
  bool _loading = false;
  var list = [];


  List<File> _addingImages = [];

  bool get loading => _loading;


  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  getOrderList() async {
    setLoading(true);
    AsyncSnapshot<QuerySnapshot> snapshot = (await OrderService.getOrderList()) as AsyncSnapshot<QuerySnapshot<Object?>>;
    if(snapshot.hasData){
      list.add(snapshot.data!.docs);
      setLoading(false);
    }
  }

}
