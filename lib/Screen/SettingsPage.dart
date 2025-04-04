import 'package:ezo/MyRoutes/myPagesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of settings
    final List<String> settings = [
      "Profile Settings",
      "Billing Settings",
      "Print Settings",
      "Loyalty Discount Settings",
      "Get More Customers Setting",
      "Staff Setting",
      "Upload Data",
      "Upload Parties",
      
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff310096),
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: settings.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ElevatedButton(
              onPressed: () {
                index==0?
                Get.toNamed(MyPagesName.profilePage):null;
                // Handle button press here
                //debugPrint("${settings[index]} pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff310096),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                "${index + 1}. ${settings[index]}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: SettingsPage()));
