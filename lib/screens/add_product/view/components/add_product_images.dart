// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:ecom_admin_app/components/app_loading.dart';
import 'package:ecom_admin_app/screens/add_product/view_model/add_product_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart';

import '../../../../components/default_button.dart';
import '../../../../models/Product.dart';
import '../../../../constants.dart';
import '../../../../models/Product.dart';
import '../../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    AddProductViewModel addProductViewModel =
        context.watch<AddProductViewModel>();
    List<File> _imgFiles = addProductViewModel.addingImages;
    return _imageUi(addProductViewModel, context);
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }

  _imageUi(AddProductViewModel vm, BuildContext context) {
    if (vm.loading) {
      return AppLoading();
    }
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(320),
          child: AspectRatio(
            aspectRatio: 2,
            child: Hero(
              tag: widget.product.id.toString(),
              // child: (imgFiles.length > 0)
              //     ? Image.file(File(imgFiles[0].path))
              //     : Container(
              //         child: Text("hello world"),
              //       ),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: vm.addingImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(
                        getProportionateScreenWidth(3),
                      ),
                      child: Image.file(
                        File(vm.addingImages[index].path),
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  
            OutlineButton(
              onPressed: () {
                selectImages(vm);
              },
              child: Text("Select Image"),
            )
          ],
        ),
      ],
    );
  }

  void selectImages(AddProductViewModel vm) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowMultiple: true, type: FileType.any, allowCompression: false);
      if (result != null) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        await vm.setAddingImages(files);
        await vm.uploadImages();
      } else {
        print("user cancelled file picker");
      }
    } catch (e) {
      print("error: ----------------------- sdfsd sdfs " + e.toString());
    }
  }
}
