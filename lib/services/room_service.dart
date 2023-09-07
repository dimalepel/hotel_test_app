import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/room_model.dart';

class RoomService {
  Future<List<Room>?> gelAllRooms() async {
    List<Room>? result = [];

    try {
      final response = await http.get(
          Uri.parse('https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd'),
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8',
          });

      if (response.statusCode == 200) {
        final json = jsonDecode(utf8.decode(response.bodyBytes));

        result = RoomResult.fromJson(json).rooms;

        return result;
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