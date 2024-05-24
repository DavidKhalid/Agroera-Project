import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MainPageCustomerController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>>streamUser()async* {
    // String uid = _auth.currentUser!.uid;
    // yield* _firebaseFirestore.collection("customer").doc(uid).snapshots();
    // String? uid = credential.user?.uid;
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user != null) {
    //     print(user.uid);
    //   }
    // });
    String uid=_auth.currentUser!.uid;
    CollectionReference customers = _firebaseFirestore.collection("customers");
    customers.doc(uid);
    yield* _firebaseFirestore.collection("customers").doc(uid).snapshots();
  }
}
