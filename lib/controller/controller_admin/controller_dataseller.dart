import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class dataSellerC {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Stream<QuerySnapshot<Object?>> dataSellerStream() async* {
    CollectionReference collectionReferenceSeller =
        _firebaseFirestore.collection("sellers");
    yield* collectionReferenceSeller.snapshots();
  }
}
