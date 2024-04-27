import 'package:coorg/components/bottom_nav_bar.dart';
import 'package:coorg/pages/navpages/about.dart';
import 'package:coorg/pages/navpages/gallery.dart';
import 'package:coorg/pages/navpages/home.dart';
import 'package:flutter/material.dart';

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
    GalleryPage(),
    // about us page
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      // bottomNavigationBar:
      // MyBottomNavBar(
      //   onTabChange: (index) => navigateBottomBar(index),
      // ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.background,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: _selectedIndex,
          onTap: (index) {
            // Respond to item press.
            navigateBottomBar(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_album_rounded),
              label: 'GALLERY',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'ABOUT',
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
