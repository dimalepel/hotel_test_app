import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_test_app/providers/room_provider.dart';
import 'package:hotel_test_app/screens/booking_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../themes/app_colors.dart';
import '../widgets/accent_button.dart';
import '../widgets/chip_item.dart';
import '../widgets/slide_card.dart';

class RoomScreen extends StatefulWidget {
  final hotelName;

  const RoomScreen({super.key, required this.hotelName});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  void initState() {
    final roomData = Provider.of<RoomDataProvider>(context, listen: false);
    roomData.getRoomsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final roomData = Provider.of<RoomDataProvider>(context);
    final roomsList = roomData.rooms;

    return Scaffold(
      backgroundColor: AppColors.greyAlt,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '${widget.hotelName}',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'San Francisco',
              fontWeight: FontWeight.w500,
              color: AppColors.black
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: (roomData.loading)
        ? Center(
            child: Image.asset(
                'assets/images/spinner.gif'
            ),
          )
      : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: List.generate(
              roomsList!.length,
              (index) => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                ),
                margin: EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BannerCarousel(
                      animation: false,
                      height: 257.0,
                      margin: EdgeInsets.zero,
                      borderRadius: 15.0,
                      indicatorBottom: false,
                      disableColor: AppColors.grey,
                      activeColor: AppColors.black,
                      customizedBanners: List.generate(
                        roomsList[index].imageUrls!.length,
                        (idx) => SlideCard(imagePath: roomsList[index].imageUrls![idx]),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      '${roomsList[index].name}',
                      style: TextStyle(
                          fontFamily: 'San Francisco',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black
                      ),
                    ),
                    SizedBox(height: 8,),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                          roomsList[index].peculiarities!.length,
                          (idx) => ChipItem(label: roomsList[index].peculiarities![idx])
                      ),
                    ),
                    SizedBox(height: 8,),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.blue10
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Подробнее о номере',
                              style: TextStyle(
                                  fontFamily: 'San Francisco',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blue
                              ),
                            ),
                            SizedBox(width: 2,),
                            SvgPicture.asset(
                              'assets/images/svgs/icon_chewron_right.svg',
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                AppColors.blue,
                                BlendMode.srcIn
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${(NumberFormat().format(roomsList[index].price)).toString().replaceAll(',', ' ')} ₽',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text(
                          '${(roomsList[index].pricePer)!.toLowerCase()}',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyDark
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    AccentButton(
                      label: 'Выбрать номер',
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen())),
                    ),
                  ],
                ),
              ),
            ),
            // children: [
            //   SizedBox(height: 8,),
            //
            //   Container(
            //     padding: const EdgeInsets.all(16),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12),
            //       color: AppColors.white,
            //     ),
            //     margin: EdgeInsets.only(bottom: 8),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         BannerCarousel(
            //           animation: false,
            //           height: 257.0,
            //           margin: EdgeInsets.zero,
            //           borderRadius: 15.0,
            //           indicatorBottom: false,
            //           disableColor: AppColors.grey,
            //           activeColor: AppColors.black,
            //           customizedBanners: [
            //             SlideCard(imagePath: 'assets/images/pic_room_2.png',),
            //             SlideCard(imagePath: 'assets/images/pic_room_1.png',),
            //           ],
            //         ),
            //         SizedBox(height: 8,),
            //         Text(
            //           'Стандартный с двумя раздельными кроватями',
            //           style: TextStyle(
            //               fontFamily: 'San Francisco',
            //               fontSize: 22,
            //               fontWeight: FontWeight.w500,
            //               color: AppColors.black
            //           ),
            //         ),
            //         SizedBox(height: 8,),
            //         Wrap(
            //           spacing: 8,
            //           runSpacing: 8,
            //           children: [
            //             ChipItem(label: 'Только завтра или ужин'),
            //             ChipItem(label: 'Кондиционер'),
            //           ],
            //         ),
            //         SizedBox(height: 8,),
            //         InkWell(
            //           onTap: () {},
            //           child: Container(
            //             padding: EdgeInsets.symmetric(
            //               vertical: 2,
            //               horizontal: 10,
            //             ),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(5),
            //                 color: AppColors.blue10
            //             ),
            //             child: Row(
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 Text(
            //                   'Подробнее о номере',
            //                   style: TextStyle(
            //                       fontFamily: 'San Francisco',
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w500,
            //                       color: AppColors.blue
            //                   ),
            //                 ),
            //                 SizedBox(width: 2,),
            //                 SvgPicture.asset(
            //                   'assets/images/svgs/icon_chewron_right.svg',
            //                   width: 24,
            //                   height: 24,
            //                   colorFilter: ColorFilter.mode(
            //                       AppColors.blue,
            //                       BlendMode.srcIn
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         SizedBox(height: 8,),
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.end,
            //           children: [
            //             Text(
            //               '194 200 ₽',
            //               style: TextStyle(
            //                   fontFamily: 'San Francisco',
            //                   fontSize: 30,
            //                   fontWeight: FontWeight.w600,
            //                   color: AppColors.black
            //               ),
            //             ),
            //             SizedBox(width: 8,),
            //             Text(
            //               'за 7 ночей с перелётом',
            //               style: TextStyle(
            //                   fontFamily: 'San Francisco',
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w400,
            //                   color: AppColors.greyDark
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(height: 16,),
            //         AccentButton(
            //           label: 'Выбрать номер',
            //           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen())),
            //         ),
            //       ],
            //     ),
            //   ),
            // ],
          ),
        ),
      ),
    );
  }
}
