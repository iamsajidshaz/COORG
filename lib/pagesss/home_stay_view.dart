import 'package:coorg/booking/hs_booking_entry.dart';
import 'package:coorg/pagesss/view_gallery_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeStayView extends StatefulWidget {
  final String fac1;
  final String fac2;
  final String fac3;
  final String fac4;
  final String fac5;
  final String imageOne;
  final String imageTwo;
  final String imageThree;
  final String activityOne;
  final String activityTwo;
  final String activityThree;
  final String image;
  final String label;
  final String subTitle;
  final String id;

  const HomeStayView({
    super.key,
    required this.fac1,
    required this.fac2,
    required this.fac3,
    required this.fac4,
    required this.fac5,
    required this.imageOne,
    required this.imageTwo,
    required this.imageThree,
    required this.activityOne,
    required this.activityTwo,
    required this.activityThree,
    required this.image,
    required this.label,
    required this.subTitle,
    required this.id,
  });

  @override
  State<HomeStayView> createState() => _HomeStayViewState();
}

class _HomeStayViewState extends State<HomeStayView> {
  List<String> facList = [];
  List<IconData> facIconList = [];
  List<String> imageList = [];

  @override
  void initState() {
    super.initState();
    facList = initializeFacList();
    facIconList = initializeFacIconList();
    imageList = initializeImageList();
  }

  List<String> initializeImageList() {
    return [
      widget.imageOne,
      widget.imageTwo,
      widget.imageThree,
      widget.image,
    ];
  }

  List<String> initializeFacList() {
    return [
      if (widget.fac1 == "true") 'Wifi',
      if (widget.fac2 == "true") 'AC',
      if (widget.fac3 == "true") 'Hot Water',
      if (widget.fac4 == "true") 'Breakfast',
      if (widget.fac5 == "true") 'Parking',
    ];
  }

  List<IconData> initializeFacIconList() {
    return [
      if (widget.fac1 == "true") Icons.wifi,
      if (widget.fac2 == "true") Icons.ac_unit,
      if (widget.fac3 == "true") Icons.water,
      if (widget.fac4 == "true") Icons.food_bank,
      if (widget.fac5 == "true") Icons.local_parking,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(widget.label),
      ),
      body: ListView(
        children: [
//image
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewImage(
                    imageName: widget.label,
                    imageUrl: widget.image,
                    isNetImage: "yes",
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 690.w / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // locations
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.place,
                  size: 12.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  widget.subTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),

          // rating
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 12.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "5.0",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),
//
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Divider(
                color: Colors.grey.shade300,
              ),
            ),
          ),

          // extra, images etc..

          // 1. facilities

          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
            ),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.tray,
                  color: Colors.black,
                  size: 18.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Facilities",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  //  style: Styles.headLineStyle3
                  //       .copyWith(color: Colors.black87),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          // list of facilities

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 65.h,
              // color: Colors.amber,
              child: ListView.builder(
                itemCount: facList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50.h,
                      width: 360.w * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            facIconList[index],
                            color: Colors.red,
                            size: 20.sp,
                          ),
                          Text(
                            facList[index],
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 20),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.photo,
                  size: 18.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "GALLERY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  //  style: Styles.headLineStyle3
                  //       .copyWith(color: Colors.black87),
                ),
              ],
            ),
          ),
// list of images

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 150.h,
              // color: Colors.amber,
              child: ListView.builder(
                itemCount: imageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewImage(
                                isNetImage: "yes",
                                imageUrl: imageList[index],
                                imageName: widget.label),
                          ),
                        );
                      },
                      child: Container(
                        width: 200.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(imageList[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 20),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.sportscourt,
                  size: 18.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "EXTRA ACTIVITIES",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  //  style: Styles.headLineStyle3
                  //       .copyWith(color: Colors.black87),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(Icons.arrow_right),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.activityOne,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(Icons.arrow_right),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.activityTwo,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(Icons.arrow_right),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.activityThree,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HsBookingEntry(
                        id: widget.id,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "SEND BOOKING INQUIRY",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 50,
          ),
          // Container(
          //   margin: const EdgeInsets.only(left: 25, top: 12),
          //   height: 100.h,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 12),
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: facils.length,
          //       // itemCount: 10,
          //       itemBuilder: (context, index) {
          //         final facilss = facils[index];

          //         return Padding(
          //           padding: const EdgeInsets.only(top: 8.0, right: 12),
          //           child: Container(
          //             width: 125.w,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10.sp),
          //               image: DecorationImage(
          //                   image:
          //                       AssetImage("assets/images/richberry_three.jpg"),
          //                   fit: BoxFit.cover),
          //               color: Colors.green,
          //             ),
          //             child: Center(
          //               child: Text(facilss),
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),

          // 3. get direction

          // Container(
          //   height: 50.h,
          //   width: 50.w,
          //   color: Colors.amber,
          // ),

          // 4. book now
        ],
      ),
    );
  }
}
