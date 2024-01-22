import 'dart:ui';

import 'package:agroera_project/models/model_category_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPageCustomer extends StatefulWidget {
  static const nameRoutes = "MainPageCustomer";
  MainPageCustomer({super.key});

  @override
  State<MainPageCustomer> createState() => _MainPageCustomerState();
}

class _MainPageCustomerState extends State<MainPageCustomer> {
  int indexbuttomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;

    List<dynamic> pageView = [
      SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    "Selamat Datang",
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "Temukan Yang Anda Butuhkan",
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.black45,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                    // bottom: 5,
                    top: 100,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: mediaqueryHeight,
                      width: mediaqueryWidth,
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text("Search"),
                          hintText: "temukan kebutuhan anda",
                          hintStyle: GoogleFonts.roboto(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            Positioned(
              top: 200,
              bottom: 5,
              left: 5,
              right: 5,
              child: ListView.builder(
                itemCount: categoryProduct.length,
                itemBuilder: (context, index) {
                  final CategoryProduct categoryproduct =
                      categoryProduct[index];
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        height: mediaqueryHeight / 6,
                        width: mediaqueryWidth,
                        child: Align(
                            alignment: Alignment.center,
                            child: ShaderMask(
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  colors: [Colors.black, Colors.black],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds);
                              },
                              child: Text(
                                categoryproduct.name.toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white
                                    // gradien
                                    ),
                              ),
                            )),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    categoryproduct.image.toString())),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.amber, width: 2)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      Center(child: Text("Shopping cart page")), // shopping cart
      Center(child: Text("profile page")), // profiel page
    ];

    return Scaffold(
      body: pageView[indexbuttomNavigationBar],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexbuttomNavigationBar,
        items: [
          BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.shoppingCart), label: "Shopping Cart"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user), label: "Profile"),
        ],
        onTap: (value) {
          setState(() {
            print(value);
            indexbuttomNavigationBar = value;
          });
        },
      ),
    );
  }
}
