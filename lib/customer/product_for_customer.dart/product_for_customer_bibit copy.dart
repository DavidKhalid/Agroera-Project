import 'dart:math';

import 'package:agroera_project/controller/controller_customer/controller_pageproduct_customer.dart';
import 'package:agroera_project/controller/controller_seller/controller_addpage_productseller.dart';
import 'package:agroera_project/controller/controller_seller/controller_imageproduct_seller.dart';
import 'package:agroera_project/controller/controller_seller/controller_mainpage_seller.dart';
import 'package:agroera_project/customer/detailproduct_page_customer/detailproduct_page_bibit.dart';
import 'package:agroera_project/customer/detailproduct_page_customer/detailproduct_page_pupuk.dart';
import 'package:agroera_project/customer/main_page_customer.dart/main_page_customer.dart';
import 'package:agroera_project/models/model_category_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductForCustomerBibit extends StatefulWidget {
  static const nameRoutes = "ProductForCustomerBibit";
  final String category;
  late String sellerID; // add category parameter
  //final List<CategoryProduct> categoryProducts;
  ProductForCustomerBibit({super.key, required this.category});

  @override
  State<ProductForCustomerBibit> createState() =>
      _ProductForCustomerBibitState();
}

class _ProductForCustomerBibitState extends State<ProductForCustomerBibit> {
  ProductForCustomerController _productForCustomerController =
      ProductForCustomerController();

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            FeatherIcons.arrowLeftCircle,
            color: Colors.green.shade800,
            size: 30,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: _productForCustomerController
              .streamProductForCustomer(widget.category),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              print("ini snapshot ${snapshot.data?.docs}");
              final products = snapshot.data?.docs;
              print("ini final products ${products}");
              if (snapshot.hasData && snapshot.data != null) {
                return GridView.builder(
                  // scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 0.2,
                      childAspectRatio: 0.5),
                  itemCount: products?.length,
                  itemBuilder: (context, index) {
                    var finalproducts =
                        products?[index].data() as Map<String, dynamic>;
                    var idProduct = products?[index];
                    var sellerID = finalproducts;
                    print(
                        "This is snapshot for Seller ID : ${sellerID["seller_id"]}");

                    return SafeArea(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text(
                            "Bibit",
                            style: GoogleFonts.roboto(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacementNamed(
                              //     context, DetailProductPageBibit.nameRoutes);
                              print("Product id : ${products?[index].id}");
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return DetailProductPageBibit(
                                    category: "Bibit",
                                    productId: idProduct?.id,
                                  );
                                },
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              // width: mediaqueryWidth,
                              // height: 500,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade800,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        finalproducts["firstimageproduct"]),
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: Colors.green.shade800, width: 1)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text(
                            "${finalproducts["productname"]}",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "Rp. ${finalproducts["price"]}",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ));
                  },
                );
              } else {
                print("hastdata dan snapshot.data bermasalah");
                return Center(
                  child: Text("hastdata dan snapshot.data bermasalah"),
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
}
