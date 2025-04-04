import 'package:ezo/MyRoutes/myPagesName.dart';
import 'package:ezo/costent/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: CustomAppBar(
        title: 'Home',
        isBackButtonVisible: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
           Container(
            height: 100,
            //color: Colors.white,
             child: ListView.builder(
              itemCount: 5, 
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
               return Column(
                 children: [
                   InkWell(
                    onTap: (){
                      index==0?
                      Get.toNamed(MyPagesName.reportsPage):null;
                    },
                     child: Container(
                      margin: EdgeInsets.all(5),
                      height: 70, 
                      width: 220, 
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9),border: Border.all(color: Colors.black)),
                      child: ListTile(
                        subtitle: Text('Check Reports',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        title: Text(' Reports',),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                      )
                     ),
                   )
                 ],
               );
             },),
           ),
         
         Container(
          margin: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height/8, 
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9),color:Colors.white),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/8, 
                width: MediaQuery.of(context).size.width/4,
                 decoration: BoxDecoration(border: null, borderRadius: BorderRadius.only(topLeft: Radius.circular(9),bottomLeft: Radius.circular(9)),color:Colors.black,image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1399565382/photo/young-happy-mixed-race-businessman-standing-with-his-arms-crossed-working-alone-in-an-office.jpg?s=612x612&w=0&k=20&c=buXwOYjA_tjt2O3-kcSKqkTp2lxKWJJ_Ttx2PhYe3VM=',),fit:BoxFit.cover),),),
                
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Grow Dhand',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                    Text('Rank #1 On',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200),),
                    SizedBox(height: 10,),
                    Container(
                      height: MediaQuery.of(context).size.height/28, 
                      width: MediaQuery.of(context).size.width/1.5, 
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.green),
                      child: Row(
                        children: [
                          Text('    Check Your Google Score Now  ',style: TextStyle(color: Colors.white),),
                          Icon(Icons.arrow_forward,size: 18,color: Colors.white ,)
                        ],
                      ),
                    )
                  ],
                ),
              )
         
            ],
          ),
         ),
         
         Padding(
           padding: const EdgeInsets.all(12.0),
           child: Text('RECENT TRANSACTIONS',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
         )
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  ' Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              // Handle Dashboard navigation
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Reports'),
            onTap: () {
              Get.toNamed(MyPagesName.reportsPage);
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.group),
            title: Text('Sale List'),
            children: [
              ListTile(
                leading: Icon(Icons.local_activity),
                title: Text('Sale Return'),
                onTap: () {
                  // Handle Active Vendors navigation
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.delete),
              //   title: Text('Deleted Vendors'),
              //   onTap: () {
              //     // Handle Deleted Vendors navigation
              //   },
              // ),
            ],
          ),
          
          ExpansionTile(
            leading: Icon(Icons.inventory),
            title: Text('Purchase List'),
            children: [
              ListTile(
                leading: Icon(Icons.inventory),
                title: Text('Purchase Return'),
                onTap: () {
                  Get.toNamed(MyPagesName.expenseListPage);
                  // Handle Vendors Inventory navigation
                },
              ),
              
              
            ],
          ),
           ListTile(
                leading: Icon(Icons.inventory),
                title: Text('Estimate List'),
                onTap: () {
                  Get.toNamed(MyPagesName.expenseListPage);
                },
              ),
         
          ListTile(
            leading: Icon(Icons.currency_rupee_sharp),
            title: Text('Money List'),
            onTap: () {
              Get.toNamed(MyPagesName.moneyInListPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.notification_add),
            title: Text('Money Out List'),
            onTap: () {
            Get.toNamed(MyPagesName.moneyInoutListPage);
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.feedback_outlined),
            title: Text('Ratings & Feedback'),
            children: [
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Ratings & Feedback'),
                onTap: () {
                  // Handle Ratings & Feedback navigation
                },
              ),
              ListTile(
                leading: Icon(Icons.report_problem, color: Colors.red),
                title: Text('Complaint'),
                onTap: () {
                  // Handle Complaint navigation
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}