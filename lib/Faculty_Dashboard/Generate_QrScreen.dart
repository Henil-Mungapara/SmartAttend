import 'package:flutter/material.dart';
import 'package:smartattend/Faculty_Dashboard/Faculty_Dashboard_Screen.dart';

import 'faculty_main_navigation.dart';

class GenerateAttendanceScreen extends StatelessWidget {
  const GenerateAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generate Qr Code',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0047AB),


      ),
      body: const Center(
        child: Text("QR Generation UI Here", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
