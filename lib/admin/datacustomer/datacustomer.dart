import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DataCustomer extends StatefulWidget {
  static const nameRoutes = "DataCustomer";
  const DataCustomer({super.key});

  @override
  State<DataCustomer> createState() => _DataCustomerState();
}

class _DataCustomerState extends State<DataCustomer> {
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
          "Data Customer",
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
                height: mediaqueryHeight / 6,
                width: mediaqueryWidth,
                decoration: BoxDecoration(color: Colors.green.shade100),
                child: ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        "https://picsum.photos/id/${index + 1}/200/300"),
                  ),
                  title: _namecustomer(),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _email(),
                      _handphone(),
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

  Row _handphone() {
    return Row(
                      children: [
                        Text(
                          "Handphone : ",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
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

  Padding _namecustomer() {
    return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Nama Customer",
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                );
  }
}
