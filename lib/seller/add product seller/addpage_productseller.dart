import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductSellerPage extends StatelessWidget {
  static const nameRoutes = "ProductSellerPage";
  const ProductSellerPage({super.key});

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
      ]),
    );
  }
}
