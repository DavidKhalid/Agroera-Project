import 'package:agroera_project/customer/payment_page_customer/payment_page_customer.dart';
import 'package:agroera_project/customer/product_for_customer.dart/product_for_customer.dart';
import 'package:agroera_project/models/model_category_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

final List<CategoryProduct> categoryproduct = categoryProduct;

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
      // <--- Start Home Page --->
      SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textselamatdatang(),
                _texttemukanyangandabutuhkan(),
              ],
            ),
            _search(mediaqueryHeight, mediaqueryWidth),
            _categoryproduct(mediaqueryHeight, mediaqueryWidth)
          ],
        ),
      ),
      // <--- End Home Page >

      SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Text(
              "My Cart",
              style: GoogleFonts.roboto(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.4),
            child: Container(
              height: mediaqueryHeight / 1.5,
              width: mediaqueryWidth,
              //color: Colors.pink.shade300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: mediaqueryHeight / 7,
                        width: mediaqueryWidth,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3))
                            ]),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://picsum.photos/id/1/200/300"))),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    "Product Name",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 40, 0, 10),
                                  child: Text(
                                    "Price",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Total (3 item) :",
                    style: GoogleFonts.alegreya(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Rp. 500.000",
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(PaymentPageCustomer.nameRoutes);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.all(20),
                height: mediaqueryHeight / 15,
                width: mediaqueryWidth,
                decoration: BoxDecoration(
                    color: Colors.green.shade800,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Proceed to Checkout",
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      Icon(
                        FeatherIcons.chevronRight,
                        color: Colors.white,
                        size: 30,
                        weight: 30,
                      )
                    ]),
              ),
            ),
          ),
        ]),
      ),
      // shopping cart
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

  // <--- Start Home Page --->
  Positioned _categoryproduct(double mediaqueryHeight, double mediaqueryWidth) {
    return Positioned(
      top: 200,
      bottom: 5,
      left: 5,
      right: 5,
      child: ListView.builder(
        itemCount: categoryProduct.length,
        itemBuilder: (context, index) {
          final CategoryProduct categoryproduct = categoryProduct[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProductForCustomer.nameRoutes);
                },
                child: Container(
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
                          categoryproduct.categoryname.toString(),
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
                          image: AssetImage(categoryproduct.image.toString())),
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: Colors.green.shade800, width: 2)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }

  Stack _search(double mediaqueryHeight, double mediaqueryWidth) {
    return Stack(
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
    );
  }

  Padding _texttemukanyangandabutuhkan() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Text(
        "Temukan Yang Anda Butuhkan",
        style: GoogleFonts.roboto(
            fontSize: 14, color: Colors.black45, fontWeight: FontWeight.w900),
      ),
    );
  }

  Padding _textselamatdatang() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Text(
        "Selamat Datang",
        style: GoogleFonts.roboto(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900),
      ),
    );
  }
  // <--- End Home Page --->
}
