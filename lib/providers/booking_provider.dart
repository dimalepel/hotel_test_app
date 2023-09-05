import 'package:flutter/foundation.dart';

import '../models/booking_model.dart';
import '../services/booking_service.dart';

class BookingDataProvider extends ChangeNotifier {
  Booking? booking;
  bool loading = false;
  final bookingService = BookingService();

  getBookingData() async {
    loading = true;
    booking = (await bookingService.getBookingData());
    loading = false;

    notifyListeners();
  }
}