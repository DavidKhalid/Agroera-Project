import 'package:agroera_project/landing_page/landing_page.dart';
import 'package:agroera_project/seller/login_page_seller/login_page_seller.dart';
import 'package:agroera_project/seller/mainpage_seller/main_page_seller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthServicesSeller {
  FirebaseAuth auth = FirebaseAuth.instance;

  void signupSeller(
    BuildContext context,
    String username,
    String email,
    String password,
  ) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('The password provided is too weak.');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "CONFIRM",
              style: GoogleFonts.alegreya(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Sign Up Succsess",
              style: GoogleFonts.alegreya(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LoginPageSeller.nameRoutes);
                  },
                  child: Text("Yes"))
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "CONFIRM",
                style: GoogleFonts.alegreya(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              content: Text(
                "The account already exists for that email.",
                style: GoogleFonts.alegreya(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Yes"))
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void loginSeller(BuildContext context, String email, String password) async {
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
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Login Success",
              style: GoogleFonts.alegreya(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, MainPageSeller.nameRoutes);
                  },
                  child: Text("Yes"))
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "WARNING",
                style: GoogleFonts.alegreya(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              content: Text(
                "Wrong Password",
                style: GoogleFonts.alegreya(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Yes"))
              ],
            );
          },
        );
      }
    }
  }

  void logoutSeller(BuildContext context) async {
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
