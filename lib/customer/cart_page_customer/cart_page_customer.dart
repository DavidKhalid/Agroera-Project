import 'package:agroera_project/customer/payment_page_customer/payment_page_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPageCustomer extends StatelessWidget {
  static const nameRoutes = "CartPageCustomer";
  const CartPageCustomer({super.key});

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
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              FeatherIcons.arrowLeftCircle,
              color: Colors.green.shade800,
              size: 30,
            ),
          ),
        ),
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: Text(
            "My Cart",
            style: GoogleFonts.roboto(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w900),
          ),
        ),
        Align(
          alignment: Alignment(0, -0.4),
          child: Container(
            height: mediaqueryHeight / 1.5,
            width: mediaqueryWidth,
            //color: Colors.pink.shade300,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: mediaqueryHeight / 7,
                      width: mediaqueryWidth,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3))
                          ]),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://picsum.photos/id/1/200/300"))),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Text(
                                  "Product Name",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 40, 0, 10),
                                child: Text(
                                  "Price",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Total (3 item) :",
                  style: GoogleFonts.alegreya(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Rp. 500.000",
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment(0, 1),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(PaymentPageCustomer.nameRoutes);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.all(20),
              height: mediaqueryHeight / 15,
              width: mediaqueryWidth,
              decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Proceed to Checkout",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    Icon(
                      FeatherIcons.chevronRight,
                      color: Colors.white,
                      size: 30,
                      weight: 30,
                    )
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
