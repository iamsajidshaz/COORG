import 'package:coorg/components/account_details_box.dart';
import 'package:coorg/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HsBookingEntry extends StatefulWidget {
  final String id;
  const HsBookingEntry({
    super.key,
    required this.id,
  });

  @override
  State<HsBookingEntry> createState() => _HsBookingEntryState();
}

class _HsBookingEntryState extends State<HsBookingEntry> {
  DateTimeRange selectedDate = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  String sd = '';
  String ed = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Homestay Booking Form'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: AccountDetailsBox(
                  label: 'HomeStay:', text: 'Birds Eye Nest Stay'),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: AccountDetailsBox(label: 'Location:', text: 'Kushalnagar'),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                //   height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "From",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${selectedDate.start}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "To",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${selectedDate.end}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Days",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${selectedDate.duration.inDays}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 30.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () async {
                          final DateTimeRange? dateTimeRange =
                              await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                          );
                          if (dateTimeRange != null) {
                            setState(() {
                              selectedDate = dateTimeRange;
                            });
                          }
                        },
                        child: const Text(
                          "CHANGE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Guest & Rooms",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),

            //
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                //   height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    // adults

                    Row(
                      children: [
                        // text
                        Text(
                          "Adults",
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),

                        const Spacer(),

                        // increment icons
                        // -
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.minus,
                            ),
                          ),
                        ),

                        // count
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // +
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Divider(
                        thickness: 0.5,
                      ),
                    ),
                    //Child
                    Row(
                      children: [
                        // text
                        Text(
                          "Children",
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),

                        Spacer(),

                        // increment icons
                        // -
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.minus,
                            ),
                          ),
                        ),

                        // count
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // +
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Divider(
                        thickness: 0.5,
                      ),
                    ),
                    // rooms
                    Row(
                      children: [
                        // text
                        Text(
                          "Rooms",
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),

                        Spacer(),

                        // increment icons
                        // -
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.minus,
                            ),
                          ),
                        ),

                        // count
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // +
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //

            // submit
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () async {
                    Map<String, dynamic> homestayBookingInfoMap = {
                      "hs_id": widget.id,
                      "user_id": FirebaseAuth.instance.currentUser!.uid,
                      "created": DateTime.now().toString(),
                    };
                    await DatabaseMethods()
                        .addHomeStayBooking(homestayBookingInfoMap)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "Booking has been submitted successflly",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => HsBookingEntry(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(color: Colors.white),
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
