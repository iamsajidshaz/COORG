import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              height: 24.h,
            ),
            // header
            Center(
              child: Text(
                "C O O R G",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            // picture
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 200.h,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/raja_seat.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            // about coorg
            Center(
              child: Text(
                "THE SCOTLAND OF INDIA",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Coorg, officially called Kodagu, is the most sought after and popular hill station of Karnataka. Lying serenely amidst high mountains, Coorg’s landscape stays misty throughout the year. The aboriginals of the place are Kodavas. Apart from Kannada, the other two main languages of this hill station are Kodagu and Kodava.",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 10.sp,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "The best time to visit Kodagu is between October to May and the peak season for this hill station is within February to May. Kodagu is the largest producer of Coffee in India. Also, it is one of the places with highest rainfall across the nation. Undulating hills covered in lush green forests and a landscape dotted with coffee plantations, tea gardens and orange groves, this hill station has breathtakingly stunning scenic beauty",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 10.sp,
                ),
              ),
            ),

            SizedBox(
              height: 30.h,
            ),

            // contact admin
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  "For feedback or business queries,\nContact Us on",
                  textAlign: TextAlign.center,
                  //  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Colors.black87),
                ),
              ),
            ),
            // social media icons
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlutterSocialButton(
                    onTap: () async {
                      var whatsappUrl = "whatsapp://send?phone=+917406677096";
                      try {
                        launch(whatsappUrl);
                      } catch (e) {
                        //To handle error and display error message
                        print(e.toString());
                      }
                    },
                    mini: true,
                    buttonType: ButtonType.whatsapp,
                  ),
                  // FlutterSocialButton(
                  //   onTap: () async {
                  //     var whatsappUrl = "https://www.facebook.com/sajidshaz611";
                  //     try {
                  //       launch(whatsappUrl);
                  //     } catch (e) {
                  //       //To handle error and display error message
                  //       print(e.toString());
                  //     }
                  //   },
                  //   mini: true,
                  //   buttonType: ButtonType.facebook,
                  // ),
                  FlutterSocialButton(
                    onTap: () async {
                      final Uri _emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: "iamsajid.aa@gmail.com",
                        queryParameters: {
                          'subject': "App Development enquiry from CoorgApp",
                          'body':
                              "...type your message here...\n\nName: \nPhone: \nPlace: "
                        },
                      );
// To launch the link
                      launch(_emailLaunchUri.toString());
                    },
                    mini: true,
                    buttonType: ButtonType.google,
                  ),
//                   FlutterSocialButton(
//                     onTap: () async {
//                       final Uri _emailLaunchUri = Uri(
//                         scheme: 'mailto',
//                         path: "iamsajid.aa@gmail.com",
//                         queryParameters: {
//                           'subject': "App Development enquiry from CoorgApp",
//                           'body':
//                               "...type your message here...\n\nName: \nPhone: \nPlace: "
//                         },
//                       );
// // To launch the link
//                       launch(_emailLaunchUri.toString());
//                     },
//                     mini: true,
//                   ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Text(
                  'Made with ❤ by ShazTech',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
