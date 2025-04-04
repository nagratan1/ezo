import 'package:ezo/MyRoutes/myPagesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartyListPage extends StatefulWidget {
  @override
  State<PartyListPage> createState() => _PartyListPageState();
}

class _PartyListPageState extends State<PartyListPage> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedTabIndex = 0;

  // Update the selected tab index
  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  // Tab-specific content
  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildAllContent();
      case 1:
        return _buildJeeContent();

      default:
        return SizedBox.shrink();
    }
  }

  Widget _buildAllContent() {
    return ListView.builder(
      itemCount: 1,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
            child: Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: Icon(Icons.account_circle, color: Colors.grey),
                  title: Text('Cash Sale'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Phone Unavailable'),
                      Text('Billing Type: REGULAR'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.call, color: Colors.yellow),
                      SizedBox(width: 8),
                      Icon(Icons.abc, color: Colors.green),
                      SizedBox(width: 8),
                      Icon(Icons.star, color: Colors.orange),
                    ],
                  ),
                ),
              ),
           
           
            
         
          ),
        );
      },
    );
  
  
  }

  Widget _buildJeeContent() {
    return ListView.builder(
      itemCount: 1,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
            child: Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //SizedBox(width: 10,),
                    
                        Text('Card'),
                        Icon(Icons.check_outlined,color:Colors.green)
                        
                      ],
                    ),
                  ),
                )
                
              
              ),
           
           
            
         
          ),
        );
      },
    );
  
  
  }

  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(
          "Party List",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTab(
                        label: "PARTIES(2)",
                        isSelected: _selectedTabIndex == 0,
                        onTap: () => _onTabSelected(0),
                      ),
                      CustomTab(
                        label: "CATEGORIES",
                        isSelected: _selectedTabIndex == 1,
                        onTap: () => _onTabSelected(1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
      floatingActionButton:  _selectedTabIndex ==0?
      FloatingActionButton.extended(
        onPressed: (){
         Get.toNamed(MyPagesName.newPartyPage);
          
        },
        backgroundColor: Colors.blue,
        label: const Text('ADD CUSTOMER/PARTY',style: TextStyle(color: Colors.white),),
                  icon: const Icon(Icons.add,color: Colors.white,),
       
      ):FloatingActionButton.extended(
        onPressed: (){
         Get.toNamed(MyPagesName.newPartyCategoryPage);

          

        },
        backgroundColor: Colors.blue,
        label: const Text('NEW CUSTOMER/PARTY',style: TextStyle(color: Colors.white),),
                  icon: const Icon(Icons.add,color: Colors.white,),
       
      )
    );
  }
}

class CustomTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  CustomTab({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.1,
        height: MediaQuery.of(context).size.height / 19,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          
          color: isSelected ? Colors.blue : Colors.white,
          border: Border.all(color: Colors.black38),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
