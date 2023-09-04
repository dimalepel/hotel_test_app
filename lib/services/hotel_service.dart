import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/hotel_model.dart';

class HotelService {
  Future<Hotel> getSingleHotel() {
    return http.get(
      Uri.parse('https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      }).then((response) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        if (response.statusCode == 200) {
          return Hotel.fromJson(json);
        } else {
          return Hotel.fromJson(json);
        }
      });
  }
}