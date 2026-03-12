import 'package:flutter/material.dart';
import 'package:smartattend/Faculty_Dashboard/Manage_Student_Screen.dart';

import '../utils/UiHelper.dart';
import 'Manage_Student_Screen.dart';


class FacultyDashboardScreen extends StatelessWidget {
  const FacultyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      UIHelper.showExitAlert(context);
      return false;
    },
     child:  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Faculty Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0047AB),



      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Card(
              child: ListTile(
                leading: const Icon(Icons.qr_code, color: Colors.blue),
                title: const Text("Generate Attendance"),
                subtitle: const Text("Create QR for lecture"),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 15),

            Card(
              child: ListTile(
                leading: const Icon(Icons.group, color: Colors.green),
                title: const Text("Manage Students"),
                subtitle: const Text("Add / Remove students"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ManageStudentsScreen()),
                  );
                },
              ),
            ),

          ],
        ),
      ),
     ),
    );
  }
}