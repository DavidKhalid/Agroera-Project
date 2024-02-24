import 'package:agroera_project/customer/main_page_customer.dart/main_page_customer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

//  Stream<User?> streamAuthStatus() { /// cara pertama dalam bentuk function
//     return auth.authStateChanges();
//   }

  Stream<User?> get streamAuthStatus => auth
      .authStateChanges(); // ini cara kedua memakai getter. untuk saat ini cara ini yang di pakai

  void signUp(
    String username,
    String email,
    String password,
  ) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
