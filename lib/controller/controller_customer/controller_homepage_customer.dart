import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MainPageCustomerController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUserCustomer() async* {
    // String uid = _auth.currentUser!.uid;
    // yield* _firebaseFirestore.collection("customer").doc(uid).snapshots();
    // String? uid = credential.user?.uid;
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user != null) {
    //     print(user.uid);
    //   }
    // });
    String uid = _auth.currentUser!.uid;
    CollectionReference customers = _firebaseFirestore.collection("customers");
    customers.doc(uid);
    yield* _firebaseFirestore.collection("customers").doc(uid).snapshots();
  }

  void updateprofilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);

//       try {
//   await storage.FirebaseStorage.instance. ref(file);
// } on firebase_core.FirebaseException catch (e) {
//   // ...
// }
    } else {
      // User canceled the picker
      print("Membatalkan upload file");
    }
  }
}
