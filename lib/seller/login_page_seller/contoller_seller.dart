import 'package:flutter/material.dart';

class loginControllerSeller { 
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void dispose() {
    emailC.dispose();
    passwordC.dispose();
  }
}
