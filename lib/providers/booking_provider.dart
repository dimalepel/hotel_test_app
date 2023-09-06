import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/booking_model.dart';
import '../models/customer_model.dart';
import '../services/booking_service.dart';

class BookingDataProvider extends ChangeNotifier {
  Booking? booking;
  bool loading = false;
  final bookingService = BookingService();
  Customer? customer = Customer(
      phoneNumber: '+7 (951) 555-99-00',
      email: 'examplemail.000@mail.ru',
      tourists: [
        Tourist(id: 0)
      ]
  );
  List<TextEditingController> dateBirthdayControllers = [
    TextEditingController(text: '')
  ];
  List<TextEditingController> datePassportStopControllers = [
    TextEditingController(text: '')
  ];

  getBookingData() async {
    loading = true;
    booking = (await bookingService.getBookingData());
    customer = customer;
    dateBirthdayControllers = dateBirthdayControllers;
    datePassportStopControllers = datePassportStopControllers;
    loading = false;

    notifyListeners();
  }

  void addTourist() {
    int touristLen = customer!.tourists!.length;

    dateBirthdayControllers.add(TextEditingController(text: ''));
    datePassportStopControllers.add(TextEditingController(text: ''));
    customer!.tourists!.add(Tourist(id: touristLen));
    notifyListeners();
  }

  Future<bool> sendBookingData(dynamic data) async {
    bool result = (await bookingService.sendBookingData(data));

    return result;
  }

}