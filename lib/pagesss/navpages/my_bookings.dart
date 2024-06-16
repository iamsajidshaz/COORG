import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../services/database.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> with TickerProviderStateMixin {
  Stream? homestayBookingStream;

  getOnTheLoad() async {
    homestayBookingStream = await DatabaseMethods().getHomestayBookingDetails();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget homeStayBookingDetails() {
    return StreamBuilder(
      stream: homestayBookingStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs!.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  if (ds["user_id"] == FirebaseAuth.instance.currentUser!.uid) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.green)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //
                            Text(
                              "ORDER ID: 87585254522",
                              style: TextStyle(color: Colors.grey),
                            ),
                            //
                            Divider(color: Colors.grey.shade300),
                            //
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/hotel_sample.jpg"),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                //
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hyatt Regency",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("Madikeri, Coorg, KA"),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  "PENDING",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Divider(color: Colors.grey.shade300),
                            //
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "From: 16-06-2024",
                                      // style: TextStyle(
                                      //   fontSize: 16,
                                      //   fontWeight: FontWeight.bold,
                                      // ),
                                    ),
                                    Text("To: 16-06-2024"),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  "5 DAYS",
                                  style: TextStyle(
                                    //fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "REMARKS: NA",
                              style: TextStyle(
                                  //fontSize: 16,
                                  // fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                })
            : const Center(
                child: Text("NO DATA FOUND !!!"),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 3,
      vsync: this,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Your Bookings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        leading: const Icon(Icons.favorite),
      ),
      body: Column(
        children: [
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
              ],
            ),
          ),
          //  tab views

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12, top: 12, bottom: 5),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    //  homestay booking
                    homeStayBookingDetails(),

                    //  homestay booking
                    //  homestay booking

                    Center(child: Text("COMING SOON")),
                    Center(child: Text("COMING SOON")),
                  ],
                ),
              ),
            ),
          ),

          // display bookings
        ],
      ),
    );
  }
}
