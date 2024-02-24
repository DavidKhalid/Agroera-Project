import 'package:flutter/material.dart';

class loginControllerAdmin {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void dispose() {
    emailC.dispose();
    passwordC.dispose();
  }
}
