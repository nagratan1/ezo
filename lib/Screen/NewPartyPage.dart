import 'package:flutter/material.dart';

class NewPartyPage extends StatefulWidget {
  @override
  _NewPartyPageState createState() => _NewPartyPageState();
}

class _NewPartyPageState extends State<NewPartyPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Party",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xff310096),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
           // child: Icon(Icons.whatsapp, color: Colors.green),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton("Customer", 0),
                _buildTabButton("Supplier", 1),
              ],
            ),
            SizedBox(height: 16),
            _buildTextField("Customer/Supplier Name", Icons.mic),
            SizedBox(height: 16),
            _buildTextField("Phone Number", null),
            SizedBox(height: 16),
            _buildDropdownField("Select Party Category"),
            SizedBox(height: 16),
            _buildTextField("Billing Address", Icons.mic),
            // SizedBox(height: 16),
            // _buildOptionalButton("Address (Optional)"),
            // SizedBox(height: 16),
            // _buildOptionalButton("GST and Other (Optional)"),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Save action
              },
              child: Text("SAVE",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff310096),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: _selectedTabIndex == index ? Color(0xff310096) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.purple),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: _selectedTabIndex == index ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData? icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDropdownField(String label) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      items: ["Category 1", "Category 2", "Category 3"]
          .map((category) => DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              ))
          .toList(),
      onChanged: (value) {
        // Handle selection
      },
    );
  }

  Widget _buildOptionalButton(String label) {
    return TextButton(
      onPressed: () {
        // Handle optional button action
      },
      child: Text(
        label,
        style: TextStyle(color: Colors.purple),
      ),
    );
  }
}
