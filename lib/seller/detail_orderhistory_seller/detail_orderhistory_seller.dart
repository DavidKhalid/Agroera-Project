import 'package:agroera_project/seller/mainpage_seller/main_page_seller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailOrderHistorySeller extends StatelessWidget {
  static const nameRoutes = "DetailOrderHistorySeller";
  // List<Map<String, dynamic>> listdetailoderhistory = [
  //   {
  //     "Nama Produk": "Bibit",
  //     "Jumlah": 5,
  //     "Total Biaya": 500.000,
  //     "Nama Customer": "Editor",
  //     "Alamat Pengiriman": "Blangkolam",
  //     "Nomor Telepon": 082246516632,
  //     "Status Pesanan": "Telah Dibayar"
  //   }
  // ];
  DetailOrderHistorySeller({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Order History",
          style: GoogleFonts.alegreya(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.green.shade800,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: mediaqueryHeight / 1.3,
            width: mediaqueryWidth,
            color: Colors.white,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Nama Product: ",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Bibit",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Jumlah: ",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "5",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Total Harga: ",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Rp 500.000",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Nama Customer : ",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Editor",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Alamat Pengiriman: ",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Blangkolam",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Nomor Telepon",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "082246516632",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Status Pembayaran : ",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Telah Dibayar",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: mediaqueryHeight / 15,
              width: mediaqueryWidth,
              decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Accept and Process",
                  style: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
