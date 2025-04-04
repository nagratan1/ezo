import 'package:flutter/material.dart';

class MoneyInPage extends StatefulWidget {
  @override
  _MoneyInPageState createState() => _MoneyInPageState();
}

class _MoneyInPageState extends State<MoneyInPage> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set the default date to the current date
    _dateController.text = _formatDate(DateTime.now());
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  Future<void> _selectDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _dateController.text = _formatDate(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MoneyIn',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff310096),
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
            TextField(
              decoration: const InputDecoration(
                labelText: 'Receipt No',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              controller: TextEditingController(), // Add actual logic if needed
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'Money In Date',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: _selectDate, // Trigger the date picker
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Customer/Supplier Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Amount Received',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('UPI/Bank/POS'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xff310096),
                    side: const BorderSide(color: Colors.black38),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Cash'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xff310096),
                    side: const BorderSide(color: Colors.black38),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Cheque'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xff310096),
                    side: const BorderSide(color: Colors.black38),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Save',style:TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff310096),
      ),
    );
  }
}
