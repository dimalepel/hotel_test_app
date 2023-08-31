import 'package:flutter/material.dart';
import 'package:hotel_test_app/screens/home_screen.dart';

import '../screens/room_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Бронирование номеров',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}