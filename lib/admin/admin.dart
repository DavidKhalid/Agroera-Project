import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  static const nameRoutes = "AdminPage";
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("admin page"),
      ),
    );
  }
}
