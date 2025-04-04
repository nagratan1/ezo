import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff310096),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Edit Image',
                  style: TextStyle(color: Color(0xff310096)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Bill Book',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Select Industry',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'industry1',
                  child: Text('Industry 1'),
                ),
                DropdownMenuItem(
                  value: 'industry2',
                  child: Text('Industry 2'),
                ),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            _buildTextField('Business Name'),
            const SizedBox(height: 16),
            _buildTextField('Contact Person Name'),
            const SizedBox(height: 16),
            _buildTextField('Contact Person Phone', initialValue: '7236818570'),
            const SizedBox(height: 16),
            _buildTextField('Contact Person Email'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff310096),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Save',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {String? initialValue}) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.mic),
          onPressed: () {},
        ),
      ),
    );
  }
}


