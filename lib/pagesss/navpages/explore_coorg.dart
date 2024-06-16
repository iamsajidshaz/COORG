import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coorg/utils/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../components/home_stays.dart';
import '../../utils/home_stay_list.dart';

class ExploreCoorgPage extends StatefulWidget {
  const ExploreCoorgPage({super.key});

  @override
  State<ExploreCoorgPage> createState() => _ExploreCoorgPageState();
}

class _ExploreCoorgPageState extends State<ExploreCoorgPage>
    with TickerProviderStateMixin {
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
          if (this.mounted) {
            setState(() {
              _bannerAd = ad as BannerAd;
            });
          }
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
    TabController tabController = TabController(
      length: 4,
      vsync: this,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "E X P L O R E   C O O R G",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        leading: const Icon(Icons.explore_rounded),
        actions: const [
          Icon(Icons.explore_rounded),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: ListView(
        children: [
          // search bar
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: GestureDetector(
          //     //on tap
          //     onTap: () {
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(builder: (context) => const SearchPlaces()),
          //       // );
          //     },
          //     //
          //     child: Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: const Color(0xfff4f6fd),
          //       ),
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          //       //  margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
          //       child: Row(
          //         //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Icon(
          //             Icons.search,
          //             color: const Color.fromARGB(255, 19, 19, 18),
          //             size: 24.sp,
          //           ),
          //           SizedBox(
          //             width: 5.w,
          //           ),
          //           Text(
          //             'Homestays, Hotels, Taxi, Lodges ...',
          //             style: TextStyle(
          //               fontSize: 12.sp,
          //               color: Theme.of(context).colorScheme.primary,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 25,
          ),

          // tab bar

          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              splashBorderRadius: BorderRadius.circular(12),

              tabAlignment: TabAlignment.start,
              indicatorPadding: EdgeInsets.zero,
              indicatorColor: Colors.transparent,
              // indicatorColor: Colors.black,
              dividerColor: Colors.transparent,
              // labelPadding: const EdgeInsets.only(
              //   right: 20,
              //   left: 10,
              // ),
              isScrollable: true,
              tabs: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Tab(
                    text: "HOMESTAYS",
                    height: 100,
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Tab(
                    text: "LODGES",
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Tab(
                    text: "TAXI",
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Tab(
                    text: "FOOD",
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: double.infinity,
              height: 300,
              child: TabBarView(
                controller: tabController,
                children: [
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
                            return const Center(
                                child: Text('Something went wrong'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var homestay = snapshot.data!.docs[index];

                              return HomeStaysList(
                                image: homestay['image_one'],
                                label: homestay['Name'],
                                homestayID: homestay['ID'],
                                subTitle: homestay['Location'],
                                imageOne: homestay['image_two'],
                                imageTwo: homestay['image_three'],
                                imageThree: homestay['image_four'],
                                fac1: homestay['fac1'],
                                fac2: homestay['fac2'],
                                fac3: homestay['fac3'],
                                fac4: homestay['fac4'],
                                fac5: homestay['fac5'],
                                activityOne: homestay["activityOne"],
                                activityTwo: homestay["activityTwo"],
                                activityThree: homestay["activityThree"],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Center(child: Text("COMING SOON")),
                  Center(child: Text("COMING SOON")),
                  Center(child: Text("COMING SOON")),
                ],
              ),
            ),
          ),
          //
          // banner ad
          if (_bannerAd != null)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: _bannerAd!.size.width.toDouble().w,
                height: _bannerAd!.size.height.toDouble().h,
                child: AdWidget(ad: _bannerAd!),
              ),
            ),

          // 4. Special in Coorg
          // header
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 25, right: 15),
            child: Text(
              'More in Coorg',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
          ),

          // list
          Container(
            margin: const EdgeInsets.only(left: 12, top: 12),
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
          // SizedBox(
          //   width: 360.w,
          //   height: 180.h,
          //   child: Lottie.asset('assets/images/stayloading_anim.json'),
          // ),

          // SizedBox(
          //   height: 10.h / 2,
          // ),
          // //

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
      ),
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
