import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coorg/utils/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';

import '../../components/home_stays.dart';
import '../../utils/home_stay_list.dart';
// import '../../utils/home_stay_list.dart';

class ExploreCoorgPage extends StatefulWidget {
  ExploreCoorgPage({super.key});

  @override
  State<ExploreCoorgPage> createState() => _ExploreCoorgPageState();
}

class _ExploreCoorgPageState extends State<ExploreCoorgPage> {
  List<HomeStays> homestays = allHomeStays;
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();

    //Load a banner ad
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          //  print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 25, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Icon(
                CupertinoIcons.location_circle,
                size: 24.sp,
              ),

              // text
              Text(
                "E X P L O R E   C O O R G",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
              ),

              // icon
              IconButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const SettingsPage()));
                },
                icon: Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.transparent,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
        // gap
        SizedBox(
          height: 20.h,
        ),
        //
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            textAlign: TextAlign.center,
            'Find the best place to stay',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
        ),
        // search bar
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            //on tap
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SearchPlaces()),
              // );
            },
            //
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfff4f6fd),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              //  margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.search,
                    color: const Color.fromARGB(255, 19, 19, 18),
                    size: 24.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Homestays, Hotels, Resorts in Coorg',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
// banner ad
        if (_bannerAd != null)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              width: _bannerAd!.size.width.toDouble().w,
              height: _bannerAd!.size.height.toDouble().h,
              child: AdWidget(ad: _bannerAd!),
            ),
          ),
//
        // 1. home stays / resorts

        // header
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 25, right: 25),
          child: Text(
            'Home Stays',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          ),
        ),

        //  homestay listing
        Container(
          margin: const EdgeInsets.only(left: 10, top: 12),
          height: 210.h,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Homestays')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var homestay = snapshot.data!.docs[index];

                    return HomeStaysList(
                      image: homestay['image_one'],
                      label: homestay['Name'],
                      subTitle: homestay['Location'],
                      imageOne: homestay['image_two'],
                      imageTwo: homestay['image_three'],
                      imageThree: homestay['image_four'],
                      fac1: homestay['fac1'],
                      fac2: homestay['fac2'],
                      fac3: homestay['fac3'],
                      fac4: homestay['fac4'],
                      fac5: homestay['fac5'],
                    );
                  },
                );
              },
            ),
          ),
        ),

        // === END of home stay list ================================================

// 2. Rooms
        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
          child: Text(
            'Rooms and Lodges',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          ),
        ),
        // list
        Container(
          margin: const EdgeInsets.only(left: 25, top: 12),
          height: 150.h,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12),
                  child: Container(
                    width: 300.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Text("Coming Soon"),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // 3. Food Spots
        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
          child: Text(
            'Food Spots',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          ),
        ),

        // list
        Container(
          margin: const EdgeInsets.only(left: 25, top: 12),
          height: 200.h,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12),
                  child: Container(
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.orangeAccent,
                    ),
                    child: const Center(
                      child: Text("Coming Soon"),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // 4. Special in Coorg
        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
          child: Text(
            'More in Coorg',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          ),
        ),

        // list
        Container(
          margin: const EdgeInsets.only(left: 25, top: 12),
          height: 180.h,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12),
                  child: Container(
                    width: 250.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.blueGrey,
                    ),
                    child: const Center(
                      child: Text("Coming Soon"),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        ///-------------------------------------------------------

        SizedBox(
          height: 50.h / 2,
        ),
        //
        SizedBox(
          width: 360.w,
          height: 180.h,
          child: Lottie.asset('assets/images/stayloading_anim.json'),
        ),

        SizedBox(
          height: 10.h / 2,
        ),
        //

        // // 2. Rooms
        // // header
        // Padding(
        //   padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
        //   child: Text(
        //     'Rooms and Lodges',
        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
        //   ),
        // ),

        // // list
        // Container(
        //   margin: const EdgeInsets.only(left: 25, top: 12),
        //   height: 150.h,
        //   child: Padding(
        //     padding: const EdgeInsets.only(right: 12),
        //     child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: 10,
        //       itemBuilder: (context, index) {
        //         return Padding(
        //           padding: const EdgeInsets.only(top: 8.0, right: 12),
        //           child: Container(
        //             width: 200.w,
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10.sp),
        //               color: Colors.green,
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }

  /// Loads and shows a banner ad.
  ///
  /// Dimensions of the ad are determined by the AdSize class.
  // void _loadAd() async {
  //   BannerAd(
  //     adUnitId: _adUnitId,
  //     request: const AdRequest(),
  //     size: AdSize.fullBanner,
  //     listener: BannerAdListener(
  //       // Called when an ad is successfully received.
  //       onAdLoaded: (ad) {
  //         setState(() {
  //           _bannerAd = ad as BannerAd;
  //         });
  //       },
  //       // Called when an ad request failed.
  //       onAdFailedToLoad: (ad, err) {
  //         ad.dispose();
  //       },
  //       // Called when an ad opens an overlay that covers the screen.
  //       onAdOpened: (Ad ad) {},
  //       // Called when an ad removes an overlay that covers the screen.
  //       onAdClosed: (Ad ad) {},
  //       // Called when an impression occurs on the ad.
  //       onAdImpression: (Ad ad) {},
  //     ),
  //   ).load();
  // }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
