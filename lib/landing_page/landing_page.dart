import 'package:agroera_project/customer/login_page/login_page.dart';
import 'package:agroera_project/customer/signup_page.dart/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  static const nameRoutes = "LandingPage";
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          _background_image(),
          _welcome(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _login(context, mediaqueryHeight, mediaqueryWidth),
              SizedBox(
                height: 15,
              ),
              _signup(context, mediaqueryHeight, mediaqueryWidth),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _background_image() {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.amber,
        image: DecorationImage(
            image: AssetImage(
              "assets/images/landingpage.png",
            ),
            fit: BoxFit.cover),
      ),
    );
  }

  InkWell _login(
      BuildContext context, double mediaqueryHeight, double mediaqueryWidth) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(LoginPage.nameRoutes);
      },
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        height: mediaqueryHeight / 15,
        width: mediaqueryWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Center(
            child: Text(
          "LOGIN",
          style: GoogleFonts.roboto(
              fontSize: 18, color: Colors.green, fontWeight: FontWeight.w900),
        )),
      ),
    );
  }

  InkWell _signup(
      BuildContext context, double mediaqueryHeight, double mediaqueryWidth) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SignupPage.nameRoutes);
      },
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        height: mediaqueryHeight / 15,
        width: mediaqueryWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Center(
            child: Text(
          "SIGN UP",
          style: GoogleFonts.roboto(
              fontSize: 18, color: Colors.green, fontWeight: FontWeight.w900),
        )),
      ),
    );
  }

  Positioned _welcome() {
    return Positioned(
        top: 150,
        left: 120,
        child: Text(
          "Welcome !",
          style: GoogleFonts.roboto(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.w900),
        ));
  }
}
