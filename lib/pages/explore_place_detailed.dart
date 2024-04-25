import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:readmore/readmore.dart';

class DetailedPlace extends StatelessWidget {
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
      {Key? key,
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
      required this.lang})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            //
            Positioned(
              left: 0,
              right: 0,
              child: Hero(
                tag: imageUrl,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            //
            Positioned(
              left: 5,
              right: 5,
              top: 60,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 2.0,
                        fillColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 15.0,
                          color: Colors.black87,
                        ),
                        shape: CircleBorder(),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: Colors.white,
                        shape: const CircleBorder(),
                        child: Icon(
                          Icons.favorite_outline,
                          size: 15.0,
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 300,
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
                            "$place, $dest",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.place,
                            color: Colors.red,
                          )
                        ],
                      ),

                      //
                      //  const Gap(10),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      //
                      //  const Gap(30),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            "Facilities",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            // style: Styles.headLineStyle3
                            //     .copyWith(color: Colors.black87),
                          ),
                        ],
                      ),
                      //  const Gap(20),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.local_parking,
                                  color: Colors.red,
                                ),
                                Text(facOne),
                              ],
                            ),
                          ),
                          Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.tertiary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.food_bank,
                                  color: Colors.green,
                                ),
                                Text(facTwo),
                              ],
                            ),
                          ),
                          Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.description,
                                  color: Colors.blue,
                                ),
                                Text(facThree),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //  const Gap(20),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Descripion",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            //  style: Styles.headLineStyle3
                            //       .copyWith(color: Colors.black87),
                          ),
                        ],
                      ),
                      // const Gap(20),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: ReadMoreText(
                              desc,
                              trimLines: 2,
                              colorClickableText: Colors.pink,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'show more',
                              trimExpandedText: 'show less',
                              moreStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Gallery",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            //   style: Styles.headLineStyle3
                            //   .copyWith(color: Colors.black87),
                          ),
                        ],
                      ),
                      //  const Gap(20),
                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           ViewImage(imageUrl: imageOne)),
                              //   );
                            },
                            child: Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width * .28,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: AssetImage(imageOne),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           ViewImage(imageUrl: imageTwo)),
                              // );
                            },
                            child: Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width * .28,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: AssetImage(imageTwo),
                                    // AssetImage(
                                    //     "assets/images/coorg/abby.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           ViewImage(imageUrl: imageThree)),
                              // );
                            },
                            child: Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width * .28,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: AssetImage(imageThree),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                        ],
                      ),

                      //   const Gap(30),
                      const SizedBox(
                        height: 30,
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //   primary: Colors.green,
                          backgroundColor: Colors.blue,
                          textStyle: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                          minimumSize: const Size.fromHeight(50),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () => MapsLauncher.launchCoordinates(
                          double.parse(lat.toString()),
                          double.parse(lang.toString()),
                          place,
                        ),
                        child: Text(
                          'Get Location',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                          // style: Styles.headLineStyle2
                          //     .copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
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
}
