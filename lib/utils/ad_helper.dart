import 'dart:io';

// my banner ad id
// final String _adUnitId = 'ca-app-pub-5026929321885207/6789224225';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      // test   return 'ca-app-pub-3940256099942544/6300978111';
      // myid
      return 'ca-app-pub-5026929321885207/6789224225';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5026929321885207/6789224225';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  // my intertitial  id
  // final String _adUnitId = 'ca-app-pub-5026929321885207/9831316383';
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      // test return "ca-app-pub-3940256099942544/1033173712";
      return 'ca-app-pub-5026929321885207/9831316383';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5026929321885207/9831316383';
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/5224354917";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/1712485313";
  //   } else {
  //     throw UnsupportedError("Unsupported platform");
  //   }
  // }
}
