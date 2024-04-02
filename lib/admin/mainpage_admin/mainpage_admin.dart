import 'package:agroera_project/admin/datacustomer/datacustomer.dart';
import 'package:agroera_project/admin/dataseller/dataseller.dart';
import 'package:agroera_project/services/auth_service_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminPage extends StatefulWidget {
  static const nameRoutes = "AdminPage";

  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int indexbuttomNavigationBar = 0;
  AuthServiceAdmin _authServiceAdmin = AuthServiceAdmin();

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;

    List pageView = [
      SafeArea(
        child: Stack(
          children: [
            _appbaradmin(mediaqueryWidth),
            _appbarcontent(mediaqueryHeight, mediaqueryWidth),
            _datacustomer(),
            _dataseller(),
            _datarequest(),
          ],
        ),
      ),
      SafeArea(
          child: Stack(
        children: [
          _appbar(mediaqueryWidth),
          _username(),
          _password(),
          Positioned(
            top: 690,
            bottom: 20,
            left: 90,
            right: 90,
            child: GestureDetector(
              onTap: () {
                _authServiceAdmin.logout(context);
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.green.shade800,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Logout",
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ),
        ],
      ))
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.green.shade800,
      //   title: Text(
      //     "Admin",
      //     style: GoogleFonts.alegreya(
      //         fontSize: 25, color: Colors.white, fontWeight: FontWeight.w800),
      //   ),
      // ),
      body: pageView[indexbuttomNavigationBar],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green.shade800,
        currentIndex: indexbuttomNavigationBar,
        items: [
          BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user), label: "Profile"),
        ],
        onTap: (value) {
          print("this is $value");
          setState(() {
            indexbuttomNavigationBar = value;
          });
        },
      ),
    );
  }

  /// ------> End Profile Admin <------ ///
  Align _password() {
    return Align(
      alignment: Alignment(0, -0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Password",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Admin",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }

  Align _username() {
    return Align(
      alignment: Alignment(0, -0.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Email",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Admin",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }

  Container _appbar(double mediaqueryWidth) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 60,
      width: mediaqueryWidth,
      color: Colors.green.shade800,
      child: Text(
        "Admin",
        style: GoogleFonts.alegreya(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.w900),
      ),
    );
  }

  /// ------> Start Profie Admin <------ ///

  /// ------> End Home Admin <------ ///
  Align _appbarcontent(double mediaqueryHeight, double mediaqueryWidth) {
    return Align(
      alignment: Alignment(0, -0.8),
      child: Container(
        height: mediaqueryHeight / 5,
        width: mediaqueryWidth,
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          image: DecorationImage(
            scale: 4,
            image: AssetImage("assets/images/logomainpageadmin.png"),
          ),
        ),
      ),
    );
  }

  Container _appbaradmin(double mediaqueryWidth) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 60,
      width: mediaqueryWidth,
      color: Colors.green.shade800,
      child: Text(
        "Admin",
        style: GoogleFonts.alegreya(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.w900),
      ),
    );
  }

  Align _datarequest() {
    return Align(
      alignment: Alignment(0, 0.9),
      child: Container(
        height: 200,
        width: 170,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
                spreadRadius: 2,
              )
            ],
            color: Colors.blue.shade100,
            border: Border.all(color: Colors.blue.shade100, width: 2),
            image: DecorationImage(
                alignment: Alignment.topCenter,
                scale: 0.8,
                image: AssetImage("assets/images/logodatarequest.png")),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 80,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.elliptical(20, 20))),
              child: Center(
                child: Text(
                  "Data Request",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align _dataseller() {
    return Align(
      alignment: Alignment(0.8, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return DataSeller();
            },
          ));
        },
        child: Container(
          height: 200,
          width: 170,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                  spreadRadius: 2,
                )
              ],
              color: Colors.blue.shade100,
              border: Border.all(color: Colors.blue.shade100, width: 2),
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  scale: 0.9,
                  image: AssetImage("assets/images/sellerlogo.png")),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 80,
                width: 170,
                decoration: BoxDecoration(
                    color: Colors.green.shade800,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.elliptical(20, 20))),
                child: Center(
                  child: Text(
                    "Data Seller",
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _datacustomer() {
    return Align(
      alignment: Alignment(-0.8, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return DataCustomer();
            },
          ));
        },
        child: Container(
          height: 200,
          width: 170,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                  spreadRadius: 2,
                )
              ],
              color: Colors.blue.shade100,
              border: Border.all(color: Colors.blue.shade100, width: 2),
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  scale: 0.8,
                  image: AssetImage("assets/images/customerlogo.png")),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 80,
                width: 170,
                decoration: BoxDecoration(
                    color: Colors.green.shade800,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.elliptical(20, 20))),
                child: Center(
                  child: Text(
                    "Data Customer",
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ------> Start Home Admin <------ ///
}
