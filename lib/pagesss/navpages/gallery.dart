import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/single_gallery_item.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({super.key});

  final List _galleryImages = [
    "assets/images/raja_seat.jpg",
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
  final List _placesList = [
    'Raja Seat',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COORG GALLERY",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),
        leading: Icon(
          CupertinoIcons.photo_on_rectangle,
          size: 24.sp,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _galleryImages.length,
        itemBuilder: (BuildContext context, int index) {
          return GalleryItem(
            image: _galleryImages[index],
            imagePlace: _placesList[index],
          );
        },
      ),
    );
  }
}
