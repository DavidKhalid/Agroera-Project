import 'package:agroera_project/controller/controller_seller/controller_imageproduct_seller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class dynamicproductC {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  late String uidSeller;

  Stream<QuerySnapshot<Object?>> streamDynamicProductC() async* {
    // String uid = _auth.currentUser!.uid;
    var controller = ImageProductControllerSeller();
    String sellerUid = controller.uid;
    // Do something with sellerUid

    CollectionReference collectionreferenceSeller =
        _firebaseFirestore.collection("product");

    yield* collectionreferenceSeller
        .where("seller_id", isEqualTo: sellerUid)
        .snapshots();
  }
}
