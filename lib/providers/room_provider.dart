import 'package:flutter/cupertino.dart';
import 'package:hotel_test_app/services/room_service.dart';

import '../models/room_model.dart';

class RoomDataProvider extends ChangeNotifier {
  List<Room>? rooms;
  bool loading = false;
  final roomService = RoomService();

  getRoomsData() async {
    loading = true;
    rooms = (await roomService.gelAllRooms());
    loading = false;

    notifyListeners();
  }
}