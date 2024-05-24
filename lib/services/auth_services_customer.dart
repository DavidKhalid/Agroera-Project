import 'package:agroera_project/customer/login_page_customer/login_page_customer.dart';
import 'package:agroera_project/customer/main_page_customer.dart/main_page_customer.dart';
import 'package:agroera_project/controller/controller_customer/controller_signup_customer.dart';
import 'package:agroera_project/landing_page/landing_page.dart';
import 'package:agroera_project/seller/mainpage_seller/main_page_seller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  signupControllerCustomer _controllerCustomer = signupControllerCustomer();

//  Stream<User?> streamAuthStatus() { /// cara pertama dalam bentuk function
//     return auth.authStateChanges();
//   }

  Stream<User?> get streamAuthStatus => auth
      .authStateChanges(); // ini cara kedua memakai getter. untuk saat ini cara ini yang di pakai

  void signUp(
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
              "Sign Up Success",
              style: GoogleFonts.alegreya(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    _controllerCustomer.usernameC.clear();
                    _controllerCustomer.emailC.clear();
                    _controllerCustomer.passwordC.clear();
                    Navigator.pushReplacementNamed(
                        context, LoginPageCustomer.nameRoutes);
                  },
                  child: Text("Ok"))
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "WARNING",
                style: GoogleFonts.alegreya(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              content: Text(
                "The account already exists for that email",
                style: GoogleFonts.alegreya(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Ok",
                    ))
              ],
            );
          },
        );
      }
      // else if (e.code == 'username-already-in-use') {
      //   print("username telah digunakan");
      // } // untuk mendaftar menggunakan username yang sama untuk akun yang lain
      // belum dapat di solve, mungkin harus menggunakan custom auth pada firebase
    } catch (e) {
      print(e);
    }
  }

  void login(
    BuildContext context,
    String email,
    String password,
  ) async {
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
                    _controllerCustomer.emailC.clear();
                    _controllerCustomer.passwordC.clear();
                    // Navigator.of(context).pop();
                    Navigator.pushReplacementNamed(
                        context, MainPageCustomer.nameRoutes);
                  },
                  child: Text("Ok"))
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "WARNING",
                style: GoogleFonts.alegreya(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              content: Text(
                "Wrong password",
                style: GoogleFonts.alegreya(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"))
              ],
            );
          },
        );
      }
    }
  }

  void logOut(BuildContext context) async {
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
