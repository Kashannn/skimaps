import 'package:skimaps/models/resort.dart';
import 'package:share_plus/share_plus.dart';

shareGoogleMapString(LocationModel location) {
  String googleMapString =
      'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}';
  Share.share(googleMapString);
}
