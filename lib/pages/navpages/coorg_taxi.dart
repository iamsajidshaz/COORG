import 'package:coorg/pages/taxipage_detailed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';

class CoorgTaxi extends StatefulWidget {
//  final TabController tabController;
  const CoorgTaxi({
    super.key,
    // required this.tabController,
  });

  @override
  State<CoorgTaxi> createState() => _CoorgTaxiState();
}

class _CoorgTaxiState extends State<CoorgTaxi> {
  BannerAd? _bannerAd;

  // test banned ad id
  final String _adUnitId = 'ca-app-pub-3940256099942544/6300978111';

  // my banner ad id
  // final String _adUnitId = 'ca-app-pub-5026929321885207/6789224225';

  /// Declare this variable
  // late int selectedRadioTile;
  // late int selectedRadio;

  @override
  void initState() {
    super.initState();
    _loadAd();
    // selectedRadio = 0;
    // selectedRadioTile = 0;
  }

  // setSelectedRadioTile(int val) {
  //   setState(() {
  //     selectedRadioTile = val;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Icon(
                Icons.local_taxi,
                size: 24.sp,
              ),

              // text
              Text(
                "C O O R G    T A X I",
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
                  Icons.local_taxi,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
        //

        // Your Partner in Transportation
        // gap
        SizedBox(
          height: 10.h,
        ),
        //
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 25),
              child: Text(
                textAlign: TextAlign.start,
                'Rent a Car Anytime',
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 25),
              child: Text(
                textAlign: TextAlign.start,
                'Anywhere',
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

//gap
        SizedBox(
          height: 15.h,
        ),
        //

        // aniation lottie
        // SizedBox(
        //   width: 360.w,
        //   height: 180.h,
        //   child: Lottie.asset('assets/images/taxi_anim_lottie.json'),
        // ),

        // 1. List Taxis

        // header
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 5, right: 25),
          child: Text(
            'Our Taxi Partners',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          ),
        ),

// tab bars

        // Container(
        //   child: TabBar(
        //     controller: TabController,
        //   ),
        // ),

// end of tab bar

        //  List taxis
        Container(
          margin: const EdgeInsets.only(left: 25, top: 12),
          height: 180.h,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                // final homestay = homestays[index];
                return GestureDetector(
                  //
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TaxiPageDetailed(
                          image: "assets/images/inovaone.jpeg",
                          owner: "Saleem Taxi Suntikoppa",
                          car: "Toyota Innova",
                          ratenonac: "20",
                          rateac: "22",
                        ),
                      ),
                    );
                  },
                  //
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 250.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            color: Colors.grey.shade200,
                            image: const DecorationImage(
                              image: AssetImage("assets/images/inovaone.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 250.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      CupertinoIcons.person_alt_circle,
                                      size: 12.sp,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Saleem Taxi, Suntikoppa",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      CupertinoIcons.car_fill,
                                      size: 12.sp,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Toyota Innova, 7 Seater",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.currency_rupee,
                                      size: 12.sp,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "₹20/KM (₹22 with A/C)",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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

        // aniation lottie
        SizedBox(
          width: 360.w,
          height: 180.h,
          child: Lottie.asset('assets/images/taxi_anim.json'),
        ),

        if (_bannerAd != null)
          SizedBox(
            width: _bannerAd!.size.width.toDouble().w,
            height: _bannerAd!.size.height.toDouble().h,
            child: AdWidget(ad: _bannerAd!),
          ),
        // // powered by
        // Padding(
        //   padding:
        //       const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
        //   child: Center(
        //     child: Text(
        //       'Made with ❤ by ShazTech',
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
        //     ),
        //   ),
        // ),

        // // 2. your custom booking

        // // header
        // Padding(
        //   padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        //   child: Text(
        //     'Customize your Taxi booking',
        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        //   ),
        // ),
        // //
        // Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: Container(
        //     padding: const EdgeInsets.all(30.0),
        //     margin: const EdgeInsets.all(12.0),
        //     height: 600,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: Colors.white,
        //     ),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           "1. Enter your pickup location",
        //           style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         TextField(
        //           decoration: InputDecoration(
        //               hintText: "Pickup Location...",
        //               border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(12))),
        //         ),
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         Text(
        //           "2. Select your Trip Type",
        //           style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         // This goes to the build method
        //         RadioListTile(
        //           value: 1,
        //           groupValue: selectedRadioTile,
        //           title: Text("Sight Seeing"),
        //           subtitle: Text(
        //               "One Day package, picup and drop to your stay location"),
        //           onChanged: (val) {
        //             print("Radio Tile pressed $val");
        //             setSelectedRadioTile(val!);
        //           },
        //           activeColor: Colors.red,
        //           // secondary: OutlinedButton(
        //           //   child: Text("Say Hi"),
        //           //   onPressed: () {
        //           //     print("Say Hello");
        //           //   },
        //           // ),
        //           selected: true,
        //         ),
        //         RadioListTile(
        //           value: 2,
        //           groupValue: selectedRadioTile,
        //           title: Text("Sight Seeing"),
        //           subtitle: Text(
        //               "Two Day package, picup and drop to your stay location"),
        //           onChanged: (val) {
        //             print("Radio Tile pressed $val");
        //             setSelectedRadioTile(val!);
        //           },
        //           activeColor: Colors.red,
        //           // secondary: OutlinedButton(
        //           //   child: Text("Say Hi"),
        //           //   onPressed: () {
        //           //     print("Say Hello");
        //           //   },
        //           // ),
        //           selected: false,
        //         ),
        //         RadioListTile(
        //           value: 3,
        //           groupValue: selectedRadioTile,
        //           title: Text("Complete Tour"),
        //           subtitle: Text(
        //               "3 days package, visit all the famous spots in coorg"),
        //           onChanged: (val) {
        //             print("Radio Tile pressed $val");
        //             setSelectedRadioTile(val!);
        //           },
        //           activeColor: Colors.red,
        //           // secondary: OutlinedButton(
        //           //   child: Text("Say Hi"),
        //           //   onPressed: () {
        //           //     print("Say Hello");
        //           //   },
        //           // ),
        //           selected: false,
        //         ),
        //         RadioListTile(
        //           value: 4,
        //           groupValue: selectedRadioTile,
        //           title: Text("Pickup and Drop"),
        //           subtitle: Text("Pickup and Drop to your desired locations"),
        //           onChanged: (val) {
        //             print("Radio Tile pressed $val");
        //             setSelectedRadioTile(val!);
        //           },
        //           activeColor: Colors.red,
        //           // secondary: OutlinedButton(
        //           //   child: Text("Say Hi"),
        //           //   onPressed: () {
        //           //     print("Say Hello");
        //           //   },
        //           // ),
        //           selected: false,
        //         ),

        //         const SizedBox(
        //           height: 10,
        //         ),
        //         OutlinedButton(onPressed: () {}, child: Text("data"))
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }

  /// Loads and shows a banner ad.
  ///
  /// Dimensions of the ad are determined by the AdSize class.
  void _loadAd() async {
    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
