import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DataSeller extends StatefulWidget {
  static const nameRoutes = "DataSeller";
  const DataSeller({super.key});

  @override
  State<DataSeller> createState() => _DataSellerState();
}

class _DataSellerState extends State<DataSeller> {
  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Data Seller",
          style: GoogleFonts.alegreya(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: mediaqueryHeight / 5,
                width: mediaqueryWidth,
                decoration: BoxDecoration(color: Colors.green.shade100),
                child: ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        "https://picsum.photos/id/${index + 1}/200/300"),
                  ),
                  title: _nameseller(),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _email(),
                      _handphone(),
                      _namestore(),
                    ],
                  ),
                  trailing: _icondelete(),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
        },
      ),
    );
  }

  GestureDetector _icondelete() {
    return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Icon(
                      FeatherIcons.trash2,
                      color: Colors.black,
                      fill: 1,
                    ),
                  ),
                );
  }

  Row _namestore() {
    return Row(
                      children: [
                        Text(
                          "Name Store : ",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "example",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    );
  }

  Row _handphone() {
    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Handphone : ",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "082246516632",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    );
  }

  Row _email() {
    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Email : ",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "alberto@gmail.com",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    );
  }

  Padding _nameseller() {
    return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Name Seller",
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                );
  }
}
