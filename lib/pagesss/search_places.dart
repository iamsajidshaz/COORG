import 'package:coorg/utils/places.dart';
import 'package:coorg/pagesss/explore_place_detailed.dart';
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
                                desc: place.desc,
                                lat: place.lat,
                                lang: place.lang,
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
