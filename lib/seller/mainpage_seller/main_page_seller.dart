import 'package:agroera_project/seller/addproduct_seller/addpage_productseller.dart';
import 'package:agroera_project/seller/createpage_store_seller/createpage_store_seller.dart';
import 'package:agroera_project/seller/detail_orderhistory_seller/detail_orderhistory_seller.dart';
import 'package:agroera_project/services/auth_services_seller.dart';
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
  DateTime selecDate = DateTime.now();
  AuthServicesSeller _authServicesSeller = AuthServicesSeller();
  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    List<dynamic> pageView = [
      // <--- Start Store Page Status "0"--->
      // Ini akan dibuat status toko pada database dengan nilai status default
      // yaitu "0". Status default ini akan didapat oleh seller yang kita pertama
      // kali registrasi pada aplikasi dan belum membuat online storenya. Ketika
      // online store telah dibuat dan di Submit maka status akan berubah menjadi
      // "1", dimana state akan berubah dan menampilkan online store si seller.
      // Cara ini dilakukan untuk merubah state pada halaman yang sama tergantung
      // dari kondisi yang diperlukan, dimana kondisi ini contohnya adalah "status."
      // SafeArea(
      //   child: Stack(children: [
      //     _imagestore(),
      //     _text_haveastore(),
      //     _button_createstore(mediaqueryHeight, mediaqueryWidth),
      //   ]),
      // ),
      // <--- End Store Page Status "0"--->

      // <--- Start Store Page Status "1"--->
      // SafeArea(
      //   child: Stack(
      //     children: [
      //       _textmystore(),
      //       _logoandnamestore(mediaqueryWidth),
      //       _bodycontent(mediaqueryWidth)
      //     ],
      //   ),
      // ),
      // <--- End Store Page Status "1"--->

      // <--- Start Store Page Status "2"--->
      SafeArea(
        child: Stack(
          children: [
            _textMyStore(),
            _logoandNameStore(mediaqueryWidth),
            _textproduct(),
            _bodycontentproducts()
          ],
        ),
      ),
      // <--- End Store Page Status "2"--->

      // <--- Start Order Histrory Page--->
      SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Order History",
              style: GoogleFonts.alegreya(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 150,
            width: mediaqueryWidth,
            color: Colors.green.shade100.withOpacity(1),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Transaksi",
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.black, width: 2)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: selecDate, // current time
                                  firstDate:
                                      DateTime(1997), // start when the time
                                  lastDate:
                                      DateTime(2045), // over when the time
                                  initialEntryMode: DatePickerEntryMode
                                      .calendar) // choose mode (calender or input value). Default as calender
                              .then((value) {
                            print("This is $value");
                            try {
                              if (value != null) {
                                setState(() {
                                  print("Click OK $value");
                                  selecDate = value;
                                });
                              }
                            } catch (e) {
                              print(e);
                            }
                          });
                        },
                        child: Text(
                          "Date",
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ]),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Container(
              height: mediaqueryHeight / 1.5,
              width: mediaqueryWidth,
              // color: Colors.pink.shade100,
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        width: mediaqueryWidth,
                        decoration: BoxDecoration(
                          // color: Colors.blue.shade100,
                          image: DecorationImage(
                            alignment: Alignment(-0.9, 0),
                            scale: 2,
                            image: NetworkImage(
                              "https://picsum.photos/id/${index + 1}/200/300",
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 150),
                                  child: Text(
                                    "Nama Produk",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 150),
                                  child: Text(
                                    "Jumlah",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 150),
                                  child: Text(
                                    "Harga Total",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    fixedSize:
                                        MaterialStatePropertyAll(Size(91, 40)),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.green.shade800)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return DetailOrderHistorySeller();
                                    },
                                  ));
                                },
                                child: Text(
                                  "Detail",
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
                      SizedBox(
                        height: 5,
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      )),
      // <--- End Order Histrory Page--->

      // <--- Start Profile Cart Page --->
      SafeArea(
        child: Stack(
          children: [
            _imageprofile(mediaqueryHeight, mediaqueryWidth),
            Column(
              children: [
                _username(),
                _email(),
                _phone(),
                _address(),
                SizedBox(
                  height: 350,
                ),
                GestureDetector(
                  onTap: () {
                    _authServicesSeller.logoutSeller(context);
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
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
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
        // backgroundColor: Colors.amber,
        // elevation: 50,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.black,
        currentIndex: indexbuttomNavigationBar,
        items: [
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

// <--- End Store Page Status "2"--->
  Positioned _bodycontentproducts() {
    return Positioned(
      top: 300,
      left: 0,
      right: 0,
      bottom: 0,
      child: GridView.builder(
        itemCount: 50,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0, mainAxisSpacing: 10, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 200,
                width: 200,
                // color: Colors.green.shade100,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://picsum.photos/id/26/200/300"),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Nama Produk",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Harga : Rp 100.000",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              //
            ],
          );
        },
      ),
    );
  }

  Align _textproduct() {
    return Align(
        alignment: Alignment(-0.94, -0.3),
        child: Text(
          "Products",
          style: GoogleFonts.roboto(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w800),
        ));
  }

  Align _logoandNameStore(double mediaqueryWidth) {
    return Align(
      alignment: Alignment(0, -0.73),
      child: Container(
        height: 180,
        width: mediaqueryWidth,
        // color: Colors.grey.shade100,
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage("https://picsum.photos/seed/picsum/200/300"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Store Name",
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _textMyStore() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "My Store",
        style: GoogleFonts.alegreya(
            fontSize: 28, color: Colors.black, fontWeight: FontWeight.w800),
      ),
    );
  }

  // <--- Start Store Page Status "2"--->

// <--- End Store Page Status "1"--->
  Positioned _bodycontent(double mediaqueryWidth) {
    return Positioned(
      top: 260,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        width: mediaqueryWidth,
        color: Colors.grey.shade100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                "You dont have product",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return ProductSellerPage();
                  },
                ));
              },
              child: Container(
                height: 50,
                width: mediaqueryWidth / 1.7,
                decoration: BoxDecoration(
                    color: Colors.green.shade800,
                    borderRadius: BorderRadius.all(Radius.elliptical(30, 30))),
                child: Center(
                  child: Text(
                    "Add Product",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align _logoandnamestore(double mediaqueryWidth) {
    return Align(
      alignment: Alignment(0, -0.73),
      child: Container(
        height: 180,
        width: mediaqueryWidth,
        // color: Colors.grey.shade100,
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage("https://picsum.photos/seed/picsum/200/300"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Store Name",
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _textmystore() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "My Store",
        style: GoogleFonts.alegreya(
            fontSize: 28, color: Colors.black, fontWeight: FontWeight.w800),
      ),
    );
  }
// <--- Start Store Page Status "1"--->

  //<--- End Store Page Status "0"--->
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
  // <--- Start Store Page Status "0"--->

  // <--- End Profile Cart Page --->
  Row _address() {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 20),
          child: Text(
            "Address",
            style: GoogleFonts.roboto(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, right: 20),
          child: Text(
            "Blangkolam, No. F8",
            style: GoogleFonts.roboto(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Row _phone() {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 20),
          child: Text(
            "Phone",
            style: GoogleFonts.roboto(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, right: 20),
          child: Text(
            "082246516632",
            style: GoogleFonts.roboto(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

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
            "Editor as Fauzan Arobi",
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
