import 'package:flutter/material.dart';

class signupControllerCustomer { 
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void dispose() {
    usernameC.dispose();
    emailC.dispose();
    passwordC.dispose();
  }
}
