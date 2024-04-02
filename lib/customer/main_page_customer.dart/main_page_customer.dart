import 'package:agroera_project/customer/login_page_customer/login_page_customer.dart';
import 'package:agroera_project/customer/payment_page_customer/payment_page_customer.dart';
import 'package:agroera_project/customer/product_for_customer.dart/product_for_customer.dart';
import 'package:agroera_project/models/model_category_product.dart';
import 'package:agroera_project/services/auth_services_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../deliverypage_status_customer/deliverypage_status_customer.dart';

final List<CategoryProduct> categoryproduct = categoryProduct;

class MainPageCustomer extends StatefulWidget {
  static const nameRoutes = "MainPageCustomer";

  MainPageCustomer({super.key});

  @override
  State<MainPageCustomer> createState() => _MainPageCustomerState();
}

class _MainPageCustomerState extends State<MainPageCustomer> {
  int indexbuttomNavigationBar = 0;
  AuthServices _authServices = AuthServices();

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

      // <--- Start History Page --->
      SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Delivery Status",
                style: GoogleFonts.roboto(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.7),
              child: Container(
                height: mediaqueryHeight / 4,
                width: mediaqueryWidth,
                decoration: BoxDecoration(
                  //color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Card(
                  color: Colors.grey.shade100,
                  elevation: 10,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: RichText(
                            text: TextSpan(
                                text: "Order ID : ",
                                style: GoogleFonts.alegreya(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                              TextSpan(
                                text: "12345678",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100),
                              )
                            ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: RichText(
                            text: TextSpan(
                                text: "Product Name : ",
                                style: GoogleFonts.alegreya(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                              TextSpan(
                                text: "Bibit 1",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100),
                              )
                            ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: RichText(
                          text: TextSpan(
                            text: "Jumlah : ",
                            style: GoogleFonts.alegreya(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: "3",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: RichText(
                          text: TextSpan(
                            text: "Total : ",
                            style: GoogleFonts.alegreya(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Rp. 300.000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: RichText(
                          text: TextSpan(
                            text: "Status : ",
                            style: GoogleFonts.alegreya(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Belum Dibayar",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // <--- End History Page --->

      // <--- Start Profile Page --->
      SafeArea(
        child: Stack(
          children: [
            _imageprofile(mediaqueryHeight, mediaqueryWidth),
            Column(
              children: [
                _username(),
                _email(),
                SizedBox(
                  height: 500,
                ),
                GestureDetector(
                  onTap: () {
                    _authServices.logOut(context);
                    // Navigator.of(context)
                    //     .pushNamed(LoginPageCustomer.nameRoutes);
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.green.shade800,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Logout",
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      // <--- End Profile Page ---> // profiel page
    ];

    return Scaffold(
      body: pageView[indexbuttomNavigationBar],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green.shade800,
        currentIndex: indexbuttomNavigationBar,
        items: [
          BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.shoppingCart), label: "History"),
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
          backgroundImage: NetworkImage("https://picsum.photos/id/65/200/300"),
        ),
      ),
    );
  }
// <--- Start Profile Cart Page --->

// <--- End shopping Cart Page --->
  Align _buttonchekout(
      BuildContext context, double mediaqueryHeight, double mediaqueryWidth) {
    return Align(
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
    );
  }

  Padding _nominal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Rp. 500.000",
        style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w800),
      ),
    );
  }

  Padding _texttotal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Total (3 item) :",
        style: GoogleFonts.alegreya(
            fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black54),
      ),
    );
  }

  ListView _listviewbuilder(double mediaqueryHeight, double mediaqueryWidth) {
    return ListView.builder(
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
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          "Product Name",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
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
    );
  }

  Text _textmycart() {
    return Text(
      "My Cart",
      style: GoogleFonts.roboto(
          fontSize: 25, color: Colors.black, fontWeight: FontWeight.w900),
    );
  }
// <--- Start shopping Cart Page --->

  // <--- End Home Page --->
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
                      color: Colors.green.shade100,
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
  // <--- Start Home Page --->
}
