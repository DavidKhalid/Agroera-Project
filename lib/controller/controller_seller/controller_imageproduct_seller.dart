import 'dart:io';

import 'package:agroera_project/seller/mainpage_seller/main_page_seller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ImageProductControllerSeller {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  late String uidSeller;
  late String temporaryImageFirst;
  late String temporaryImageSecond;

  ImageProductControllerSeller() {
    uidSeller = _auth.currentUser!.uid;
  }

  String get uid => uidSeller;

  Stream<DocumentSnapshot<Object?>> streamProductseller() async* {
    // String uid = _auth.currentUser!.uid;

    CollectionReference collectionreferenceSeller =
        _firebaseFirestore.collection("product");

    yield* collectionreferenceSeller
        .where("seller_id", isEqualTo: uidSeller)
        .limit(1)
        // .orderBy("createAt", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.first);
  }

  Future<void> pickImageFirstProduct(BuildContext context) async {
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
        Reference ref =
            _firebaseStorage.ref().child("upload/${uid}/${file.name}");

        //unggah file ke Firebase Storage
        try {
          //code yang dijalankan ketika berhasil
          await ref.putFile(File(file.path!));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("File berhasil di unggah")));
          //belum berhasil menampilkan gambar. ini batas atas codenya
          // var imageUrl = await ref.getDownloadURL();
          // print("ini adalah image url $imageUrl");
          final imageUrl = await _firebaseStorage
              .ref()
              .child("upload/${uid}/${file.name}")
              .getDownloadURL();
          var imageUrlProduct = imageUrl;
          var temporaryImageFirst = imageUrlProduct;
          print("ini ada image url test $imageUrl");
          _firebaseFirestore
              .collection("product")
              .where("seller_id", isEqualTo: uid)
              .where("secondimageproduct", isEqualTo: "")
              // .orderBy("createAt", descending: true)
              .limit(1)
              .get()
              .then((querySnapshot) {
            if (querySnapshot.docs.isNotEmpty) {
              var doc = querySnapshot.docs.first;
              _firebaseFirestore.collection("product").doc(doc.id).update({
                "firstimageproduct": temporaryImageFirst,
              });
            }
          });

          // _firebaseFirestore.collection("product").doc(uid).update({
          //   "firstimageproduct": firstimageProduct,
          // });

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

  Future<void> pickImageSecondProduct(BuildContext context) async {
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
        Reference ref =
            _firebaseStorage.ref().child("upload/${uid}/${file.name}");

        //unggah file ke Firebase Storage
        try {
          //code yang dijalankan ketika berhasil
          await ref.putFile(File(file.path!));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("File berhasil di unggah")));
          //belum berhasil menampilkan gambar. ini batas atas codenya
          // var imageUrl = await ref.getDownloadURL();
          // print("ini adalah image url $imageUrl");
          final imageUrl = await _firebaseStorage
              .ref()
              .child("upload/${uid}/${file.name}")
              .getDownloadURL();
          var imageUrlProduct = imageUrl;
          var temporaryImageSecond = imageUrlProduct;
          print("ini ada image url test $imageUrl");
          _firebaseFirestore
              .collection("product")
              .where("seller_id", isEqualTo: uid)
              .where("secondimageproduct", isEqualTo: "")
              // .orderBy('creatAt', descending: true)
              .limit(1)
              .get()
              .then((querySnapshot) {
            if (querySnapshot.docs.isNotEmpty) {
              var doc = querySnapshot.docs.first;
              _firebaseFirestore.collection("product").doc(doc.id).update({
                "secondimageproduct": temporaryImageSecond,
              });
            }
          });

          // _firebaseFirestore.collection("product").doc(uid).update({
          //   "firstimageproduct": firstimageProduct,
          // });

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

  ////fsdfsdfsdfas
  Future<void> submit(BuildContext context) async {
    try {
      //Dapatkan UID pengguna yang terautentikasi.
      String? uid = _auth.currentUser!.uid;
      //Jika UID pengguna tidak ada (null), tampilkan pesan error dan hentikan eksekusi
      if (uid == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Pengguna tidak ditemukan")));
        return; //Hentikan eksekusi fungsi
      }
      _firebaseFirestore.collection("sellers").doc(uid).update({
        "status": "already have store and product",
      });

      Navigator.of(context).pushReplacementNamed(MainPageSeller.nameRoutes);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Gagal mengunggah file ${e}")));
    }
  }

  void deleteOldImages(
      String imageUrl1, String imageUrl2, BuildContext context) {
    try {
      if (imageUrl1.isNotEmpty) {
        _firebaseStorage.refFromURL(imageUrl1).delete();
      }
      if (imageUrl2.isNotEmpty) {
        _firebaseStorage.refFromURL(imageUrl2).delete();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Old images deleted successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete old images: $e")),
      );
    }
  }
}
