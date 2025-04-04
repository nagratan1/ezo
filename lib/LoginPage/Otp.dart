import 'package:ezo/MyRoutes/myPagesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int remainingTime = 30; // Timer countdown in seconds
  Timer? timer;
  List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());
  String correctOtp = "1234"; // Simulated correct OTP for testing

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  String getEnteredOtp() {
    return otpControllers.map((controller) => controller.text).join();
  }

  void autoVerifyOtp() {
    String enteredOtp = getEnteredOtp();
    if (enteredOtp.length == 4) {
      if (enteredOtp == correctOtp) {
        Get.offNamed(MyPagesName.homePage);
      } else {
        Get.snackbar(
          "Invalid OTP",
          "The OTP you entered is incorrect.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade100,
          colorText: Colors.red,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String phoneNumber = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo
            Image.asset(
              'assets/images/logo.jpeg', // Replace with your logo asset
              height: 100,
            ),
            SizedBox(height: 16),
            Text(
              'UXB v37.7 a',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff310096),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'OTP SENT TO +91 $phoneNumber',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 32),
            // OTP input fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff310096)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: otpControllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                      autoVerifyOtp(); // Automatically verify OTP when all digits are entered
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 16),
            // Resend OTP message with timer
            if (remainingTime > 0)
              Text(
                'RESEND OTP IN $remainingTime SECONDS',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              )
            else
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    remainingTime = 30;
                  });
                  startTimer();
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xff310096)),
                ),
                child: Text(
                  'RESEND OTP',
                  style: TextStyle(color: Color(0xff310096)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
