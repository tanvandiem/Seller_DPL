import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:untitled2/dashboard.dart';
import 'package:untitled2/orderseller.dart';
import 'package:untitled2/product/product_app.dart';
import 'package:untitled2/voucher/voucher_app.dart';


class MainViewSeller extends StatefulWidget {
  const MainViewSeller({super.key});

  @override
  State<MainViewSeller> createState() => _MainViewState();
}

class _MainViewState extends State<MainViewSeller> {
  List<Widget> pages = [
    
    Dashboard(),
    
    //HomePage(),
    //CartPage(),
    //CartPage(),
    ProductsApp(),
    OrderSellerState(),
    VoucherApp(),
    //OrderPage(),
    //UserProfilePage(),
  ];
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider(
        //   create: (context) => CartViewModel(),
        //   child:
        Scaffold(
      //drawer: ConsumerDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            indexPage = value;
          });
        },
        unselectedItemColor: Colors.black26,
        useLegacyColorScheme: false,
        backgroundColor: Color.fromARGB(255, 98, 170, 212),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon:  Icon(CupertinoIcons.cube_box),
            
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_alt_circle,
            ),
            label: "Profile",
          ),
        ],
        currentIndex: indexPage,
        iconSize: 25,
        selectedFontSize: 8,
        selectedItemColor: Colors.blue.shade400,
      ),
      body: IndexedStack(
        index: indexPage,
        children: pages,
      ),
      // ),
    );
  }
}
