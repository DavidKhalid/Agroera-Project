import 'package:agroera_project/admin/mainpage_admin/mainpage_admin.dart';
import 'package:agroera_project/landing_page/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../seller/mainpage_seller/main_page_seller.dart';

class AuthServiceAdmin {
  FirebaseAuth auth = FirebaseAuth.instance;

  void loginAdmin(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "CONFIRM",
              style: GoogleFonts.alegreya(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            content: Text(
              "Login Success",
              style: GoogleFonts.alegreya(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AdminPage.nameRoutes);
                  },
                  child: Text("Ok"))
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "CONFIRM",
            style: GoogleFonts.alegreya(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          content: Text(
            "Logout Success",
            style: GoogleFonts.alegreya(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, LandingPage.nameRoutes);
                },
                child: Text("Ok"))
          ],
        );
      },
    );
  }
}
