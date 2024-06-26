import 'package:coorg/utils/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:readmore/readmore.dart';

import 'view_gallery_image.dart';

class DetailedPlace extends StatefulWidget {
  final String place;
  final String dest;
  final String imageUrl;
  final String imageOne,
      imageTwo,
      imageThree,
      facOne,
      facTwo,
      facThree,
      desc,
      lat,
      lang;
  const DetailedPlace(
      {super.key,
      required this.place,
      required this.dest,
      required this.imageUrl,
      required this.imageOne,
      required this.imageTwo,
      required this.imageThree,
      required this.facOne,
      required this.facTwo,
      required this.facThree,
      required this.desc,
      required this.lat,
      required this.lang});

  @override
  State<DetailedPlace> createState() => _DetailedPlaceState();
}

class _DetailedPlaceState extends State<DetailedPlace> {
  InterstitialAd? _interstitialAd;

  //Implement _loadInterstitialAd()
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              _openMap();
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          //  print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void initState() {
    //  implement initState
    super.initState();
    _loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width.w,
        height: MediaQuery.of(context).size.height.h,
        child: Stack(
          children: [
            //
            Positioned(
              left: 0,
              right: 0,
              child: Hero(
                tag: widget.imageUrl,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewImage(
                                imageUrl: widget.imageUrl,
                                imageName: widget.place,
                                isNetImage: "no",
                              )),
                    );
                  },
                  child: Container(
                    width: 360.w,
                    height: MediaQuery.of(context).size.height / 2.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      image: DecorationImage(
                        image: AssetImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //
            Positioned(
              left: 2,
              right: 2,
              top: 50,
              child: SizedBox(
                width: MediaQuery.of(context).size.width.w,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 2.0,
                        fillColor: Colors.white,
                        shape: const CircleBorder(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 12.sp,
                          color: Colors.black87,
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: Colors.white,
                        shape: const CircleBorder(),
                        child: Icon(
                          Icons.favorite_outline,
                          size: 12.sp,
                          color: Colors.red,
                        ),
                      ),
                    ]),
              ),
            ),
            //
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                width: 360.w,
                height: 690.h - 320,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.place}, ${widget.dest}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                          Icon(
                            Icons.place,
                            color: Colors.red,
                            size: 24.sp,
                          )
                        ],
                      ),

                      //
                      //  const Gap(10),
                      SizedBox(
                        height: 10.h,
                      ),
                      Divider(
                        color: Colors.grey.shade500,
                        thickness: 1.w,
                      ),
                      //
                      //  const Gap(30),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Facilities",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                            // style: Styles.headLineStyle3
                            //     .copyWith(color: Colors.black87),
                          ),
                        ],
                      ),
                      //  const Gap(20),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50.h,
                            width: 360.w * 0.25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.local_parking,
                                  color: Colors.red,
                                  size: 20.sp,
                                ),
                                Text(
                                  widget.facOne,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50.h,
                            width: 360.w * 0.25,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.tertiary,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.food_bank,
                                  color: Colors.green,
                                  size: 20.sp,
                                ),
                                Text(
                                  widget.facTwo,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50.h,
                            width: 360.w * 0.25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.description,
                                  color: Colors.blue,
                                  size: 20.sp,
                                ),
                                Text(
                                  widget.facThree,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //  const Gap(20),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Descripion",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                            //  style: Styles.headLineStyle3
                            //       .copyWith(color: Colors.black87),
                          ),
                        ],
                      ),
                      // const Gap(20),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 40.w,
                            child: ReadMoreText(
                              widget.desc,
                              style: TextStyle(fontSize: 12.sp),
                              trimLines: 3,
                              colorClickableText: Colors.pink,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'show more...',
                              trimExpandedText: 'show less',
                              moreStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                              lessStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Gallery",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                            //   style: Styles.headLineStyle3
                            //   .copyWith(color: Colors.black87),
                          ),
                        ],
                      ),
                      //  const Gap(20),
                      SizedBox(
                        height: 10.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewImage(
                                          imageUrl: widget.imageOne,
                                          imageName: widget.place,
                                          isNetImage: "no",
                                        )),
                              );
                            },
                            child: Container(
                              height: 100.w,
                              width: 360.w * .28,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: AssetImage(widget.imageOne),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewImage(
                                          imageUrl: widget.imageTwo,
                                          imageName: widget.place,
                                          isNetImage: "no",
                                        )),
                              );
                            },
                            child: Container(
                              height: 100.w,
                              width: 360.w * .28,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: AssetImage(widget.imageTwo),
                                    // AssetImage(
                                    //     "assets/images/coorg/abby.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewImage(
                                          imageUrl: widget.imageThree,
                                          imageName: widget.place,
                                          isNetImage: "no",
                                        )),
                              );
                            },
                            child: Container(
                              height: 100.w,
                              width: 360.w * .28,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: AssetImage(widget.imageThree),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                            ),
                          ),
                        ],
                      ),

                      //   const Gap(30),
                      SizedBox(
                        height: 30.h,
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //   primary: Colors.green,
                          backgroundColor: Colors.blue,
                          textStyle: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.white,
                          ),
                          minimumSize: Size.fromHeight(40.h),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          // show ad if loaded
                          if (_interstitialAd != null) {
                            _interstitialAd?.show();
                          } else {
                            _openMap();
                          }
                        },
                        child: Text(
                          'Get Location',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                          // style: Styles.headLineStyle2
                          //     .copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openMap() {
    MapsLauncher.launchCoordinates(
      double.parse(widget.lat.toString()),
      double.parse(widget.lang.toString()),
      widget.place,
    );
  }
}
