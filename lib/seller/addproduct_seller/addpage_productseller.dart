import 'package:agroera_project/controller/controller_seller/controller_addpage_productseller.dart';
import 'package:agroera_project/models/model_category_product.dart';
import 'package:agroera_project/seller/mainpage_seller/main_page_seller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ProductSellerPage extends StatefulWidget {
  static const nameRoutes = "ProductSellerPage";

  ProductSellerPage({super.key});

  @override
  State<ProductSellerPage> createState() => _ProductSellerPageState();
}

class _ProductSellerPageState extends State<ProductSellerPage> {
  AddProductSeller _addProductSeller = AddProductSeller();

  var categoryProdutItem = [
    "Bibit",
    "Pupuk",
    "Sprayer",
    "Alat Pertanian",
    "Racun Hama"
  ];
  var selectedCategory;
  var imageproduct1;
  var imageproduct2;

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Product",
          style: GoogleFonts.alegreya(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, MainPageSeller.nameRoutes);
            },
            icon: Icon(FeatherIcons.arrowLeft)),
        backgroundColor: Colors.green.shade800,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(children: [
        Align(
          alignment: Alignment(0, 0),
          child: Container(
            height: mediaqueryHeight,
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
                    controller: _addProductSeller.productnameC,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: "Product Name",
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
                    height: mediaqueryHeight / 13,
                    width: mediaqueryWidth,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: categoryProdutItem,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Category Product",
                          hintText: "selected",
                        ),
                      ),
                      onChanged: (value) {
                        // nanti disini akan di panggil function dari class
                        // AddProductSeller. Setelah itu data yang telah dipilih
                        // di simpan ke database
                        setState(() {
                          selectedCategory = value!;
                          print(
                              "ini product yang telah dipilih ${selectedCategory}");
                        });
                        // var productSelected = value;
                      },

                      clearButtonProps: ClearButtonProps(isVisible: true),

                      // selectedItem: "Bibit",
                    )),
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
                    controller: _addProductSeller.priceC,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: "Price",
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
                    controller: _addProductSeller.productdescriptionC,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: "Product Description",
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
              _addProductSeller.submitAddProduct(
                  _addProductSeller.productnameC.text,
                  selectedCategory ?? "",
                  _addProductSeller.priceC.text,
                  _addProductSeller.productdescriptionC.text,
                  context);
              // _addProductSeller.submitAddProduct(
              //     _addProductSeller.productnameC.text,
              //     selectedCategory ?? "",
              //     _addProductSeller.priceC.text,
              //     _addProductSeller.productdescriptionC.text,
              //     context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Submit Add Product",
                  style: GoogleFonts.roboto(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
