import 'dart:convert';

import 'package:http/http.dart' as http;

const Google_API_KEY = 'AIzaSyBpDPnX18WPy_Gr9lnLXnsYX2Le5clJ8Rk';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double logitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$logitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$logitude&key=$Google_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$Google_API_KEY';
    final response = await http.get(url);

    return json.decode(response.body)['results'][0]['formatted_address'];
  }

}
