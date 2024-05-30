import 'dart:math';

import 'package:agroera_project/customer/login_page_customer/login_page_customer.dart';
import 'package:agroera_project/landing_page/landing_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class signupControllerCustomer {
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void dispose() {
    usernameC.dispose();
    emailC.dispose();
    passwordC.dispose();
  }

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void signupcustomer(String username, String email, String password,
      BuildContext context) async {
    CollectionReference customer = _firebaseFirestore.collection("customers");

    // try {
    //   customer.add({
    //     "username": username,
    //     "email": email,
    //     "password": password,
    //   });
    //   print("Done add customer");
    // } catch (e) {
    //   print(e);
    // }

    if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      //eksekusi code
      try {
        final credential = await auth.createUserWithEmailAndPassword(
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

        String? uid = credential.user?.uid;

        _firebaseFirestore.collection("customers").doc(uid).set({
          "username": username,
          "password": password,
          "email": email,
          "uid": uid,
          "role": "customer",
          "profile" : "",
          "createAt": DateTime.now().toIso8601String()
        });

        Navigator.pushReplacementNamed(context, LoginPageCustomer.nameRoutes);

        print("This is $credential");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          final materialBanner = MaterialBanner(
            elevation: 0,
            backgroundColor: Colors.transparent,
            forceActionsBelow: true,
            content: AwesomeSnackbarContent(
                title: "Failed",
                message: "weak-password",
                contentType: ContentType.failure),
            actions: const [SizedBox.shrink()],
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showMaterialBanner(materialBanner);
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          final materialBanner = MaterialBanner(
            elevation: 0,
            backgroundColor: Colors.transparent,
            forceActionsBelow: true,
            content: AwesomeSnackbarContent(
                title: "Failed",
                message: "The account already exists for that email.failed",
                contentType: ContentType.failure),
            actions: const [SizedBox.shrink()],
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showMaterialBanner(materialBanner);
        }
      } catch (e) {
        print(e);
        final materialBanner = MaterialBanner(
          elevation: 0,
          backgroundColor: Colors.transparent,
          forceActionsBelow: true,
          content: AwesomeSnackbarContent(
              title: "Failed",
              message: "cant's sign up",
              contentType: ContentType.failure),
          actions: const [SizedBox.shrink()],
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentMaterialBanner()
          ..showMaterialBanner(materialBanner);
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

  void logOutcustomer(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "CONFIRM",
            style: GoogleFonts.alegreya(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Logout Success",
            style: GoogleFonts.alegreya(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, LandingPage.nameRoutes);
                },
                child: Text("Yes"))
          ],
        );
      },
    );
  }
}
