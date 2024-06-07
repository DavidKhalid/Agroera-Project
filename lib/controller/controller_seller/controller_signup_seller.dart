import 'package:agroera_project/seller/login_page_seller/login_page_seller.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signupControllerSeller {
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void dispose() {
    usernameC.dispose();
    emailC.dispose();
    passwordC.dispose();
  }

  var _firebaseFirestore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  void signupseller(String username, String email, String password,
      BuildContext context) async {
    var sellers = _firebaseFirestore.collection("sellers");
    if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      //execution block code
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final materialBanner = MaterialBanner(
          elevation: 0,
          backgroundColor: Colors.transparent,
          forceActionsBelow: true,
          content: AwesomeSnackbarContent(
            title: "Succes",
            message: "congratulation sign up success",
            contentType: ContentType.success,
            inMaterialBanner: true,
          ),
          actions: const [SizedBox.shrink()],
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentMaterialBanner()
          ..showMaterialBanner(materialBanner);

        var uid = credential.user?.uid;

        sellers.doc(uid).set({
          "username": username,
          "password": password,
          "email": email,
          "uid": uid,
          "role": "seller",
          "profile": "",
          "status": "don't have a store",
          "storeName": "",
          "addressStore": "",
          "storeDescription" : "",
          "storeImage" : "",
          "createAt": DateTime.now().toIso8601String(),
        });

        Navigator.pushReplacementNamed(context, LoginPageSeller.nameRoutes);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      final materialBanner = MaterialBanner(
        elevation: 0,
        backgroundColor: Colors.transparent,
        forceActionsBelow: true,
        content: AwesomeSnackbarContent(
          title: "Failed",
          message: "username, email, and password cannot be empty",
          contentType: ContentType.failure,
          inMaterialBanner: true,
        ),
        actions: const [SizedBox.shrink()],
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentMaterialBanner()
        ..showMaterialBanner(materialBanner);
    }
  }
}
