import 'package:flutter/material.dart';

class signupControllerSeller {  
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void dispose() {
    usernameC.dispose();
    emailC.dispose();
    passwordC.dispose();
  }
}
