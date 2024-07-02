import 'package:agroera_project/controller/controller_customer/controller_pageproduct_customer.dart';
import 'package:agroera_project/controller/controller_seller/controller_productpage_bibit.dart';
import 'package:agroera_project/controller/controller_seller/controller_productpage_pupuk.dart';
import 'package:agroera_project/controller/controller_seller/controller_productpage_sprayer.dart';
import 'package:agroera_project/customer/product_for_customer.dart/product_for_customer_sprayer%20copy%202.dart';
import 'package:agroera_project/models/model_category_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cart_page_customer/cart_page_customer.dart';

bool isFavorite = false;

class DetailProductPageSprayer extends StatefulWidget {
  String category;
  var productId;
  //  final List<Map<String, String>> products;

  static const nameRoutes = "DetailProductPageSprayer";
  DetailProductPageSprayer(
      {super.key, required this.category, required this.productId});

  @override
  State<DetailProductPageSprayer> createState() =>
      _DetailProductPageSprayerState();
}

class _DetailProductPageSprayerState extends State<DetailProductPageSprayer> {
  ProductPageSprayerC _productPageSprayerC = ProductPageSprayerC();
  @override
  Widget build(BuildContext context) {
    // final categoryproduct =
    //     ModalRoute.of(context)!.settings.arguments as CategoryProduct;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(
                context, ProductForCustomerSprayer.nameRoutes);
          },
          child: Icon(
            FeatherIcons.arrowLeftCircle,
            color: Colors.green.shade800,
            size: 30,
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot<Object?>>(
          stream: _productPageSprayerC.streamProductseller(widget.productId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData && snapshot.data != null) {
                print("This is snapshot ${snapshot.data?.data()}");
                var snapshotResult = snapshot.data?.data();
                return SafeArea(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: mediaqueryHeight,
                      width: mediaqueryWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //_arrowBack(context),
                          _contentImage(mediaqueryHeight, mediaqueryWidth,
                              snapshotResult),
                          _favoritebutton(),
                          _productname(snapshotResult),
                          _price(snapshotResult),
                          _description(),
                          const Divider(
                            indent: 20,
                            endIndent: 20,
                            color: Colors.black,
                          ),
                          _fillDescription(mediaqueryHeight, mediaqueryWidth,
                              context, snapshotResult)
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                print("hasData false and snapshot bernilai null");
                return Center(
                  child: Text("Tidak dapat memuat data"),
                );
              }
            } else {
              print("Terjadi Kesalahan");
              return Center(
                child: Text("Terjadi Kesalahan"),
              );
            }
          }),
    );
  }

  Expanded _favoritebutton() {
    return Expanded(
      flex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              size: 30,
              color: Colors.red,
            )),
      ),
    );
  }

  Expanded _fillDescription(double mediaqueryHeight, double mediaqueryWidth,
      BuildContext context, dynamic snapshotResult) {
    var finalSnapshotResult = snapshotResult;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(CartPageCustomer.nameRoutes);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
          height: mediaqueryHeight,
          width: mediaqueryWidth,
          decoration: BoxDecoration(
              //color: Colors.amber.shade500,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textfilldescription(finalSnapshotResult),
              _buttoncart_andiconshoppingbag(mediaqueryHeight, mediaqueryWidth),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buttoncart_andiconshoppingbag(
      double mediaqueryHeight, double mediaqueryWidth) {
    return Expanded(
      child: Container(
        height: mediaqueryHeight,
        width: mediaqueryWidth,
        decoration: BoxDecoration(
          color: Colors.green.shade800,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green.shade800, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(FeatherIcons.shoppingBag, color: Colors.white),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              height: mediaqueryHeight,
              width: mediaqueryWidth / 2,
              child: Center(
                child: Text(
                  "ADD TO CART",
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.w900),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _textfilldescription(dynamic finalSnapshotResult) {
    return Expanded(
      child: Text(
        textAlign: TextAlign.justify,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        "${finalSnapshotResult["productdescription"]}",
        style: GoogleFonts.alegreya(fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }

  Row _description() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Text(
              "Description",
              style: GoogleFonts.alegreya(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }

  Row _price(dynamic snapshotResult) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: GoogleFonts.alegreya(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  "Rp. ${snapshotResult["price"]}",
                  style: GoogleFonts.alegreya(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _productname(dynamic snapshotResult) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "${snapshotResult["productname"]}",
              style: GoogleFonts.alegreya(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Expanded _contentImage(
      double mediaqueryHeight, double mediaqueryWidth, dynamic snapshotResult) {
    return Expanded(
      flex: 4,
      child: Container(
        margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
        height: mediaqueryHeight / 2.3,
        width: mediaqueryWidth,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          image: DecorationImage(
              image: NetworkImage(snapshotResult["firstimageproduct"]),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  // Row _arrowBack(BuildContext context) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: Container(
  //           margin: const EdgeInsets.only(left: 20),
  //           child: IconButton(
  //               alignment: Alignment.bottomLeft,
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               icon: const Icon(FeatherIcons.arrowLeftCircle)),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
