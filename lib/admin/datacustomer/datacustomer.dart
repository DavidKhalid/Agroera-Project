import 'dart:ffi';

import 'package:agroera_project/controller/controller_admin/controller_datacustomer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  DataCustomerC _dataCustomerC = DataCustomerC();
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
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: _dataCustomerC.dataCustomerStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData && snapshot.data != null) {
                //code ini dijalankan ketika data ada pada database
                print("This is ${snapshot.data}");
                var snapshotResult = snapshot.data?.docs;
                print(snapshotResult);
                try {
                  return ListView.builder(
                    itemCount: snapshotResult?.length,
                    itemBuilder: (context, index) {
                      var finalData =
                          snapshotResult?[index].data() as Map<String, dynamic>;
                      return Column(
                        children: [
                          Container(
                            height: mediaqueryHeight / 6,
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
                              title: _namecustomer(finalData),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _email(finalData),
                                  _role(finalData),
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
                  //jika data tidak ditemukan pada database, kode error ini yang
                  //akan dijalankan
                  print("This is error ${e}");
                  return Text("This is error ${e}");
                }
              } else {
                print("Data tidak ditemukan, tidak dapat memuat data");
                return Text("Data tidak ditemukan, tidak dapat memuat data");
              }
            } else {
              print("Terjadi kesalahan, tidak dapat memuat data");
              return Text("Terjadi kesalahan, tidak dapat memuat data");
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

  Row _role(Map<String, dynamic> finalData) {
    return Row(
      children: [
        Text(
          "Role : ",
          style: GoogleFonts.roboto(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
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
        Text(
          finalData["email"],
          style: GoogleFonts.roboto(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Padding _namecustomer(Map<String, dynamic> finalData) {
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
