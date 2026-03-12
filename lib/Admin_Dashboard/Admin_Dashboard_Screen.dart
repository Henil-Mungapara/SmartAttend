import 'package:flutter/material.dart';

class Admin_Dashboard_Screen extends StatelessWidget {
  const Admin_Dashboard_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const Center(
        child: Text(
          "Welcome Admin 👨‍💼\nSystem Overview Coming Soon",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}