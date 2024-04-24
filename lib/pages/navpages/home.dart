import 'package:coorg/components/destination_list.dart';
import 'package:coorg/components/place_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../settings_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List _placesList = [
    'Abbey Falls',
    'Madikeri Fort',
    'Mallalli Falls',
    'Golden Temple',
    'Harangi Dam',
    'Mandalpatti Peak',
    'backwater',
    'irpu',
    'kotebetta',
    'rajas_tomb',
    'talakaveri',
    'KoteyAbbey Falls',
    'Dubare Camp',
    'Kaveri Nisargadhama',
    'Omkareshwara Temple',
    'ChikliHole Dam',
  ];
  final List _places_images = [
    "assets/images/abbey_falls.jpg",
    "assets/images/madikeri_fort.jpg",
    "assets/images/mallalli_falls.jpg",
    "assets/images/golden_temple.jpg",
    "assets/images/harangi_dam.jpg",
    "assets/images/mandalpatti.jpg",
    "assets/images/backwater.jpg",
    "assets/images/irpu.jpg",
    "assets/images/kotebetta.jpg",
    "assets/images/rajas_tomb.jpg",
    "assets/images/talakaveri.jpg",
    "assets/images/kotte_abbi_falls.jpg",
    "assets/images/dubare.jpg",
    "assets/images/nisargadhama.jpg",
    "assets/images/omkareshwara_temple.jpg",
    "assets/images/chiklihole.jpg",
  ];

  final List _desc = [
    // Abbey Falls
    "Abbey Falls is a waterfall in Kodagu, in the Western Ghats of Karnataka, India. It is located 8 km from the Madikeri, 122 km from Mysore, 144 km from Mangalore and 268 km from Bangalore.",
    //madikeri_fort
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",
    //mallalli_falls
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //golden_temple
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //harangi_dam
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //mandalpatti
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //backwater
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //irpu
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //kotebetta
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //rajas_tomb
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //talakaveri
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //kotte_abbi_falls
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //dubare
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //nisargadhama
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //omkareshwara_temple
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",

    //chiklihole
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non odio euismod lacinia at. Lorem mollis aliquam ut porttitor leo a diam. Sit amet cursus sit amet dictum sit amet justo donec. Nibh sed pulvinar proin gravida hendrerit lectus. In arcu cursus euismod quis viverra nibh cras pulvinar. Mauris cursus mattis molestie a iaculis at. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper. Proin fermentum leo vel orci. Morbi tempus iaculis urna id volutpat lacus laoreet non. Viverra maecenas accumsan lacus vel facilisis volutpat est. Euismod lacinia at quis risus.\n \nNam at lectus urna duis convallis convallis. Tempus quam pellentesque nec nam aliquam. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Parturient montes nascetur ridiculus mus mauris vitae ultricies. Feugiat in ante metus dictum. Ultrices in iaculis nunc sed augue. Eget est lorem ipsum dolor. Sed arcu non odio euismod lacinia at quis risus. Elit at imperdiet dui accumsan sit amet nulla. A erat nam at lectus urna. Amet risus nullam eget felis eget nunc lobortis. Scelerisque purus semper eget duis at tellus. Egestas purus viverra accumsan in nisl nisi scelerisque.",
  ];

  final List _colorsList = [
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.blueAccent,
    Colors.yellow,
    Colors.purple,
  ];
  final List _destinationList = [
    'dest 1',
    'dest 2',
    'dest 3',
    'dest 4',
    'dest 5',
    'dest 6',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // top header

        // welcome
        // Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: Row(children: [
        //     // image
        //     Image.asset(
        //       "assets/images/avatar.png",
        //       height: 50,
        //       width: 50,
        //     ),
        //     const SizedBox(
        //       width: 10,
        //     ),

        //     //welcome to coorg
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           "Welcome to",
        //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //         ),
        //         Text(
        //           "Coorg The Explorer",
        //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //         ),
        //       ],
        //     ),
        //     Spacer(),

        //     // settings icon
        //     Icon(CupertinoIcons.settings),
        //     const SizedBox(
        //       width: 10,
        //     ),
        //   ]),
        // ),

        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Icon(CupertinoIcons.home),

              // text
              const Text(
                "C O O R G   E X P L O R E R",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              // icon
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                },
                icon: Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            'Where do you want',
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            'to go?',
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // search bar
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xfff4f6fd),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.search,
                  color: Color(0xffBFC205),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 10, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore places',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  setState(() {});
                },
                child: Text(
                  'View All',
                  // style: Styles.textStyle.copyWith(
                  //   color: Styles.primaryColor,
                  // ),
                ),
              ),

              // list places
            ],
          ),
        ),

        // places
        Container(
          margin: const EdgeInsets.only(left: 25, top: 12),
          height: 280,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _placesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12),
                  child: PlacesList(
                    text: _placesList[index],
                    image: _places_images[index],
                    desc: _desc[index],
                  ),
                );
              },
            ),
          ),
        ),

        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Destinations',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  setState(() {});
                },
                child: Text(
                  'View All',
                  // style: Styles.textStyle.copyWith(
                  //   color: Styles.primaryColor,
                  // ),
                ),
              ),

              // list destinatpon places
            ],
          ),
        ),

        // destination places

        Container(
          margin: const EdgeInsets.only(left: 25, top: 12),
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ListView.builder(
              itemCount: _placesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12),
                  child: DestinationsList(
                    text: _placesList[index],
                    image: _places_images[index],
                  ),
                );
              },
            ),
          ),
        ),
        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
          child: Text(
            'Announcements...',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // banner images
        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 25, right: 12),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/raja_seat.jpg"),
                fit: BoxFit.cover,
              ),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        // powered by
        Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Text(
              'Made with ❤ by ShazTech',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
