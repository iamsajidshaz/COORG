import 'package:coorg/components/destination_list.dart';
import 'package:coorg/components/place_list.dart';
import 'package:coorg/pages/search_places.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../utils/ad_helper.dart';
import '../settings_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BannerAd? _bannerAd;

  // test banned ad id
  // final String _adUnitId = 'ca-app-pub-3940256099942544/6300978111';

  // my banner ad id
  //final String _adUnitId = 'ca-app-pub-5026929321885207/6789224225';

  @override
  void initState() {
    super.initState();
    //_loadAd();

    //  Load a banner ad
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
          // print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  final List _lats = [
    '12.41480835424861',
    '12.458413130905688',
    '12.421236986559824',
    '12.680904666142025',
    '12.430267934693957',
    '12.491918384243752',
    '12.545597032138263',
    '12.496091654928701',
    '11.966302006557543',
    '12.543998733466546',
    '12.433563709247595',
    '12.385534533294727',
    '12.52298094809942',
    '12.37134918355973',
    '12.447139187519078',
    '12.420697873279707',
    '12.396507749941751',
  ];
  final List _langs = [
    '75.73711209697447',
    '75.71952492319419',
    '75.73871630970048',
    '75.72365626552671',
    '75.96771875202938',
    '75.90555599435915',
    '75.70113696815378',
    '75.8594259600121',
    '75.98336138085732',
    '75.75393662319561',
    '75.73999315202948',
    '75.49092186552163',
    '75.73951230293738',
    '75.90510896552145',
    '75.93697656814251',
    '75.74277136628',
    '75.8787042546437',
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
  final List _placesImages = [
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

  final List _desc = [
    // raja seat
    "One of the popular tourist spots, Raja seat literally means “Seat of the Kings”. Located in the town of Madikeri, it is a beautiful place presenting a refreshing setting and soothing environment.\n\nThe place is called as Raja’s Seat because it was the place where Coorg’s kings used to visit and enjoy the scenic beauty around. The sunset and sunrise make for a mesmerising view which is worth captivating in your cameras.\n\nIt is the perfect setting to relax and admire the breathtaking view of the surrounding areas. Lush greenery with a calm environment and golden streams of sunlight makes for a picture perfect setting.",
    // Abbey Falls
    "Abbey Falls (also referred to as Abbi Falls) is a popular waterfall in Kodagu district. River Kaveri drops for about 70 ft over wide rocks creating a spectacular view. While the height is not much compared to other waterfalls in Karnataka, Abbey Falls’ has wider fall area that creates spectacular views and its proximity to Madikeri city makes Abbey Falls desirable and easy to access.\n\nEntry to Abbey Falls is open from 9 AM to 5 PM. Access to Abbey Falls is via private coffee plantations. A hanging bridge is available to enjoy the view of Abbey waterfalls from an elevation. Bathing or swimming in Abbey Falls is not allowed. Limited parking is available\n\nAbbey Falls is just 6 kms from Madikeri town. Madikeri is 250 kms from Bengaluru city and 140 kms from Mangaluru. Kannur International Airport in Kerala is the closest to Madikeri (90 kms from Madikeri). Madikeri has excellent bus connectivity from Bengaluru, Mysuru and Mangaluru. Once in Madikeri, taxis can be hired to explore various attractions in Madikeri and Kodagu.",
    //madikeri_fort
    "Situated about 500m from the Madikeri bus stand and located on a hillock the imposing fort was built by Mudduraja in 1681. The earthen structure was rebuilt in granite by Tipu Sultan. Mudduraja also built a thatched roof palace here which was renovated in 1814 by Lingarajendra II, and then in 1933 by the British, who added a clock- tower and portico. Nearby are two startlingly life-like masonry elephants. The fort’s Veerabhadra Temple was demolished and a Gothic-style Anglican church built in its place in 1855. The church now houses a museum which displays historic items relating to Kodava life.",
    //mallalli_falls
    "Located in the Pushpagiri Hills in the Western Ghats, Mallali Falls is one of the most beautiful falls and are counted amongst the top Coorg tourist places. Created by a 200 ft. plunge in River Kumaradhara before it carries on its route to the Arabian Sea, the waters of the falls crash into a huge gorge. It’s a great experience listening for the sounds of crashing waters amidst the quiet of nature as one gets closer to the falls through the rugged 2 kilometre long trail.\n\nThe stunning milky-white Mallalli Falls finds abode in the north of Kodagu region is the pride of Karnataka, India. The cascading falls seated 26 km off Somwarpet right at the base of the Pushpagiri Hills leave tourists mesmerized with its beauty and splendour.\n\nIt starts from where the Kumaradhara River takes an extreme dive of more than 1000 m and then takes a natural course leading to the Arabian Sea. Take in the beauty and behold the sights of the verdant jungles, the surrounding scenery, and the river diving deep from the origin of Mallalli Falls.\n\nMallalli Falls is the most sought-after tourist place to visit in Coorg, Karnataka. It is one of the bemusing natural beauties, frequently talked about together with the Abbey Falls, Kodagu. One cannot compare the heavenly beauty of Mallalli Falls with another water body in the state of Karnataka.\n\nMallalli Falls is in its full form during the rainy season, plummeting from above in a sequence and in two levels. You can spot this jaw-dropping beauty from the foot of the Pushpagiri Hills. Keep walking to hear the divine sound of the water falling from above, increasing in decibel while you trek up towards this natural wonder. ",
    //golden_temple
    "The Namdroling Monastery, popularly referred to as ‘The Golden Temple’ is one of the largest Tibetan settlements in India. Located in Bylakuppe, about 5 kms from Kushalanagara in Kodagu district, The Golden Temple complex is home to about 16000 refugees and 600 monks.\n\nNamdroling Monastery’s main entrance is an attractive four story tower with a wheel portraying symbols of Buddhism. The main attractions inside the temple are the statues of Lord Buddha in the centre with statues of Lord Amitayus and Lord Padmasambhava on either sides. Visitors can pray, meditate, give their offerings and rotate the mani prayer drums. Rotating these prayer drums is believed to give the same benefit as chanting “Om Mani Padme Hum”, the Buddhist prayer.\n\nGolden Temple visiting time: The Temple is open for visitors from 9 AM till 6 PM.",
    //harangi_dam
    "Located in the Hudgur village near Kushalnagar, Harangi dam makes for an interesting visit. The dam has been built across the tributary of River Cauvery and has a height of 47 meters and length of 846 meters. It is one of the popular picnic spots with a mesmerising natural setting and relaxed atmosphere. Located at a distance of approximately 36 km from Madikeri, Harangi dam is the first Dam to have been built across River Cauvery.\n\nThe place is comparatively less crowded and thus is perfect for those looking for some seclusion and private time with nature. Soothing environment with gentle breeze greets as you enter the area around the dam. The best time to visit the dam is during the months of August to September. During this time, the reservoir is completely filled with water creating a picture perfect setting.",
    //mandalpatti
    "Located at a distance of 25- 30 km from Madikeri town, Mandalpatti is a popular tourist spot. A lush green mesmerising place, Mandalpatti has recently become popular amongst tourists. The place is way from the hustle bustle and offers some seclusion and calmness. It is perfect place to go for trekking. However, to go for trekking, one is required to take entrance tickets from the authorities at the base of Mandalpatti.\n\nIt is better to equip oneself with all the required materials before starting the trek as there are no shops. Thus even the basic items like water and food need to be carried. Once at the top of the hill, tourists will be greeted with cool and gentle breeze along with huge stretch of lush greenery.",
    //backwater
    "Harangi Backwater near Kushalnagar is a short drive from the town. The place is perfect for disconnecting and distressing.",
    //irpu
    "The Irupu Falls (also Iruppu Falls) are located in the Brahmagiri Range in the Kodagu district of Karnataka, India, bordering the Wayanad district of Kerala. It is a fresh water cascade and is situated at a distance of 48 km from Virajpet on the highway to Nagarhole. The falls are also known as the Lakshmana Tirtha Falls, derived from the name of the tributary of Cauvery which starts from these falls, the Lakshmana Tirtha River. A forest trail leads from these falls to the Brahmagiri Peak in Southern Kodagu. Irupu falls is a major tourist attraction as well as a pilgrimage spot. A famous Shiva temple, the Rameshwara Temple is situated on the banks of the Lakshmana Tirtha River, en route to the Falls. This temple attracts many pilgrims during the festival of Shivaratri.",
    //kotebetta
    "Kote Betta, situated about 15 Kms from Madikeri, is one of the 3 highest peaks in the region with an elevation of 1620 meters. This place has significance in Hindu mythology. Kotebetta translates to Fort Hill and it is believed that the Pandavas from the famous epic Mahabharata spent a substantial amount of time during their exile in this region. This hilly region is extremely famous for its splendid, lush green Forests and the majestic Western Ghats. Several coffee plantations, spice estates as well as jackfruit gardens can also be found here. The 360-degree view from the top of the hill is mesmerizing.\n\nKote Betta is an excellent place for people who love adventure and exciting sports like trekking or rock climbing. There is a temple of God Shiva situated at the top. On your way through the trekking trails, several wild animals like Sambars, Mongoose, Indian Squirrels, Gaurs, can be spotted. The slope is not too steep and the tracking trails are quite amiable therefore making it easy for people to enjoy a nice comforting Trek to the top of the hill. Make sure to carry a camera with you along with some spare batteries. The view that you will be able to witness from the top of Kote betta is worth capturing for the gorgeous landscapes, clear and glistening blue sky that binds the whole ambiance together.",
    //rajas_tomb
    "Gaddige also known as Raja’s tomb is located in one of the beautiful hill station of Karnataka, Madikeri, Coorg. The monument depicts the pervading building style of those days which was Indo- Sarcenic. The monument contains the mortal remains of the royal Kodavas.\n\nGaddige tomb is located in Mahadevpet, which is 1.5 km from Madikeri towards northeast.",
    //talakaveri
    "Talacauvery, the birthplace or the origin of River Cauvery is a holy place or a pilgrimage for many Hindus. The place is considered to be the source of the river Cauvery. Located on the Brahmagiri Hills in Bhagamandala town, Talacauvery stands tall at a height of 1276 meters above sea level in the Kodagu district of Karnataka state. This pious pilgrimage is also closer to the Kasargod district of Kerala state. The holy temple is located 48 km from the district’s main town and is accessible only via a road crossing coffee plantations.\n\nTalacauvery is dedicated to the Goddess Kaveramma and is the main deity. The other deities worshipped here are Lord Agasthiswara. It is believed to have a strong connection and a link between Cauvery and Sage Agasthya. A rectangular tank known as Cauvery or Brahma Kundike is considered to be the birthplace of river Cauvery. This is the spot that marks the origin of the mighty river and is ornated beautifully with a small shrine of silver Shivalinga. This is the point from where river Cauvery emerges as a spring and disappears underground. The river again emerges at a point near Bhagamandala and joins the other two rivers Kannike and Sujyoti. The amalgam point of the three rivers is called Triveni Sangam.\n\nAs per the local beliefs, the water here at Talacauvery has miraculous and healing powers. A dip in the holy water here is believed to have healed various physical and psychological griefs.",
    //kotte_abbi_falls
    "At a distance of 8 km from Mandalpatti, and 25 km from Madikeri, Kote Abbe Waterfall is a stunning waterfall situated at Mukkodlu village in the Coorg district of Karnataka. It is one of the hidden waterfalls in Karnataka and among the best Coorg tourist places.\n\nThe waterfall is really a wonderful site as the water gushes from the rocks amidst the green environs. The water was clean and clear. Sparkling water, flat rock bed surface nestling in the greenest part of Coorg, Kote Abbi is the least crowded of all the waterfalls in and around Madikeri. The place isn't commercialized yet and is still serene so one can experience some scene of tranquillity with just the gushing sound of the falls and the chirping of birds to break the silence.\n\nThis waterfall is seasonal and it offers wonderful views in the rainy season. The tourists are advised not to get into the water during the monsoon. There is no bus service from Madikeri to the falls. So visitors can rent a jeep as it is a bumpy rough ride. One can visit this place while visiting Mandalpatti, which is 20-25 mins downhill drive.\n\nTimings: 6 AM - 6 PM",
    //dubare ----
    "The Dubare Camp, where elephants were trained for the famous Mysore Dasara, found a brand new calling.\n\nDubare is known for its elephant camp, a forest camp on the banks of the river Kaveri in the district of Kodagu, Karnataka. It is an important base for the Karnataka Forest Department's elephants.\n\nThere are opportunities for trekking, elephant interaction, and stay. These are hosted by Jungle Lodges and Resorts Ltd. (JLR). JLR is the ecotourism wing of the Tourism Department of Karnataka. In addition to the elephant training camp, Nisargadhama and Veerabhoomiare the other main attractions of the forest area.",
    //nisargadhama ----
    "Coorg, boasts of an unprecedented beauty, adventurous terrain and a pleasant climate that promises refreshing days to all its visitors. From waterfalls, viewpoints, lakes and parks to trekking trails and luxurious accommodation, Coorg offers everything that is required for a perfect holiday.\n\nA forest resort on an island, maintained by the forest department of Karnataka, Kaveri Nisargadhama Forest Park is undeniably one of the most beautiful and enjoyable part of any Coorg tour packages.\n\nFormed by the main river of the region, River Kaveri, it is surrounded by dense forest. A popular weekend getaway in itself, it is situated quite close to Kushalnagar, with just 3 km of distance between them",
    //omkareshwara_temple ---
    "The Omkareshwara Temple is an ancient shrine dedicated to Lord Shiva. It is situated in the town of Madikeri in Coorg, Karnataka. The speciality of the temple is that its construction reflects a combination of Gothic and Islamic styles. It is a popular religious destination of Coorg. The temple draws a large number of tourists and devotees regularly.\n\nThe Omkareshwara temple is in the heart of the Madikeri town and hence can be reached easily from different parts of Coorg. Madikeri is located near the Karnataka State Highway 88 that connects Mysore to Mangalore. This makes Madikeri a well-connected place by the road network.",
    //chiklihole ----
    "Located in between Madikeri and Kushalnagar, Chiklihole Reservoir is a place worth visiting once on your Coorg tour. It is approximately 15 km away from Kushalnagar and Madikeri. The nearest town to the Reservoir is Kushalnagara.\n\nThe best time to visit the Chiklihole dam is during the month of June to March. The season of monsoon and winter is best not just because of the pleasant climate but also the dam has more water at this point of time.\n\nIt is one of the popular places to visit in Coorg. The Chiklihole Reservoir is built across the river Chiklihole flowing through the Cauvery basin of Karnataka.",

    //
  ];

  final List _destinationList = [
    'Madikeri',
    'Virajpete',
    'Kushalnagara',
    'Somwarpete',
  ];
  final List _destListPictures = [
    "assets/images/madikeri_town.jpg",
    "assets/images/virajpete_town.jpg",
    "assets/images/kushalnagar_town.jpg",
    "assets/images/somwarpete_town.jpg",
  ];
  final List _destinationDesc = [
    // Madikeri
    "Madikeri is a hill town in southern India. Framed by the Western Ghats mountain range, it’s known for the Raja’s Seat, a simple monument overlooking forests and rice paddies. In the center, the 17th-century Madikeri Fort features 2 stone elephants at the entrance. Nearby, the domed Omkareshwar Temple is dedicated to the Hindu deity Shiva. To the northwest, cascading Abbey Falls is surrounded by spice plantations",

    // Virajpete
    "The town of Virajpet also spelled as Virajapete is town of the district of Kodagu, in India's southern State of Karnataka. It is the main town of the Virajpet taluka, south of the district, and borders Kerala State. The name of the town is derived from its founder, Dodda Vira Rajendra\n\nThe name Virajpet is a shorter version of its previous name Virarajendrapet, named after the Haleri King Dodda Vira Rajendra, who founded the town in 1792. He founded the town to commemorate his meeting with General Robert Abercromby, his ally against Tipu Sultan, the ruler of the Kingdom of Mysore, in 1791. Virajpet was the headquarters of Yedenalknad taluk. The first population comprised people who Vira Rajendra had in his predatory excursions swept away from Mysore. But, the people that fled to Virajpet were principally the inhabitants of Periyapatna, who were looking for protection when their town was destroyed by Tipu Sultan, to prevent its falling into the hands of the British.",
    //Kushalnagara
    "Kushalnagar is a town on the Kaveri River, in the southwestern Indian state of Karnataka. South of town, the Buddhist Namdroling Monastery, also known as the Golden Temple, is an ornate structure surrounded by groves of sandalwood trees. To the west are peaceful Chiklihole Reservoir and Dam, framed by forests. Nearby, the Dubare Elephant Camp houses retired logging elephants, as well as crocodiles and leopards.\n\nAccording to popular myth, the name was given by Hyder Ali who was camped there when he received news of the birth of his son Tipu and called it as Kushyal nagar, town of gladness But in reality, Tipu was born around 1750 while Hyder Ali entered Kodagu for the first time in the 1760s. After the British conquest of Coorg it was known as Fraserpet after Colonel James Stuart Fraser who was the Political Agent in Coorg around 1834",
    //somwarpete
    "Somwarpet is a panchayat town in Kodagu district in the Indian state of Karnataka. It is the main town of the Somwarpet taluk, in the north-east of the district. 2nd highest Administrative town in Karnataka in terms of elevation.",
  ];
  final List _destinationLat = [
    //
    '12.4246378988192',

    //
    '12.19415979981644',

    //
    '12.456355359397477',

    //
    '12.594491002802148',
  ];
  final List _destinationLangs = [
    //
    '75.73856026347143',

    //
    '75.80488485512974',

    //
    '75.95719497223382',

    //
    '75.85046757530343',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Icon(
                CupertinoIcons.home,
                size: 24.sp,
              ),

              // text
              Text(
                "C O O R G   E X P L O R E R",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
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
                  CupertinoIcons.settings,
                  color: Colors.black87,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 20.h,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPlaces()),
              );
            },
            //
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
                  Icon(
                    Icons.search,
                    color: const Color(0xffBFC205),
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
              itemCount: _placesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12),
                  child: PlacesList(
                    text: _placesList[index],
                    image: _placesImages[index],
                    desc: _desc[index],
                    lat: _lats[index],
                    lang: _langs[index],
                  ),
                );
              },
            ),
          ),
        ),
        // banner ad

        if (_bannerAd != null)
          SizedBox(
            width: _bannerAd!.size.width.toDouble().w,
            height: _bannerAd!.size.height.toDouble().h,
            child: AdWidget(ad: _bannerAd!),
          ),

        // Display a banner when ready
        // if (_bannerAd != null)
        //   Align(
        //     alignment: Alignment.topCenter,
        //     child: Container(
        //       width: _bannerAd!.size.width.toDouble(),
        //       height: _bannerAd!.size.height.toDouble(),
        //       child: AdWidget(ad: _bannerAd!),
        //     ),
        //   ),

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
              itemCount: _destinationList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12),
                  child: DestinationsList(
                    text: _destinationList[index],
                    image: _destListPictures[index],
                    desc: _destinationDesc[index],
                    lat: _destinationLat[index],
                    lang: _destinationLangs[index],
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
