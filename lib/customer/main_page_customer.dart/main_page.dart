import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPageCustomer extends StatelessWidget {
  static const nameRoutes = "MainPage";
  const MainPageCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  "Selamat Datang",
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Temukan Yang Anda Butuhkan",
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.black45,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Positioned(
                  // bottom: 5,
                  top: 100,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: mediaqueryHeight,
                    width: mediaqueryWidth,
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text("Search"),
                        hintText: "temukan kebutuhan anda",
                        hintStyle: GoogleFonts.roboto(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    ));
  }
}
