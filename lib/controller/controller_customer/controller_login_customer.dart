import 'package:agroera_project/customer/main_page_customer.dart/main_page_customer.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class loginControllerCustomer {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void dispose() {
    emailC.dispose();
    passwordC.dispose();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  void logincustomer(
      String email, String password, BuildContext context) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      //eksekusi code
      try {
        final credential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        final materialBanner = MaterialBanner(
          elevation: 0,
          backgroundColor: Colors.transparent,
          forceActionsBelow: true,
          content: AwesomeSnackbarContent(
            title: "Succes",
            message: "congratulation login success",
            contentType: ContentType.success,
            inMaterialBanner: true,
          ),
          actions: const [SizedBox.shrink()],
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentMaterialBanner()
          ..showMaterialBanner(materialBanner);
        ;
        Navigator.pushReplacementNamed(context, MainPageCustomer.nameRoutes);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          final materialBanner = MaterialBanner(
            elevation: 0,
            backgroundColor: Colors.transparent,
            forceActionsBelow: true,
            content: AwesomeSnackbarContent(
              title: "Failed",
              message: "no user found that email",
              contentType: ContentType.failure,
              inMaterialBanner: true,
            ),
            actions: const [SizedBox.shrink()],
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showMaterialBanner(materialBanner);
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          final materialBanner = MaterialBanner(
            elevation: 0,
            backgroundColor: Colors.transparent,
            forceActionsBelow: true,
            content: AwesomeSnackbarContent(
              title: "Failed",
              message: "wrong password provide fo that user",
              contentType: ContentType.failure,
              inMaterialBanner: true,
            ),
            actions: const [SizedBox.shrink()],
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showMaterialBanner(materialBanner);
        }
      } catch (e) {
        final materialBanner = MaterialBanner(
          elevation: 0,
          backgroundColor: Colors.transparent,
          forceActionsBelow: true,
          content: AwesomeSnackbarContent(
            title: "Failed",
            message: "An error occurred, unable to log in",
            contentType: ContentType.failure,
            inMaterialBanner: true,
          ),
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
}
