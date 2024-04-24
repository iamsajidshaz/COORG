import 'package:coorg/components/bottom_nav_bar.dart';
import 'package:coorg/pages/navpages/about.dart';
import 'package:coorg/pages/navpages/gallery.dart';
import 'package:coorg/pages/navpages/home.dart';
import 'package:flutter/material.dart';

import '../components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    Home(),
    // Container(
    //   color: Colors.blue,
    // ),
    GalleryPage(),
    // about us page
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      // appBar: AppBar(
      //   title: Padding(
      //     padding: const EdgeInsets.only(left: 12.0),
      //     child: const Text(
      //       "C O O R G   E X P L O R E R",
      //       style: TextStyle(fontWeight: FontWeight.bold),
      //     ),
      //   ),
      //   centerTitle: true,
      //   // leading: Icon(CupertinoIcons.home),
      //   backgroundColor: Theme.of(context).colorScheme.background,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 12.0),
      //       child: IconButton(
      //         onPressed: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const SettingsPage()));
      //         },
      //         icon: Icon(CupertinoIcons.suit_heart_fill),
      //       ),
      //     )
      //   ],
      // ),
      drawer: MyDrawer(),
      body: _pages[_selectedIndex],
    );
  }
}
