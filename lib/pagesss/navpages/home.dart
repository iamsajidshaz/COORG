import 'package:coorg/components/destination_list.dart';
import 'package:coorg/components/place_list.dart';
import 'package:coorg/pagesss/search_places.dart';
import 'package:coorg/utils/destinations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../utils/places.dart';
import '../../utils/ad_helper.dart';
import '../settings_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  InterstitialAd? _interstitialAd;
  BannerAd? _bannerAd;
  List<Places> places = allPlaces;
  List<Destinations> destinations = allDestinations;

  @override
  void initState() {
    _loadInterstitialAd();
    //  Load a banner ad
    _loadBannerAd();
    // load int ad

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "C O O R G   E X P L O R E R",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        leading: Icon(
          CupertinoIcons.home,
          size: 24.sp,
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (_interstitialAd != null) {
                _interstitialAd?.show();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              }
            },
            icon: Icon(
              CupertinoIcons.settings,
              color: Colors.black87,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              'Where do you want',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              'to go?',
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          // search bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              //on tap
              onTap: () {
                if (_interstitialAd != null) {
                  _interstitialAd?.show();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPlaces()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPlaces()),
                  );
                }
              },
              //
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff4f6fd),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.green,
                      size: 24.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Search',
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
          SizedBox(
            height: 8.h,
          ),

          // header
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
            child: Text(
              'Explore Places',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
          ),

          // places
          Container(
            margin: const EdgeInsets.only(left: 25, top: 12),
            height: 250.h,
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  final place = places[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 12),
                    child: PlacesList(
                      text: place.title,
                      image: place.urlImage,
                      desc: place.desc,
                      lat: place.lat,
                      lang: place.lang,
                    ),
                  );
                },
              ),
            ),
          ),
          // banner ad

          if (_bannerAd != null)
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 25, right: 10),
              child: SizedBox(
                width: _bannerAd!.size.width.toDouble().w,
                height: _bannerAd!.size.height.toDouble().h,
                child: AdWidget(ad: _bannerAd!),
              ),
            ),

          // header
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
            child: Text(
              'Popular Destinations in Coorg',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
          ),

          // destination places

          Container(
            margin: const EdgeInsets.only(left: 25, top: 12),
            height: 200.h,
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ListView.builder(
                itemCount: destinations.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final destination = destinations[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 12),
                    child: DestinationsList(
                      text: destination.title,
                      image: destination.image,
                      desc: destination.desc,
                      lat: destination.lat,
                      lang: destination.lang,
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
              'Picture of the day',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),

          // banner images
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25, right: 12),
            child: Container(
              height: 200.h,
              decoration: BoxDecoration(
                image: const DecorationImage(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

// banner ad
  void _loadBannerAd() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (this.mounted) {
            setState(() {
              _bannerAd = ad as BannerAd;
            });
          }
        },
        onAdFailedToLoad: (ad, err) {
          // print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  // int ad
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              // ad.dispose();
            },
            onAdShowedFullScreenContent: (ad) {},
          );

          if (this.mounted) {
            setState(() {
              _interstitialAd = ad;
            });
          }
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }
}
