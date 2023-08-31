import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/app_colors.dart';
import '../widgets/slide_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBg,
      appBar: AppBar(
        title: Text(
          'Отель',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                right: 16,
                bottom: 16,
                left: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                ),
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
                    customizedBanners: [
                      SlideCard(imagePath: 'assets/images/pic_hotel.png',),
                      SlideCard(imagePath: 'assets/images/pic_room_1.png',),
                      SlideCard(imagePath: 'assets/images/pic_room_2.png',),
                      SlideCard(imagePath: 'assets/images/pic_hotel.png',),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.orange20,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/svgs/icon_star.svg',
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(width: 2,),
                        Text(
                          '5 Превосходно',
                          style: TextStyle(
                            fontFamily: 'San Francisco',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.orange
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
