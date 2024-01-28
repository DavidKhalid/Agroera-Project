import 'package:agroera_project/customer/detailproduct_page_customer/detailproduct_page_customer.dart';
import 'package:agroera_project/customer/main_page_customer.dart/main_page_customer.dart';
import 'package:agroera_project/models/model_category_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductForCustomer extends StatelessWidget {
  static const nameRoutes = "ProductForCustomer";
  //final List<CategoryProduct> categoryProducts;
  const ProductForCustomer({super.key});

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
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
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
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                //color: Colors.red.shade200,
                height: mediaqueryHeight,
                width: mediaqueryWidth,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 1),
                  itemCount: categoryproduct.length,
                  itemBuilder: (context, index) {
                    final CategoryProduct categoryproduct =
                        categoryProduct[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              // parshing data menggunakan routes dan
                              // membaca data dari model bleum berhasil
                              // terpaksa sementara memakai navigator.push
                              // Navigator.of(context).pushNamed(
                              //     "DetailProductPageCustomer",
                              //     arguments: categoryproduct);

                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return DetailProductPageCustomer(
                                    categoryP: categoryproduct);
                              }));
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              height: mediaqueryHeight,
                              width: mediaqueryWidth,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade800,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      categoryproduct.image.toString(),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: Colors.green.shade800, width: 1)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            categoryproduct.categoryname.toString(),
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Rp. ${categoryproduct.price.toString()}",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
