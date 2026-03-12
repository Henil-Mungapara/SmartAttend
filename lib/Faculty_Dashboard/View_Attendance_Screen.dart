import 'package:flutter/material.dart';
import 'package:smartattend/Faculty_Dashboard/Generate_QrScreen.dart';
import 'package:smartattend/Faculty_Dashboard/faculty_main_navigation.dart';

class ViewAttendanceScreen extends StatelessWidget {
  const ViewAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View Attendance',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0047AB),


      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text("Student ${index + 1}"),
            trailing: const Text(
              "Present",
              style: TextStyle(color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}