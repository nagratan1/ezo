import 'package:ezo/MyRoutes/myPagesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reports',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildReportSection('1.1 Business Report', context),
          InkWell(
            onTap: (){
              Get.toNamed(MyPagesName.reportPage);
            },
            child: _buildReportSection('1.2 Day Book Report', context)),
          const SizedBox(height: 16),
          _buildSectionTitle('TRANSACTION REPORTS'),
          InkWell(
            onTap: (){
              Get.toNamed(MyPagesName.salereportpage);
            },
            child: _buildReportSection('2.1 Sale Report', context)),
          _buildReportSection('2.2 Staff Wise Sale Report', context),
          _buildReportSection('2.3 Sale Wise Profit And Loss Statement', context),
          _buildReportSection('2.4 Purchase Report', context),
          _buildReportSection('2.5 Money In Report', context),
          _buildReportSection('2.6 Money Out Report', context),
          _buildReportSection('2.7 Expense Report', context),
          _buildReportSection('2.8 Estimate Report', context),
          const SizedBox(height: 16),
          _buildSectionTitle('PARTY REPORTS'),
          _buildReportSection('3.1 Party Ledger', context),
          _buildReportSection('3.2 Party Receivable/Payable Report', context),
          _buildReportSection('3.3 Party Details Report', context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),
      ),
    );
  }

  Widget _buildReportSection(String title, BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.description,
          color: Colors.blue,
        ),
        title: Text(title),
        // onTap: () {
        //   Get.toNamed(MyPagesName.reportPage);
        //   // Handle navigation to report details
        // },
      ),
    );
  }
}

