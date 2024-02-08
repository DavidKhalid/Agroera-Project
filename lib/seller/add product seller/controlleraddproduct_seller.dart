import 'package:flutter/material.dart';

class addproductControllerSeller {
  TextEditingController productnameC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController storedescriptionC = TextEditingController();

  void dispose() {
    productnameC.dispose();
    priceC.dispose();
    storedescriptionC.dispose();
  }
}
