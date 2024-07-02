import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductPageAlatPertanianC {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  late String uidSeller;

  ImageProductControllerSeller() {
    uidSeller = _auth.currentUser!.uid;
  }

  String get uid => uidSeller;

  Stream<DocumentSnapshot<Object?>> streamProductseller(
      String docProductId) async* {
    // String uid = _auth.currentUser!.uid;

    CollectionReference collectionreferenceSeller =
        _firebaseFirestore.collection("product");

    yield* collectionreferenceSeller.doc(docProductId).snapshots();
  }
}
