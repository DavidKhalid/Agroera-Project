import 'package:agroera_project/models/model_category_product.dart';
import 'package:agroera_project/seller/addproduct_seller/controlleraddproduct_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ProductSellerPage extends StatelessWidget {
  static const nameRoutes = "ProductSellerPage";
  addproductControllerSeller productnameController =
      addproductControllerSeller();
  addproductControllerSeller priceController = addproductControllerSeller();
  addproductControllerSeller storedescriptionController =
      addproductControllerSeller();
  ProductSellerPage({super.key});

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
        backgroundColor: Colors.green.shade800,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(children: [
        Container(
          height: 200,
          width: mediaqueryWidth,
          color: Colors.grey.shade200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(color: Colors.green.shade100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(FeatherIcons.plus),
                    Text("Add Photos"),
                  ],
                ),
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(color: Colors.blue.shade100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(FeatherIcons.plus),
                    Text("Add Photos"),
                  ],
                ),
              ),
            ],
          ),
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
                    controller: productnameController.productnameC,
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
                      items: [
                        "Bibit",
                        "Pupuk",
                        "Sprayer",
                        "Alat Pertanian",
                        "Racun Hama"
                      ],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Category Product",
                          hintText: "selected",
                        ),
                      ),
                      onChanged: print,
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
                    controller: priceController.priceC,
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
                    controller: storedescriptionController.storedescriptionC,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: "Store Description",
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
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green.shade800,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                "Add Product",
                style: GoogleFonts.roboto(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
