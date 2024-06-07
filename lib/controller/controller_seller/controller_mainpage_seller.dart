import 'dart:io';

import 'package:agroera_project/seller/mainpage_seller/main_page_seller.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPageSellerController {
  // late final String uid;
  // late final String username;
  // late final String email;
  // late final String password;
  // late final String role;
  // late final String createAt;

  // MainPageSellerController (
  //   this.uid,
  //   this.username,
  //   this.email,
  //   this.password,
  //   this.role,
  //   this.createAt,
  // )

  // factory MainPageSellerController.fromSnapshot(DocumentSnapshot snapshot) {
  //   final data = snapshot.data() as Map<String, dynamic>;
  //   return MainPageSellerController(
  //     "uid": snapshot.id,
  //     "name": data['name'] ?? '',
  //     "email": data['email'] ?? '',
  //   );
  TextEditingController storeNameC = TextEditingController();
  TextEditingController addressStoreC = TextEditingController();
  TextEditingController storeDescriptionC = TextEditingController();

  void dispose() {
    storeNameC.dispose();
    addressStoreC.dispose();
    storeDescriptionC.dispose();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  String? imageUrl;

  Stream<DocumentSnapshot<Object?>> streamuserSeller() async* {
    String? uid = _auth.currentUser?.uid;
    CollectionReference collectionreferenceSeller =
        _firebaseFirestore.collection("sellers");

    yield* collectionreferenceSeller.doc(uid).snapshots();
    // }
  }

  Future<void> pickAndUploadFileSeller(BuildContext context) async {
    try {
      var result = await FilePicker.platform.pickFiles();
      print("ini adalah hasil result : ${result}");

      if (result != null) {
        //dapatkan file yang dipilih
        // print("ini adalah hasil result $result");
        var file = result.files.first;
        print("ini adalah file yang di pilih ${file.name}");
        print("ini adalah path file tersebut ${file.path}");

        //Dapatkan UID pengguna yang terautentikasi.
        String? uid = _auth.currentUser!.uid;
        //Jika UID pengguna tidak ada (null), tampilkan pesan error dan hentikan eksekusi
        if (uid == null) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Pengguna tidak ditemukan")));
          return; //Hentikan eksekusi fungsi
        }

        //Buat referensi ke Firebase Storage berdasarkan UID
        Reference ref = storage.ref().child("upload/${uid}/${file.name}");

        //unggah file ke Firebase Storage
        try {
          //code yang dijalankan ketika berhasil
          await ref.putFile(File(file.path!));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("File berhasil di unggah")));
          //belum berhasil menampilkan gambar. ini batas atas codenya
          // var imageUrl = await ref.getDownloadURL();
          // print("ini adalah image url $imageUrl");
          final imageUrl = await storage
              .ref()
              .child("upload/${uid}/${file.name}")
              .getDownloadURL();
          var profileImageUrl = imageUrl;
          print("ini ada image url test $imageUrl");
          _firebaseFirestore.collection("sellers").doc(uid).update({
            "profile": profileImageUrl,
          });

          // setState(() {
          //   this.imageUrl = imageUrl;
          // });

          // ini batas bawah codenya
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Gagal mengunggah file ${e}")));
        }
      } else {
        print("membatalkan pemilihan file");
      }
    } catch (e) {
      print("terjadi kesalahan saat memilih file ${e}");
    }
    //pilih file menggunakan file_picker
  }

  Future<void> createstoreSeller(String storeName, String addressStore,
      String storeDescription, BuildContext context) async {
    try {
      var productCollection = _firebaseFirestore.collection("product");
      var uid = _auth.currentUser?.uid;
      print("ini user yang sedang login ${uid}");
      if (uid != null) {
        _firebaseFirestore.collection("sellers").doc(uid).update({
          "storeName": storeName,
          "addressStore": addressStore,
          "storeDescription": storeDescription,
          "status": "already have a store",
        });
        final materialBanner = MaterialBanner(
          elevation: 0,
          backgroundColor: Colors.transparent,
          forceActionsBelow: true,
          content: AwesomeSnackbarContent(
            title: "Succes",
            message: "congratulation Success Submite Data Store",
            contentType: ContentType.success,
            inMaterialBanner: true,
          ),
          actions: const [SizedBox.shrink()],
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentMaterialBanner()
          ..showMaterialBanner(materialBanner);
        Navigator.pushReplacementNamed(context, MainPageSeller.nameRoutes);
      } else {
        final materialBanner = MaterialBanner(
          elevation: 0,
          backgroundColor: Colors.transparent,
          forceActionsBelow: true,
          content: AwesomeSnackbarContent(
            title: "Failed",
            message: "Current User not Found",
            contentType: ContentType.success,
            inMaterialBanner: true,
          ),
          actions: const [SizedBox.shrink()],
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentMaterialBanner()
          ..showMaterialBanner(materialBanner);
      }
    } catch (e) {
      print("Gagal submit data store");
    }
  }

  void pickImageStoreSeller(BuildContext context) async {
    try {
      var result = await FilePicker.platform.pickFiles();
      print("ini adalah hasil result : ${result}");

      if (result != null) {
        //dapatkan file yang dipilih
        // print("ini adalah hasil result $result");
        var file = result.files.first;
        print("ini adalah file yang di pilih ${file.name}");
        print("ini adalah path file tersebut ${file.path}");

        //Dapatkan UID pengguna yang terautentikasi.
        String? uid = _auth.currentUser!.uid;
        //Jika UID pengguna tidak ada (null), tampilkan pesan error dan hentikan eksekusi
        if (uid == null) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Pengguna tidak ditemukan")));
          return; //Hentikan eksekusi fungsi
        }

        //Buat referensi ke Firebase Storage berdasarkan UID
        Reference ref = storage.ref().child("upload/${uid}/${file.name}");

        //unggah file ke Firebase Storage
        try {
          //code yang dijalankan ketika berhasil
          await ref.putFile(File(file.path!));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("File berhasil di unggah")));
          //belum berhasil menampilkan gambar. ini batas atas codenya
          // var imageUrl = await ref.getDownloadURL();
          // print("ini adalah image url $imageUrl");
          final imageUrl = await storage
              .ref()
              .child("upload/${uid}/${file.name}")
              .getDownloadURL();
          var storeImage = imageUrl;
          print("ini ada image url test $imageUrl");
          _firebaseFirestore.collection("sellers").doc(uid).update({
            "storeImage": storeImage,
          });

          // setState(() {
          //   this.imageUrl = imageUrl;
          // });

          // ini batas bawah codenya
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Gagal mengunggah file ${e}")));
        }
      } else {
        print("membatalkan pemilihan file");
      }
    } catch (e) {
      print("terjadi kesalahan saat memilih file ${e}");
    }
  }
}

// void setState(Null Function() param0) {
// }
