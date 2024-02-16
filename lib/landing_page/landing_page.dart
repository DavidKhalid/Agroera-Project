import 'package:agroera_project/admin/mainpage_admin/mainpage_admin.dart';
import 'package:agroera_project/customer/signup_page_customer.dart/signup_page_customer.dart';
import 'package:agroera_project/seller/signup_page_seller/signup_page_seller.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(SignupPageCustomer.nameRoutes);
                    },
                    child: Container(
                      height: mediaqueryHeight / 6,
                      width: mediaqueryWidth / 2.2,
                      decoration: BoxDecoration(
                          color: Colors.white.withAlpha(100),
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          Image(
                              image:
                                  AssetImage("assets/images/customerlogo.png")),
                          _signupcustomer(
                              context, mediaqueryHeight, mediaqueryWidth)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(SignupPageSeller.nameRoutes);
                    },
                    child: Container(
                      height: mediaqueryHeight / 6,
                      width: mediaqueryWidth / 2.2,
                      decoration: BoxDecoration(
                          color: Colors.white.withAlpha(100),
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          Image(
                              height: 80,
                              image:
                                  AssetImage("assets/images/sellerlogo.png")),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            //  margin: EdgeInsets.only(left: 30, right: 30),
                            height: mediaqueryHeight / 30,
                            width: mediaqueryWidth / 2.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.shade100.withAlpha(230)),
                            child: Center(
                                child: Text(
                              "SIGN UP FOR CELLERS",
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: Colors.green.withAlpha(230),
                                  fontWeight: FontWeight.w900),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          _admin(context, mediaqueryHeight, mediaqueryWidth)
        ],
      ),
    );
  }

  Align _admin(
      BuildContext context, double mediaqueryHeight, double mediaqueryWidth) {
    return Align(
      alignment: Alignment(1, -0.88),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(AdminPage.nameRoutes);
        },
        child: Container(
          height: mediaqueryHeight / 15,
          width: mediaqueryWidth / 8,
          decoration: BoxDecoration(
              //color: Colors.amber,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/logoadmin.png"))),
        ),
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

  InkWell _signupcustomer(
      BuildContext context, double mediaqueryHeight, double mediaqueryWidth) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SignupPageCustomer.nameRoutes);
      },
      child: Container(
        //  margin: EdgeInsets.only(left: 30, right: 30),
        height: mediaqueryHeight / 30,
        width: mediaqueryWidth / 2.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade100.withAlpha(230)),
        child: Center(
            child: Text(
          "SIGN UP FOR CUSTOMERS",
          style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.green.withAlpha(230),
              fontWeight: FontWeight.w900),
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
