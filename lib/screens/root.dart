import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikeshop/screens/cart/cart_screnn.dart';
import 'package:nikeshop/screens/home/home_screens.dart';
import 'package:nikeshop/screens/profile/profile.dart';

class RootScreens extends StatefulWidget {
  const RootScreens({super.key});

  @override
  State<RootScreens> createState() => _RootScreensState();
}

class _RootScreensState extends State<RootScreens> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'خانه'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart), label: 'سبد خرید'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: 'پروفایل'),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: getLayOut(),
        ));
  }

  List<Widget> getLayOut() {
    return <Widget>[
      const HomeScreens(),
      const CartScreen(),
      const ProfileScreen()
    ];
  }
}
