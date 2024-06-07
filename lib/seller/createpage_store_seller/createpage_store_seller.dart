import 'package:agroera_project/controller/controller_seller/controller_mainpage_seller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePageStoreSeller extends StatelessWidget {
  static const nameRoutes = "CreatePageStoreSeller";
  // controllerStoreSeller namatokoController = controllerStoreSeller();
  // controllerStoreSeller alamatController = controllerStoreSeller();
  // controllerStoreSeller deskripsitokoController = controllerStoreSeller();
  MainPageSellerController _mainPageSellerController =
      MainPageSellerController();
  CreatePageStoreSeller({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Store",
          style: GoogleFonts.alegreya(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green.shade800,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: mediaqueryHeight / 4,
            width: mediaqueryWidth,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                image: DecorationImage(
                    alignment: Alignment(0, -0.4),
                    scale: 0.8,
                    image: AssetImage("assets/images/store.png"))),
            child: Align(
                alignment: Alignment(0, 0.9),
                child: Text(
                  "This is information is used to set up your shop",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )),
          ),
          Align(
            alignment: Alignment(0, 0.38),
            child: Container(
              height: mediaqueryHeight / 1.9,
              width: mediaqueryWidth,
              // color: Colors.pink.shade100,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    height: mediaqueryHeight / 8,
                    width: mediaqueryWidth,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _mainPageSellerController.storeNameC,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: "Nama Toko",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: mediaqueryHeight / 8,
                    width: mediaqueryWidth,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _mainPageSellerController.addressStoreC,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: "Alamat",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: mediaqueryHeight / 8,
                    width: mediaqueryWidth,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _mainPageSellerController.storeDescriptionC,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: "Deskripsi Toko",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 690,
            bottom: 20,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                _mainPageSellerController.createstoreSeller(
                    _mainPageSellerController.storeNameC.text,
                    _mainPageSellerController.addressStoreC.text,
                    _mainPageSellerController.storeDescriptionC.text,
                    context);
              },
              child: Container(
                // height: 100,
                // width: 200,
                child: Center(
                  child: Text(
                    "Submit",
                    style: GoogleFonts.roboto(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
