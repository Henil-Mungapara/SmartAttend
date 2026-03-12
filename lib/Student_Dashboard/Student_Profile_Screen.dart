import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartattend/Student_Dashboard/student_main_navigation.dart';
import '../app_size/app_size.dart';
import '../utils/UiHelper.dart';
import '../Auth/LogIn_Screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = AppSize.width(context);
    final double h = AppSize.height(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0047AB),
        iconTheme: const IconThemeData(color: Colors.white),

      ),
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: Text("No Data Found"));
            }

            var data = snapshot.data!;
            String role = data['role'] ?? "User";

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                child: Column(
                  children: [

                    SizedBox(height: h * 0.05),

                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF0047AB),
                          width: 2,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 55,
                        backgroundColor: Color(0xFF0047AB),
                        child: Icon(
                          Icons.person,
                          size: 55,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: h * 0.02),

                    Text(
                      data['name'] ?? "",
                      style: TextStyle(
                        fontSize: w * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: h * 0.04),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: h * 0.03,
                          horizontal: w * 0.06,
                        ),
                        child: Column(
                          children: [

                            profileTile(
                              Icons.email_outlined,
                              "Email",
                              data['email'] ?? "",
                              w,
                            ),

                            SizedBox(height: h * 0.025),
                            const Divider(),
                            SizedBox(height: h * 0.02),

                            profileTile(
                              Icons.phone_outlined,
                              "Mobile",
                              data['mobile'] ?? "",
                              w,
                            ),

                            SizedBox(height: h * 0.025),
                            const Divider(),
                            SizedBox(height: h * 0.02),

                            profileTile(
                              Icons.security_outlined,
                              "Role",
                              role,
                              w,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: h * 0.06),

                    UIHelper.customButton(
                      text: "Logout",
                      onPressed: () async {
                        final prefs =
                        await SharedPreferences.getInstance();
                        await prefs.setBool('isLoggedIn', false);

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginPage()),
                              (route) => false,
                        );
                      },
                    ),

                    SizedBox(height: h * 0.06),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget profileTile(
    IconData icon, String title, String value, double w) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        icon,
        color: const Color(0xFF0047AB),
        size: w * 0.055,
      ),
      SizedBox(width: w * 0.05),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}