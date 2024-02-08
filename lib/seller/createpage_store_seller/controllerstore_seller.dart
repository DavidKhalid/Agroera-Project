import 'package:flutter/material.dart';

class controllerStoreSeller {
  TextEditingController namatoko = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController deskripsitoko = TextEditingController();

  void dispose() {
    namatoko.dispose();
    alamat.dispose();
    deskripsitoko.dispose();
  }
}
