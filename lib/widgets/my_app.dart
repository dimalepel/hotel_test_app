import 'package:flutter/material.dart';
import 'package:hotel_test_app/providers/hotel_provider.dart';
import 'package:hotel_test_app/providers/room_provider.dart';
import 'package:hotel_test_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../providers/booking_provider.dart';
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
        ChangeNotifierProvider<RoomDataProvider>(
          create: (context) => RoomDataProvider(),
        ),
        ChangeNotifierProvider<BookingDataProvider>(
          create: (context) => BookingDataProvider(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('ru', 'RU'),
        ],
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