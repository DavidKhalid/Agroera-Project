import 'package:flutter/material.dart';

class loginController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void dispose() {
    emailC.dispose();
    passwordC.dispose();
  }
}
