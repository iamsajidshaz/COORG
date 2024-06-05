import 'package:coorg/utils/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
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
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Coming",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Soon,",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "We are growing",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: 360.w,
                    height: 180.h,
                    child: Lottie.asset('assets/images/taxi_anim.json'),
                  ),
                  Center(
                    child: Text(
                      "Our Taxi Partners are getting ready",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  if (_bannerAd != null)
                    SizedBox(
                      width: _bannerAd!.size.width.toDouble().w,
                      height: _bannerAd!.size.height.toDouble().h,
                      child: AdWidget(ad: _bannerAd!),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
