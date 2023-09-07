import 'package:flutter/foundation.dart';
import 'package:hotel_test_app/services/hotel_service.dart';

import '../models/hotel_model.dart';

class HotelDataProvider extends ChangeNotifier {
  Hotel? hotel;
  bool loading = false;
  final hotelService = HotelService();

  getHotelData() async {
    loading = true;
    hotel = (await hotelService.getSingleHotel())!;
    loading = false;

    notifyListeners();
  }
}