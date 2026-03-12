import 'package:flutter/material.dart';
import 'package:smartattend/Faculty_Dashboard/View_Attendance_Screen.dart';

import 'faculty_main_navigation.dart';

class ManageStudentsScreen extends StatefulWidget {
  const ManageStudentsScreen({super.key});

  @override
  State<ManageStudentsScreen> createState() =>
      _ManageStudentsScreenState();
}

class _ManageStudentsScreenState
    extends State<ManageStudentsScreen> {

  final TextEditingController nameController =
  TextEditingController();

  List<String> students = [];

  void addStudent() {
    if (nameController.text.trim().isNotEmpty) {
      setState(() {
        students.add(nameController.text.trim());
        nameController.clear();
      });
    }
  }

  void deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Students',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0047AB),


      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Student Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addStudent,
                child: const Text("Add Student"),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(students[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete,
                            color: Colors.red),
                        onPressed: () =>
                            deleteStudent(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}