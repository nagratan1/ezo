import 'package:ezo/MyRoutes/myPagesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SelectPartyPage extends StatefulWidget {
  @override
  _SelectPartyPageState createState() => _SelectPartyPageState();
}

class _SelectPartyPageState extends State<SelectPartyPage> {
  String selectedCategory = 'Category'; // Default category
  TextEditingController searchController = TextEditingController();

  // Dummy data for parties
  final List<Map<String, String>> parties = [
    {
      "name": "Ratan",
      "phone": "7236818540",
      "billingType": "REGULAR",
      "category": "CARD"
    },
    {
      "name": "Cash Sale",
      "phone": "Phone Unavailable",
      "billingType": "REGULAR",
      "category": "NO CATEGORY"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff310096),
        centerTitle: true,
        title: const Text(
          'Select Party',
          style: TextStyle(color: Colors.white),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                 SizedBox(
                  width: 140,
                  height: 40,
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    items: ['Category', 'CARD', 'NO CATEGORY']
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    ),
                  ),
                ),
                
                const SizedBox(width: 4),
                InkWell(
                  onTap: (){
                    Get.toNamed(MyPagesName.newPartyPage);
                  },
                  child: Container(
                    height: 40, 
                    width: 90, 
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Color(0xff310096))),
                  child:  Center(child: Text('New Party',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                  ),
                ),
               
                const SizedBox(width: 4),
                SizedBox(
                 width: 120,
                  height: 40,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search by Phone',
                      border: const OutlineInputBorder(),
                      
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: parties.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final party = parties[index];
                  return ListTile(
                    title: Text(
                      party['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(party['phone']!),
                        Text("Billing Type: ${party['billingType']}"),
                      ],
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
