import 'package:aplikasi_pencatatan_keuangan/page/main_page.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home : MainPage(),  
       theme: ThemeData(primaryColor: Colors.orange),// agar tema widgetnya orange
    );
  }
}