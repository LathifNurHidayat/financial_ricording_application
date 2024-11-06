import 'package:aplikasi_pencatatan_keuangan/page/category_page.dart';
import 'package:aplikasi_pencatatan_keuangan/page/home_page.dart';
import 'package:aplikasi_pencatatan_keuangan/page/transaction_page.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), CategoryPage()];
  int _currentIndex = 0;

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_currentIndex == 0)
          ? CalendarAppBar(
              accent: Colors.orange,
              backButton: false,
              locale: "id",
              onDateChanged: (value) => print(value),
              firstDate: DateTime.now().subtract(Duration(days: 150)),
              lastDate: DateTime.now(),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 45, horizontal: 16),
                  child: Text(
                    "Kategori",
                    style: GoogleFonts.montserrat(fontSize: 25),
                  ),
                ),
              )),
      body: _children[_currentIndex],
      floatingActionButton: Visibility(
        visible: _currentIndex == 0 ? true : false,
        child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                builder: (context) => TransactionPage(),
              ))
                  .then((value) {
                setState(() {});
              });
            },
            backgroundColor: Colors.orange,
            shape: CircleBorder(),
            child: Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  onTapped(0);
                },
                icon: Icon(Icons.home)),
            SizedBox(width: 100),
            IconButton(
                onPressed: () {
                  onTapped(1);
                },
                icon: Icon(Icons.list))
          ],
        ),
      ),
    );
  }
}
