import 'package:agroera_project/customer/deliverypage_status_customer/deliverypage_status_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPageCustomer extends StatelessWidget {
  static const nameRoutes = "PaymentPageCustomer";
  const PaymentPageCustomer({super.key});

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
        // title: Text(
        //   "Payment",
        //   style: GoogleFonts.roboto(
        //       fontSize: 25, color: Colors.black, fontWeight: FontWeight.w800),
        // ),
        // centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Payment",
              style: GoogleFonts.roboto(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.7),
            child: Container(
              height: mediaqueryHeight / 4,
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
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("assets/images/bank.png"),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text(
                              "BANK",
                              style: GoogleFonts.alegreya(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              maxLines: 2,
                              "Silahkan transfer ke nomor rekening dibawah ini :",
                              style: GoogleFonts.abhayaLibre(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                            child: Text(
                              "BCA : 7875102486",
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.2),
            child: Container(
              height: mediaqueryHeight / 4,
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
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("assets/images/delivery.png"),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text(
                              "JASA PENGIRIMAN",
                              style: GoogleFonts.alegreya(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Text(
                              maxLines: 2,
                              "Nikamati proses pengiriman yang cepat dan aman",
                              style: GoogleFonts.abhayaLibre(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(DeliveryPageStatusCustomer.nameRoutes);
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
                        "Submit and Delivery Status",
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
        ],
      ),
    );
  }
}
