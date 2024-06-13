import 'package:agroera_project/controller/controller_admin/controller_dataseller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DataSeller extends StatefulWidget {
  static const nameRoutes = "DataSeller";
  const DataSeller({super.key});

  @override
  State<DataSeller> createState() => _DataSellerState();
}

class _DataSellerState extends State<DataSeller> {
  dataSellerC _sellerC = dataSellerC();
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
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: _sellerC.dataSellerStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData && snapshot.data != null) {
                print("this snapshot ${snapshot.data}");
                var resultSnapshot = snapshot.data?.docs;
                print("this is resultsnaphot ${resultSnapshot}");
                try {
                  //jika data ada dan tidak bernilai null pada database
                  return ListView.builder(
                    itemCount: resultSnapshot?.length,
                    itemBuilder: (context, index) {
                      // var finalDataSnapshot =
                      //     resultSnapshot?[index] as Map<String, dynamic>;
                      var finalData =
                          resultSnapshot?[index].data() as Map<String, dynamic>;
                      return Column(
                        children: [
                          Container(
                            height: mediaqueryHeight / 5,
                            width: mediaqueryWidth,
                            decoration:
                                BoxDecoration(color: Colors.green.shade100),
                            child: ListTile(
                              isThreeLine: true,
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(finalData["profile"]),
                              ),
                              title: _nameseller(finalData),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _email(finalData),
                                  _role(finalData),
                                  _namestore(finalData),
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
                  );
                } catch (e) {
                  print("This is error ${e}");
                  return Center(
                    child:
                        Text("Data tidak ditemukan, tidak dapat memuat data"),
                  );
                }
              } else {
                print("Terjadi kesalahan");
                return Center(
                  child: Text("Terjadi kesalahan"),
                );
              }
            } else {
              print("Terjadi kesalahan, tidak dapat memuat data");
              return Center(
                child: Text("Terjadi kesalahan, tidak dapat memuat data"),
              );
            }
          }),
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

  Row _namestore(Map<String, dynamic> finalData) {
    return Row(
      children: [
        Text(
          "Name Store : ",
          style: GoogleFonts.roboto(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          finalData["storeName"],
          style: GoogleFonts.roboto(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Row _role(Map<String, dynamic> finalData) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "Role : ",
            style: GoogleFonts.roboto(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          finalData["role"],
          style: GoogleFonts.roboto(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Row _email(Map<String, dynamic> finalData) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "Email : ",
            style: GoogleFonts.roboto(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(
            finalData["email"],
            style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }

  Padding _nameseller(Map<String, dynamic> finalData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        finalData["username"],
        style: GoogleFonts.roboto(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
