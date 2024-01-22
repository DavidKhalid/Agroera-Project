import 'package:agroera_project/seller/mainpage_seller.dart/main_page_seller.dart';
import 'package:agroera_project/seller/signup_page_seller/signup_page_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageSeller extends StatelessWidget {
  static const nameRoutes = "LoginPageSeller";
  const LoginPageSeller({super.key});

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
          _inputpassword(),
          _buttonlogin(context, mediaqueryHeight, mediaqueryWidth),
          _bottomtext(context)
        ],
      ),
    );
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
            "Belum punya akun?",
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
              Navigator.of(context).pushNamed(SignupPageSeller.nameRoutes);
            },
            child: Text(
              "Sign Up",
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

  Positioned _buttonlogin(
      BuildContext context, double mediaqueryHeight, double mediaqueryWidth) {
    return Positioned(
        top: 730,
        bottom: 80,
        left: 20,
        right: 20,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(MainPageSeller.nameRoutes);
          },
          child: Container(
            height: mediaqueryHeight / 15,
            width: mediaqueryWidth,
            decoration: BoxDecoration(
                color: Colors.green.shade800,
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                "LOGIN",
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
      top: 470,
      child: TextField(
        obscureText: true,
        //controller: passwordController,
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
      top: 400,
      //margin: EdgeInsets.symmetric(horizontal: 60),
      child: TextField(
        //controller: emailController,
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
        "Welcome Seller !",
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
