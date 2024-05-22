import 'package:coorg/pages/navpages/about.dart';
import 'package:coorg/pages/navpages/coming_soon_page.dart';
import 'package:coorg/pages/navpages/gallery.dart';
import 'package:coorg/pages/navpages/home.dart';
import 'package:coorg/pages/navpages/explore_coorg.dart';
import 'package:flutter/cupertino.dart';
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
    const Home(),
    ExploreCoorgPage(),
    // const CoorgTaxi(),
    //  const ComingSoon(),
    const ComingSoon(),

    GalleryPage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              icon: Icon(CupertinoIcons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.location_circle),
              label: 'Explorer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_taxi),
              label: 'TAXI',
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
