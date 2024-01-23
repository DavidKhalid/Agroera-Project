import 'package:agroera_project/customer/main_page_customer.dart/main_page.dart';
import 'package:agroera_project/models/model_category_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductForCustomer extends StatelessWidget {
  static const nameRoutes = "ProductForCustomer";
  const ProductForCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Bibit",
                style: GoogleFonts.roboto(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Column(
              children: [
                GridView.builder(
                  itemCount: categoryproduct.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final CategoryProduct categoryproduct =
                        categoryProduct[index];
                    return Container(
                      height: 200,
                      width: 200,
                      color: Colors.amber,
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
