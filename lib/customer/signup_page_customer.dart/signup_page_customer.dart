import 'package:agroera_project/customer/login_page_customer/login_page_customer.dart';
import 'package:agroera_project/customer/main_page_customer.dart/main_page_customer.dart';
import 'package:agroera_project/customer/signup_page_customer.dart/controller_customer.dart';
// import 'package:agroera_project/customer/main_page_customer.dart/main_page_customer.dart';
// import 'package:agroera_project/customer/signup_page_customer.dart/controller_customer.dart';
import 'package:agroera_project/services/auth_services_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPageCustomer extends StatelessWidget {
  static const nameRoutes = "SignupPageCustomer";
  // signupControllerCustomer signupC = signupControllerCustomer();
  signupControllerCustomer _signupcontrollerCustomer =
      signupControllerCustomer();
  AuthServices _authServices = AuthServices();
  //

  SignupPageCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _logoapp(mediaqueryHeight, mediaqueryWidth),
            _welcometext(),
            _pleaselogintext(),
            _inputemail(),
            _inputusername(),
            _inputpassword(),
            _buttonsignup(context, mediaqueryHeight, mediaqueryWidth),
            _bottomtext(context)
          ],
        ));
  }

  Positioned _bottomtext(BuildContext context) {
    return Positioned(
      top: 820,
      left: 110,
      bottom: 5,
      right: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sudah punya akun?",
            style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () {
              // Navigator.of(context).pushNamed(LoginPageCustomer.nameRoutes);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LoginPageCustomer();
                },
              ));
            },
            child: Text(
              "Login",
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buttonsignup(
      BuildContext context, double mediaqueryHeight, double mediaqueryWidth) {
    return Positioned(
        top: 730,
        bottom: 80,
        left: 20,
        right: 20,
        child: InkWell(
          onTap: () {
            _authServices.signUp(
                context,
                _signupcontrollerCustomer.usernameC.text,
                _signupcontrollerCustomer.emailC.text,
                _signupcontrollerCustomer.passwordC.text);
          },
          child: Container(
            height: mediaqueryHeight / 15,
            width: mediaqueryWidth,
            decoration: BoxDecoration(
                color: Colors.green.shade800,
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                "SIGN UP",
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ));
  }

  Positioned _inputpassword() {
    return Positioned(
      left: 30,
      right: 65,
      top: 510,
      child: TextField(
        obscureText: true,
        controller: _signupcontrollerCustomer.passwordC,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9!@#\$%^&*().]'))
        ],
        decoration: const InputDecoration(
          icon: Icon(FeatherIcons.mail, color: Colors.grey),
          hintText: "PASSWORD",
          border: UnderlineInputBorder(),
          hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal),
        ),
      ),
    );
  }

  Positioned _inputemail() {
    return Positioned(
      left: 30,
      right: 65,
      top: 440,
      //margin: EdgeInsets.symmetric(horizontal: 60),
      child: TextField(
        controller: _signupcontrollerCustomer.emailC,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9!@#\$%^&*().]'))
        ],
        decoration: const InputDecoration(
          icon: Icon(FeatherIcons.user, color: Colors.grey),
          hintText: "EMAIL",
          border: UnderlineInputBorder(),
          hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal),
        ),
      ),
    );
  }

  Positioned _inputusername() {
    return Positioned(
      left: 30,
      right: 65,
      top: 380,
      child: TextField(
        obscureText: false,
        controller: _signupcontrollerCustomer.usernameC,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9!@#\$%^&*().]'))
        ],
        decoration: const InputDecoration(
          icon: Icon(FeatherIcons.mail, color: Colors.grey),
          hintText: "USERNAME",
          border: UnderlineInputBorder(),
          hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal),
        ),
      ),
    );
  }

  Positioned _pleaselogintext() {
    return Positioned(
      top: 330,
      left: 20,
      child: Text(
        "please login or sign up to continue our app",
        style: GoogleFonts.roboto(
            fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }

  Positioned _welcometext() {
    return Positioned(
      top: 300,
      left: 20,
      child: Text(
        "Welcome Customer !",
        style: GoogleFonts.roboto(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Positioned _logoapp(double mediaqueryHeight, double mediaqueryWidth) {
    return Positioned(
      top: 80,
      left: 100,
      child: Container(
        height: mediaqueryHeight / 5,
        width: mediaqueryWidth / 2,
        //color: Colors.amber,
        child: Image(
          image: AssetImage("assets/images/logoapp.png"),
        ),
      ),
    );
  }
}
