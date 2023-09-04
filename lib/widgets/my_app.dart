import 'package:flutter/material.dart';
import 'package:hotel_test_app/providers/hotel_provider.dart';
import 'package:hotel_test_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../screens/room_screen.dart';
import '../themes/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HotelDataProvider>(
          create: (context) => HotelDataProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            dividerColor: AppColors.transparent
        ),
        title: 'Бронирование номеров',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}