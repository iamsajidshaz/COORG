import 'dart:async';

import 'package:coorg/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // show bg image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroundimg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        // show child - button and overlay screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Explore Various Natural Beauty of Coorg ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You can vist anywhere easily, explore places in coorg and complete your journey",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            isLoading
                ? Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 16.w,
                        ),
                        minimumSize: Size.fromHeight(38.h),
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () async {
                        if (isLoading) return;
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(const Duration(seconds: 3));
                        Navigator.pushReplacement(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
            // made with love text
            SizedBox(
              height: 14.h,
            ),
            const Center(
              child: Text(
                'Made with ❤ by ShazTech',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            //
            SizedBox(
              height: 14.h,
            ),
          ],
        ),
      ),
    );
  }
}
