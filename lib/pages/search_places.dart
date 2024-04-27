import 'package:coorg/components/places.dart';
import 'package:coorg/pages/explore_place_detailed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPlaces extends StatefulWidget {
  const SearchPlaces({super.key});

  @override
  State<SearchPlaces> createState() => _SearchPlacesState();
}

class _SearchPlacesState extends State<SearchPlaces> {
  final controller = TextEditingController();
  List<Places> places = allPlaces;

  final List _lats = [
    '12.4147664424022'
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
    '75.73714428348143',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EXPLORE COORG",
          style: TextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          // search bar
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 20.sp,
                ),
                hintText: 'Where do you want to go...',
                hintStyle: TextStyle(fontSize: 12.sp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
              onChanged: searchPlace,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                //list
                return GestureDetector(
                  onTap: () {
                    // ---------------------------------------
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailedPlace(
                                place: place.title,
                                dest: place.subTitle,
                                imageUrl: place.urlImage,
                                imageOne: place.urlImage,
                                imageTwo: place.urlImage,
                                imageThree: place.urlImage,
                                facOne: "Parking",
                                facTwo: "Food",
                                facThree: "Guides",
                                desc: _desc[index],
                                lat: _lats[index],
                                lang: _langs[index],
                              )),
                    );

                    // ----------------------------------------
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              place.urlImage,
                              fit: BoxFit.cover,
                              width: 150.w,
                              height: 100.h,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place.title,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                place.subTitle,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void searchPlace(String query) {
    final suggestions = allPlaces.where((place) {
      //
      final placeTitle = place.title.toLowerCase();
      final input = query.toString();
      return placeTitle.contains(input);
    }).toList();
    setState(() {
      places = suggestions;
    });
  }
}
