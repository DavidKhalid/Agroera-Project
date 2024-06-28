import 'package:agroera_project/controller/controller_seller/controller_imageproduct_seller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageProdutSeller extends StatefulWidget {
  const ImageProdutSeller({super.key});

  @override
  State<ImageProdutSeller> createState() => _ImageProdutSellerState();
}

class _ImageProdutSellerState extends State<ImageProdutSeller> {
  ImageProductControllerSeller _imageProductControllerSeller =
      ImageProductControllerSeller();

  late String firstImage = "";
  late String secondImage = "";

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Image Product",
          style: GoogleFonts.alegreya(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.green.shade800,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: StreamBuilder<DocumentSnapshot<Object?>>(
          stream: _imageProductControllerSeller.streamProductseller(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  value: 1,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (!snapshot.hasData && snapshot.data == null) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      _imageProductControllerSeller
                          .pickImageSecondProduct(context);
                    },
                    child: Center(
                      child: Text("Data tidak ditemukan"),
                    ),
                    // child: Container(
                    //   height: 200,
                    //   width: 200,
                    //   color: Colors.amber,
                    // ),
                  ),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                print(snapshot.data?.data() as Map<String, dynamic>);
                var snapshotProduct =
                    snapshot.data?.data() as Map<String, dynamic>;
                print(
                    "This is snapshot product ${snapshotProduct["firstimageproduct"]}");
                var firstImageProduct = snapshotProduct["firstimageproduct"];
                var secondImageProduct = snapshotProduct["secondimageproduct"];
                return Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _imageProductControllerSeller
                              .pickImageFirstProduct(context);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: mediaqueryWidth,
                          height: mediaqueryHeight / 5,
                          // color: Colors.amber,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: firstImageProduct == ""
                                    ? AssetImage(
                                            "assets/images/add-imageproduct-ember.png")
                                        as ImageProvider
                                    : NetworkImage(firstImageProduct)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _imageProductControllerSeller
                              .pickImageSecondProduct(context);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: mediaqueryWidth,
                          height: mediaqueryHeight / 5,
                          // color: Colors.blueGrey,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: secondImageProduct == ""
                                      ? AssetImage(
                                              "assets/images/add-imageproduct-bluegrey.png")
                                          as ImageProvider
                                      : NetworkImage(secondImageProduct))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        _imageProductControllerSeller.submit(context);
                        // _imageProductControllerSeller.deleteOldImages(
                        //     firstImageProduct, secondImageProduct, context);
                        setState(() {
                          firstImageProduct = firstImage;
                          secondImageProduct = secondImage;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: mediaqueryWidth / 2,
                        height: mediaqueryHeight / 20,
                        decoration: BoxDecoration(
                          color: Colors.green.shade800,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: GoogleFonts.alegreya(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: Text("data"),
                );
              }
            } else {
              print("Terjadi kesalahan");
              return Center(
                child: Text("Terjadi kesalahan"),
              );
            }
          }),
    );
  }
}
