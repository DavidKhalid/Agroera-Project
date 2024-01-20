import 'package:flutter/material.dart';

class loginControllerCustomer {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void dispose() {
    emailC.dispose();
    passwordC.dispose();
  }
}
