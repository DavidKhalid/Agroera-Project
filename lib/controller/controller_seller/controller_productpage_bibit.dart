import 'package:agroera_project/controller/controller_seller/controller_imageproduct_seller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductPageBibitC {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  var testIdSeller;

  // ImageProductControllerSeller() {
  //   uidSeller = _auth.currentUser!.uid;
  // }

  // String get uid => uidSeller;

  // Stream<DocumentSnapshot<Object?>> streamProductseller(
  //   String category,
  //   // seller_id,
  // ) async* {
  //   // String uid = _auth.currentUser!.uid;
  //   var controller = ImageProductControllerSeller();

  //   var testIdSeller = controller.uid;

  //   CollectionReference collectionreferenceSeller =
  //       _firebaseFirestore.collection("product");

  //   yield* collectionreferenceSeller
  //       .where("categoryproduct", isEqualTo: category)
  //       // .where("seller_id", isEqualTo: "k8PBkE6SHzROWqFH8jnmtXMe44L2")
  //       .where("seller_id", isEqualTo: testIdSeller)
  //       .limit(1)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs.first);
  // }
  Stream<DocumentSnapshot<Object?>> streamProductseller(
    String docProductId,
    // seller_id,
  ) async* {
    // String uid = _auth.currentUser!.uid;
    var controller = ImageProductControllerSeller();

    var testIdSeller = controller.uid;

    CollectionReference collectionreferenceSeller =
        _firebaseFirestore.collection("product");
    // print(category);
    // print(testIdSeller);
    yield* collectionreferenceSeller.doc(docProductId).snapshots();
  }
}
