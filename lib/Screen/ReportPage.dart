import 'package:flutter/material.dart';

class ReportPagee extends StatefulWidget {
  @override
  _ReportPageeState createState() => _ReportPageeState();
}

class _ReportPageeState extends State<ReportPagee> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Report',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,)),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.picture_as_pdf),
        //     onPressed: () {
        //       // Handle PDF download
        //     },
        //   ),
        // ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Select Date Range',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Today',
                      child: Text('Today'),
                    ),
                    DropdownMenuItem(
                      value: 'Yesterday',
                      child: Text('Yesterday'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DateField(
                        label: 'Start Date',
                        selectedDate: _startDate,
                        onDateSelected: (selectedDate) {
                          setState(() {
                            _startDate = selectedDate;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DateField(
                        label: 'End Date',
                        selectedDate: _endDate,
                        onDateSelected: (selectedDate) {
                          setState(() {
                            _endDate = selectedDate;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'Day Book Report\n${_formatDate(_startDate)} to ${_formatDate(_endDate)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: ListView(
              children: [
                _buildTableHeader(),
                _buildTableRow(0, 'Sale', '₹ 0'),
                _buildTableRow(1, 'MoneyIn', '₹ 0'),
                _buildTableRow(2, 'MoneyIn | Cash', '₹ 0'),
                _buildTableRow(3, 'MoneyIn | Cheque', '₹ 0'),
                _buildTableRow(4, 'MoneyIn | Upi', '₹ 0'),
                _buildTableRow(5, 'Purchase', '₹ 0'),
                _buildTableRow(6, 'MoneyOut', '₹ 0'),
                _buildTableRow(7, 'MoneyOut | Cash', '₹ 0'),
                _buildTableRow(8, 'MoneyOut | Cheque', '₹ 0'),
                _buildTableRow(9, 'MoneyOut | Upi', '₹ 0'),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       IconButton(
          //         onPressed: () {
          //           // Handle download action
          //         },
          //         icon: const Icon(Icons.download, color: Colors.purple),
          //       ),
          //       IconButton(
          //         onPressed: () {
          //           // Handle share action
          //         },
          //         icon: const Icon(Icons.share, color: Colors.purple),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Sr No', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Particulars', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Amount', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTableRow(int srNo, String particulars, String amount) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(srNo.toString()),
          Text(particulars),
          Text(amount),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}

class DateField extends StatelessWidget {
  final String label;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DateField({
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      controller: TextEditingController(
        text: '${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year}',
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },
    );
  }
}
