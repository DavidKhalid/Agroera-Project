import 'package:agroera_project/customer/main_page_customer.dart/main_page_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryPageStatusCustomer extends StatelessWidget {
  static const nameRoutes = "DeliveryPageStatusCustomer";
  const DeliveryPageStatusCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Purchase Status",
              style: GoogleFonts.roboto(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.7),
            child: Container(
              height: mediaqueryHeight / 5,
              width: mediaqueryWidth,
              decoration: BoxDecoration(
                //color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Card(
                color: Colors.grey.shade100,
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                    //   child: RichText(
                    //       text: TextSpan(
                    //           text: "Order ID : ",
                    //           style: GoogleFonts.alegreya(
                    //               fontSize: 20,
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.bold),
                    //           children: <TextSpan>[
                    //         TextSpan(
                    //           text: "12345678",
                    //           style: TextStyle(
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.w100),
                    //         )
                    //       ])),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                      child: RichText(
                          text: TextSpan(
                              text: "Product Name : ",
                              style: GoogleFonts.alegreya(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                            TextSpan(
                              text: "Benih Padi MR219 5 kg",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100),
                            )
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: RichText(
                        text: TextSpan(
                          text: "Jumlah : ",
                          style: GoogleFonts.alegreya(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: "1",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: RichText(
                        text: TextSpan(
                          text: "Total : ",
                          style: GoogleFonts.alegreya(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Rp. 115.000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    //   child: RichText(
                    //     text: TextSpan(
                    //       text: "Status : ",
                    //       style: GoogleFonts.alegreya(
                    //           fontSize: 20,
                    //           color: Colors.black,
                    //           fontWeight: FontWeight.bold),
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //           text: "Belum Dibayar",
                    //           style: TextStyle(
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.w100),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 700,
            bottom: 20,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(MainPageCustomer.nameRoutes);
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "Back to Home",
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
