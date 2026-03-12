import 'package:flutter/material.dart';
import 'package:smartattend/Student_Dashboard/student_main_navigation.dart';
import '../app_size/app_size.dart';
import '../utils/UiHelper.dart';

class ScanQRPage extends StatelessWidget {
  const ScanQRPage({super.key});

  @override
  Widget build(BuildContext context) {

    final double w = AppSize.width(context);
    final double h = AppSize.height(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan Qr Code',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0047AB),


      ),
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.06),
          child: Column(
            children: [

              SizedBox(height: h * 0.05),

              Text(
                "Scan QR Code",
                style: TextStyle(
                  fontSize: w * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: h * 0.08),

              Container(
                height: h * 0.35,
                width: h * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF0047AB), width: 3),
                ),
                child: const Center(
                  child: Icon(Icons.qr_code_scanner, size: 80),
                ),
              ),

              const Spacer(),

              UIHelper.customButton(
                text: "Start Scanning",
                onPressed: () {
                  UIHelper.showSnackBar(context, "Scanner Coming Soon");
                },
              ),

              SizedBox(height: h * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}