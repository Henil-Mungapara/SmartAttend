import 'package:flutter/material.dart';
import 'package:smartattend/Student_Dashboard/student_main_navigation.dart';
import '../app_size/app_size.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {

    final double w = AppSize.width(context);
    final double h = AppSize.height(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Attendance Charts',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0047AB),


      ),
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(w * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: h * 0.03),

              Text(
                "Attendance History",
                style: TextStyle(
                  fontSize: w * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: h * 0.03),

              _subjectCard("Mathematics", "90%", w),
              _subjectCard("Physics", "80%", w),
              _subjectCard("Computer", "95%", w),

            ],
          ),
        ),
      ),
    );
  }

  Widget _subjectCard(String subject, String percent, double w) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(subject,
              style: TextStyle(
                  fontSize: w * 0.04,
                  fontWeight: FontWeight.w500)),
          Text(percent,
              style: TextStyle(
                  fontSize: w * 0.045,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0047AB))),
        ],
      ),
    );
  }
}