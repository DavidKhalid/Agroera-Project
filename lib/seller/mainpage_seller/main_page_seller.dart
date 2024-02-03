import 'package:agroera_project/seller/createpage_store_seller/createpage_store_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPageSeller extends StatefulWidget {
  static const nameRoutes = "MainPageSeller";
  const MainPageSeller({super.key});

  @override
  State<MainPageSeller> createState() => _MainPageSellerState();
}

class _MainPageSellerState extends State<MainPageSeller> {
  int indexbuttomNavigationBar = 0;
  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    List<dynamic> pageView = [
      Center(
        child: Text("Home Page Seller"),
      ),

      // <--- Start Store Page --->
      SafeArea(
        child: Stack(children: [
          _imagestore(),
          _text_haveastore(),
          _button_createstore(mediaqueryHeight, mediaqueryWidth),
        ]),
      ),
      // <--- End Store Page --->

      Center(
        child: Text("Store Order History Seller"),
      ),

      // <--- Start Profile Cart Page --->
      SafeArea(
        child: Stack(
          children: [
            _imageprofile(mediaqueryHeight, mediaqueryWidth),
            Column(
              children: [
                _username(),
                _email(),
              ],
            )
          ],
        ),
      ),
      // <--- End Profile Cart Page --->
    ];
    return Scaffold(
      body: pageView[indexbuttomNavigationBar],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        // elevation: 50,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.black,
        currentIndex: indexbuttomNavigationBar,
        items: [
          BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.fileText), label: "Order History"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user), label: "Profile"),
        ],
        onTap: (value) {
          print("This is $value");
          setState(() {
            indexbuttomNavigationBar = value;
            // value = indexbuttomNavigationBar;
          });
        },
      ),
    );
  }

  //<--- End Store Page --->
  Align _button_createstore(double mediaqueryHeight, double mediaqueryWidth) {
    return Align(
      alignment: Alignment(0, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return CreatePageStoreSeller();
            },
          ));
        },
        child: Container(
          height: mediaqueryHeight / 15,
          width: mediaqueryWidth / 1.5,
          decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              "Create Store",
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align _text_haveastore() {
    return Align(
      alignment: Alignment(0, -0.2),
      child: Text(
        "You Don't Have a Store ?",
        style: GoogleFonts.roboto(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.w800),
      ),
    );
  }

  Positioned _imagestore() {
    return Positioned(
      top: 40,
      left: 50,
      child: Container(
        child: Image(
          height: 300,
          width: 300,
          image: AssetImage("assets/images/store.png"),
        ),
      ),
    );
  }
  // <--- Start Store Page --->

  // <--- End Profile Cart Page --->
  Row _email() {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 20),
          child: Text(
            "Email",
            style: GoogleFonts.roboto(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, right: 20),
          child: Text(
            "example@gmail.com",
            style: GoogleFonts.roboto(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Row _username() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100, left: 20),
          child: Text(
            "Username",
            style: GoogleFonts.roboto(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100, right: 20),
          child: Text(
            "Alberto",
            style: GoogleFonts.roboto(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Container _imageprofile(double mediaqueryHeight, double mediaqueryWidth) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      padding: EdgeInsets.only(top: 5),
      height: mediaqueryHeight / 13,
      width: mediaqueryWidth,
      decoration: BoxDecoration(color: Colors.green.shade800),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage("https://picsum.photos/id/70/200/300"),
        ),
      ),
    );
  }
// <--- Start Profile Cart Page --->
}
