


import 'package:ezo/LoginPage/LoginPage.dart';
import 'package:ezo/LoginPage/Otp.dart';
import 'package:ezo/MyRoutes/myPagesName.dart';
import 'package:ezo/Screen/ExpenseListPage.dart';
import 'package:ezo/Screen/HomePage.dart';
import 'package:ezo/Screen/MoneyInListPage.dart';
import 'package:ezo/Screen/MoneyInPage.dart';
import 'package:ezo/Screen/MoneyInoutListPage.dart';
import 'package:ezo/Screen/NewItemPage.dart';
import 'package:ezo/Screen/NewPartyCategoryPage.dart';
import 'package:ezo/Screen/NewPartyPage.dart';
import 'package:ezo/Screen/ProfilePage.dart';
import 'package:ezo/Screen/ReportPage.dart';
import 'package:ezo/Screen/ReportsPage.dart';
import 'package:ezo/Screen/SelectPartyPage.dart';
import 'package:ezo/Screen/saleReportPage.dart';
import 'package:ezo/SplashScreen/SplashScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MyRoute {
  static List<GetPage> get list => [
    GetPage(name: MyPagesName.splash, page: () => SplashScreen()),
    GetPage(name: MyPagesName.loginPage, page: ()=>LoginPage()),
    GetPage(name: MyPagesName.otpPage, page: ()=>OtpPage()),
    GetPage(name: MyPagesName.homePage, page: ()=>MainPage()),
    GetPage(name: MyPagesName.newPartyPage, page: ()=>NewPartyPage()),
    GetPage(name: MyPagesName.newPartyCategoryPage, page: ()=>NewPartyCategoryPage()),
    GetPage(name: MyPagesName.newItemPage, page: ()=>NewItemPage()),
    GetPage(name: MyPagesName.profilePage, page: ()=>ProfilePage()),
    GetPage(name: MyPagesName.reportPage, page: ()=>ReportPagee()),
    GetPage(name: MyPagesName.reportsPage, page: ()=>ReportsPage()),
    GetPage(name: MyPagesName.salereportpage, page: ()=>Salereportpage()),
    GetPage(name: MyPagesName.moneyInListPage, page: ()=>MoneyInListPage()),
    GetPage(name: MyPagesName.moneyInPage, page: ()=>MoneyInPage()),
    GetPage(name: MyPagesName.moneyInoutListPage, page: ()=>MoneyInoutListPage()),
    GetPage(name: MyPagesName.expenseListPage, page: ()=>ExpenseListPage()),
    GetPage(name: MyPagesName.selectPartyPage, page: ()=>SelectPartyPage()),
    
        
        
        
        
        
        
        
        ];}