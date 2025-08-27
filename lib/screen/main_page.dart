import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screen/account_view.dart';
import 'package:shop_app/screen/cart_view.dart';
import 'package:shop_app/screen/home_view.dart';
import 'package:shop_app/screen/save_view.dart';
import 'package:shop_app/screen/search_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int activeIndex = 0;
  List<Widget> views = [
    HomeView(),
    SaveView(),
    SearchView(),
    CartView(),
    AccountView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int value) {
            setState(() {
              activeIndex = value;
            });
          },
          currentIndex: activeIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "Save"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout_outlined),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_alt_circle),label: "Me"),
          ]),
    );
  }
}
