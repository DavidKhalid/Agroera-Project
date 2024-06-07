import 'dart:ffi';
import 'dart:io';

import 'package:agroera_project/models/model_category_product.dart';
import 'package:agroera_project/seller/addproduct_seller/addpage_productseller.dart';
import 'package:agroera_project/seller/mainpage_seller/main_page_seller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddProductSeller {
  TextEditingController productnameC = TextEditingController();
  //  final DropdownSearchController _dropdownSearchController = DropdownSearchController();
  TextEditingController priceC = TextEditingController();
  TextEditingController productdescriptionC = TextEditingController();

  void dispose() {
    productnameC.dispose();
    // categoryproductC.dispose();
    priceC.dispose();
    productdescriptionC.dispose();
  }

  // String? firstImageUrl;
  // String? secondImageUrl;

  Stream<DocumentSnapshot<Object?>> streamProductSeller() async* {
    String? uid = _auth.currentUser?.uid;
    CollectionReference collectionreferenceSeller =
        _firebaseFirestore.collection("product");

    yield* collectionreferenceSeller.doc(uid).snapshots();
    // }
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  void submitAddProduct(
    String productname,
    String categoryproduct,
    String price,
    String productdescription,
    // String? firstImageUrl,
    // String? secondImageUrl,
    BuildContext context,
  ) {
    var productReference = _firebaseFirestore.collection("product");
    var uid = _auth.currentUser?.uid;
    if (productname.isNotEmpty &&
            categoryproduct.isNotEmpty &&
            price.isNotEmpty &&
            productdescription.isNotEmpty
        // &&
        // firstImageUrl != null &&
        // secondImageUrl != null
        ) {
      //semua blok code dibawah ini akan dijalankan
      productReference.doc(uid).set({
        "productname": productname,
        "price": price,
        "categoryproduct": categoryproduct,
        "productdescription": productdescription,
        "firstimageproduct": "",
        "secondimageproduct": "",
        "createAt": DateTime.now().toIso8601String(),
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Berhasil upload product")));
      Navigator.pushReplacementNamed(context, MainPageSeller.nameRoutes);
    } else {
      //jika semua form pengisian kosong, code ini yang akan dijalankan
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("All forms must be filled out")));
    }
  }
}
