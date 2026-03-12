import 'package:flutter/material.dart';

class Admin_Profile_Screen extends StatelessWidget {
  const Admin_Profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Admin Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0047AB),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [

            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF0047AB),
              child: Icon(Icons.person,
                  size: 50, color: Colors.white),
            ),

            SizedBox(height: 20),

            Text(
              "Admin Name",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5),

            Text("admin@smartattend.com"),

            SizedBox(height: 30),

            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit Profile"),
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}