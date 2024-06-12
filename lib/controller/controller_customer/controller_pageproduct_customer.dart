import 'package:agroera_project/controller/controller_seller/controller_imageproduct_seller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductForCustomerController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  ImageProductControllerSeller _imageProductControllerSeller =
      ImageProductControllerSeller();

  Stream<QuerySnapshot<Object?>> streamProductForCustomer(String category) async* {
    // String uid = _auth.currentUser!.uid;
    // String resultUidSeller = _imageProductControllerSeller.uidSeller;
    var controller = ImageProductControllerSeller();
    String sellerUid = controller.uid;
    CollectionReference collectionreferenceSeller =
        _firebaseFirestore.collection("product");

    yield* collectionreferenceSeller
        .where("categoryproduct", isEqualTo: category)
        .snapshots();
  }
}
