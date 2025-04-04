import 'package:ezo/MyRoutes/myPagesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MoneyInoutListPage extends StatelessWidget {
  const MoneyInoutListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MoneyIn Out List',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        leading: InkWell(
          
          onTap: (){
                        Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,)),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             DropdownButtonFormField<String>(
               value: 'Today',
               items: ['Today', 'Yesterday', 'Custom']
                   .map((e) => DropdownMenuItem(
                         value: e,
                         child: Text(e),
                       ))
                   .toList(),
               onChanged: (value) {},
               decoration: InputDecoration(
                 //labelText: 'Select Date',
                 border: OutlineInputBorder(),
               ),
             ),
             SizedBox(height: 10,),
            Row(
              children: [
               
                //const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: '19/03/25',
                    items: ['19/03/25']
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      labelText: 'Start Date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: '19/03/25',
                    items: ['19/03/25']
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      labelText: 'End Date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
           Row(
  children: [
    Container(
      height: 55,
      width: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('  Amount'),
          Text('  ₹ 0',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
        ],
      ),
    ),
    const SizedBox(width: 10),
    Expanded(
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('   Count'),
            Text('  0',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    ),
    const SizedBox(width: 10),
    Container(
      height: 55,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.grey
      ),
      child: Icon(Icons.delete_forever),
    ),
  ],
),

         
         
         
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: 'Filter',
              items: ['Filter']
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'Filter',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(MyPagesName.moneyInPage);
        },
        label: Text('New Money In',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
    );
  }


}