import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class mainPageAdmin {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamAdmin() async* {
    String? uid = _auth.currentUser?.uid;
    CollectionReference adminReference = _firebaseFirestore.collection("admin");
    yield* _firebaseFirestore
        .collection("admin")
        .doc(uid)
        .snapshots(); // coba menggunakan variabel.
  }

  void pickAndUploadFileCustomer(BuildContext context) async {
    try {
      // code yang akan di eksekusi
      var result = await FilePicker.platform.pickFiles();
      print("ini adalah hasil result : ${result}");

      if (result != null) {
        var file = result.files.first;
        print("ini adalah file yang di pilih ${file.name}");
        print("ini adalah path file tersebut ${file.path}");

        //Dapatkan UID pengguna yang terautentikasi.
        var uid = _auth.currentUser?.uid;
        //Jika UID pengguna tidak ada (null), tampilkan pesan error dan hentikan eksekusi
        if (uid == null) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Pengguna tidak ditemukan")));
          return;
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

          final imageUrl = await _firebaseStorage
              .ref()
              .child("upload/${uid}/${file.name}")
              .getDownloadURL();
          var profileImageUrl = imageUrl;
          print("ini ada image url test $imageUrl");
          _firebaseFirestore.collection("admin").doc(uid).update({
            "profile": profileImageUrl,
          });

          // ini batas bawah codenya
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Gagal mengunggah file ${e}")));
        }
      } else {
        print("Membatalkan pemilihan file");
      }
    } catch (e) {
      print("Tidak dapat memilih ${e}");
    }
  }
}
