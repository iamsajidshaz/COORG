import 'dart:async';

import 'package:coorg/pagesss/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../utils/ad_helper.dart';

class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({super.key});

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  InterstitialAd? _interstitialAd;

  // Implement _loadInterstitialAd()
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SplashScreen()));
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

  // test  interstitial ad id
  // final String _adUnitId = 'ca-app-pub-3940256099942544/1033173712';
  // my intertitial  id
  // final String _adUnitId = 'ca-app-pub-5026929321885207/9831316383';

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    _moveToHome();
    // _interstitialAd?.show();
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const SplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroundimg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'C O O R G',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.sp,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'T H E   E X P L O R E R   A P P',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Loads an interstitial ad.
  // void _loadAd() {
  //   InterstitialAd.load(
  //     adUnitId: _adUnitId,
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       // Called when an ad is successfully received.

  //       onAdLoaded: (InterstitialAd ad) {
  //         ad.fullScreenContentCallback = FullScreenContentCallback(
  //             // Called when the ad showed the full screen content.
  //             onAdShowedFullScreenContent: (ad) {},
  //             // Called when an impression occurs on the ad.
  //             onAdImpression: (ad) {
  //               // Navigator.pushReplacement(
  //               //     context,
  //               //     MaterialPageRoute(
  //               //         builder: (context) => const SplashScreen()));
  //             },
  //             // Called when the ad failed to show full screen content.
  //             onAdFailedToShowFullScreenContent: (ad, err) {
  //               ad.dispose();
  //               // Navigator.pushReplacement(
  //               //     context,
  //               //     MaterialPageRoute(
  //               //         builder: (context) => const SplashScreen()));
  //             },
  //             // Called when the ad dismissed full screen content.
  //             onAdDismissedFullScreenContent: (ad) {
  //               ad.dispose();
  //               // print("dismissed");
  //               // Navigator.pushReplacement(
  //               //     context,
  //               //     MaterialPageRoute(
  //               //         builder: (context) => const SplashScreen()));
  //             },
  //             // Called when a click is recorded for an ad.
  //             onAdClicked: (ad) {
  //               // Navigator.pushReplacement(
  //               //     context,
  //               //     MaterialPageRoute(
  //               //         builder: (context) => const SplashScreen()));
  //             });

  //         // Keep a reference to the ad so you can show it later.
  //         _interstitialAd = ad;
  //       },
  //       // Called when an ad request failed.
  //       onAdFailedToLoad: (LoadAdError error) {
  //         // ignore: avoid_print
  //         // print('InterstitialAd failed to load: $error');
  //         // Navigator.pushReplacement(context,
  //         //     MaterialPageRoute(builder: (context) => const SplashScreen()));
  //       },
  //     ),
  //   );
  // }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _moveToHome() {
    // Display an Interstitial Ad
    if (_interstitialAd != null) {
      _interstitialAd?.show();
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SplashScreen()));
    }
  }
}
