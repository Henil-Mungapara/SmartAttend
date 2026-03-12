import 'package:flutter/material.dart';
import '../app_size/app_size.dart';
import '../utils/UiHelper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final double w = AppSize.width(context);
    final double h = AppSize.height(context);

    return WillPopScope(
        onWillPop: () async {
      UIHelper.showExitAlert(context);
      return false;
    },
    child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0047AB),


      ),
      backgroundColor: const Color(0xFFB6BFCA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: h * 0.04),

              Center(
                child: Text(
                  "Welcome Back 👋",
                  style: TextStyle(
                    fontSize: w * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: h * 0.05),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(w * 0.05),
                decoration: BoxDecoration(
                  color: const Color(0xFF0047AB),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overall Attendance",
                      style: TextStyle(
                        fontSize: w * 0.04,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    Text(
                      "85%",
                      style: TextStyle(
                        fontSize: w * 0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}