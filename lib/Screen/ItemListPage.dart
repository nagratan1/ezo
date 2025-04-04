import 'package:ezo/MyRoutes/myPagesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  // This variable will track the currently active tab
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Item List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff310096),
      ),
      body: Column(
        children: [
          // Tabs
          Container(
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedTabIndex = 0; // Switch to "INVENTORY" tab
                      });
                    },
                    child: Text(
                      'INVENTORY (1)',
                      style: TextStyle(
                        color: _selectedTabIndex == 0 ? Colors.purple : Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedTabIndex = 1; // Switch to "CATEGORIES" tab
                      });
                    },
                    child: Text(
                      'CATEGORIES',
                      style: TextStyle(
                        color: _selectedTabIndex == 1 ? Colors.purple : Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content for tabs
          Expanded(
            child: _selectedTabIndex == 0
                ? _buildInventoryTab() // Inventory content
                : _buildCategoriesTab(), // Categories content
          ),
        ],
      ),
       floatingActionButton:  _selectedTabIndex ==0?
      FloatingActionButton.extended(
        onPressed: (){
         Get.toNamed(MyPagesName.newItemPage);
          
        },
        backgroundColor: Color(0xff310096),
        label: const Text('NEW ITEM',style: TextStyle(color: Colors.white),),
                  icon: const Icon(Icons.add,color: Colors.white,),
       
      ):FloatingActionButton.extended(
        onPressed: (){
         Get.toNamed(MyPagesName.newPartyCategoryPage);

          

        },
        backgroundColor: Color(0xff310096),
        label: const Text('NEW CUSTOMER/PARTY',style: TextStyle(color: Colors.white),),
                  icon: const Icon(Icons.add,color: Colors.white,),
       
      )
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Get.toNamed(MyPagesName.newItemPage);
      //   },
      //   label: Text(
      //     'NEW ITEM',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   icon: Icon(Icons.add, color: Colors.white),
      //   backgroundColor: Colors.blue,
      // ),
    );
  }

  Widget _buildInventoryTab() {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            leading: Image.network(
              'https://static.toiimg.com/thumb/61050397.cms?width=1200&height=900',
              width: 80,
              height: 60,
            ),
            title: Text(
              'Samosa',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('₹ 15', style: TextStyle(color: Colors.green)),
                Text(
                  'Current Stock: 0',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.star, color: Colors.yellow),
                  onPressed: () {
                    // Favorite action
                  },
                ),
              ],
            ),
          ),
        ),
        // Add more inventory items as needed
      ],
    );
  }

  Widget _buildCategoriesTab() {
    return Center(
      child: Text('No categories available.'),
    );
  }
}
