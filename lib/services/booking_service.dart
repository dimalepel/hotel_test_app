import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/booking_model.dart';

class BookingService {
  Future<Booking?> getBookingData() async {
    Booking? result;

    try {
      final response = await http.get(
          Uri.parse('https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8'),
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(Duration(seconds: 10),
          onTimeout: () => http.Response('Error', 408)
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(utf8.decode(response.bodyBytes));
        result = Booking.fromJson(json);
      } else if (response.statusCode == 408) {
        print('timeout');
      } else {
        print('error');
      }
    } catch (e) {
      print(e.toString());
    }

    return result;
  }
}