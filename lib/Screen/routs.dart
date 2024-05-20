import 'package:flutter/material.dart';
import 'package:resume_daily_task/Screen/pdf/InvoiceScreen.dart';
import 'package:resume_daily_task/Screen/pdf/pdfScren.dart';

import 'HomePage.dart';

class AppRouts
{
  static Map<String, Widget Function(BuildContext)> routs={
       '/':(context)=>InvoiceScreen(),
      '/pdf':(context)=>PdfScreen(),
      '/home' : (context) => HomeScreen(),
  };

}