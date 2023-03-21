// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/shared/themes.dart';
import 'package:test_android_programming_apps/ui/screen/finances/finance_page.dart';
import 'package:test_android_programming_apps/ui/screen/homepage/home_page.dart';
import 'package:test_android_programming_apps/ui/screen/profil/profil_page.dart';
import 'package:test_android_programming_apps/ui/screen/search-news/search_news_page.dart';
import 'package:test_android_programming_apps/ui/screen/shopping/shopping_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List pages = [
    HomePage(),
    FinancePage(),
    ShoppingListPage(),
    ProfilPage(),
    SearchNewsPage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: whiteColor,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: darkColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        //Untuk styling text / label yang sedang di klik
        selectedLabelStyle: darkText.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
        //Untuk styling text / label yang sedang tidak klik
        unselectedLabelStyle: greyText.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset(
              'assets/icon_home.png',
              width: 20,
              color: currentIndex == 0 ? darkColor : greyColor,
            ),
            backgroundColor: darkColor,
          ),
          BottomNavigationBarItem(
            label: 'Finance',
            icon: Image.asset(
              'assets/icon_finance.png',
              width: 20,
              color: currentIndex == 1 ? darkColor : greyColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Shopping List',
            icon: Image.asset(
              'assets/icon_list.png',
              width: 20,
              color: currentIndex == 2 ? darkColor : greyColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profil',
            icon: Image.asset(
              'assets/icon_profile.png',
              width: 20,
              color: currentIndex == 3 ? darkColor : greyColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'News',
            icon: Image.asset(
              'assets/icon_news.png',
              width: 20,
              color: currentIndex == 4 ? darkColor : greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
