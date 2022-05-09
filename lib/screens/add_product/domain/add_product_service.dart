import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_admin_app/models/Product.dart';
import 'package:ecom_admin_app/user_list/repo/api_status.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

import '../../home/home_screen.dart';

class AddProductService {
  static Future<Object> addProducts() async {
    return "";
  }

  static Future<List<String>> addProductImages(List<File> _images, Uuid _uuid) async {
    // final _firebaseStorage = FirebaseStorage.instance;
    //       Reference storageReference =
    //     FirebaseStorage.instance.ref().child('images/');

    // for (var img in _images){

    //   var x = await Future.wait(uploadFile(img));
    //   var imgUrl = storageReference.getDownloadURL();
    //   print("==========="+imgUrl.toString()+"========");
    // }

    // return imagesUrls;

    var imageUrls =
        await Future.wait(_images.map((_image) => uploadFile(_image, _uuid)));
    return imageUrls;
  }

  static Future<String> uploadFile(File _image, Uuid _uuid) async {
    var x = _uuid;
    String file_name = basename(_image.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('product_images').child('${_uuid.v4()}-${file_name}');
    TaskSnapshot uploadTask = await firebaseStorageRef.putFile(_image);
    String url = await uploadTask.ref.getDownloadURL();

// return await membersCollection.doc(uid).update({ //Update url in Firestore (if required)
//     'displayPhoto': url,
//   });

    // var img = _image;
    // var fileName = (img.path.split('/'). last);
    // print ("\nfile name : " + fileName + " \n");

    // Reference storageReference =
    //     FirebaseStorage.instance.ref().child('images/').child("$fileName");
    // StorageUploadTask uploadTask = storageReference.putFile(_image);
    // var imgUrl = await (await uploadTask).ref.getDownloadURL();
    // print("=================== " + imgUrl + "==========");
    return url;
  }

  static Future<Object?> saveProduct(Product product, BuildContext context) async{
    FirebaseFirestore.instance.collection("product").add(
      {
        'id': product.id,
        'title': product.title,
        'desc': product.description,
        'img' : product.images,
        'price': product.price,
        'stockQty': product.stockQty,
      }
    ).then((value){
       Fluttertoast.showToast(msg: "Successfully Saved");
       Navigator.pushNamed(context, HomeScreen.routeName);
    }
    ).catchError((error){
        Fluttertoast.showToast(msg: "Product Saved Error: "+error.toString());
    });
  }
}
