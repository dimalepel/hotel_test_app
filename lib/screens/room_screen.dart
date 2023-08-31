import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/app_colors.dart';
import '../widgets/chip_item.dart';
import '../widgets/slide_card.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyAlt,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Steigenberger Makadi',
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
            SizedBox(height: 8,),
            Container(
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
                    customizedBanners: [
                      SlideCard(imagePath: 'assets/images/pic_room_1.png',),
                      SlideCard(imagePath: 'assets/images/pic_room_2.png',),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Text(
                    'Стандартный с видом на бассейн или сад',
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
                    children: [
                      ChipItem(label: 'Все включено'),
                      ChipItem(label: 'Кондиционер'),
                    ],
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
                        '186 600 ₽',
                        style: TextStyle(
                            fontFamily: 'San Francisco',
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black
                        ),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        'за 7 ночей с перелётом',
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
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RoomScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.blue
                      ),
                      height: 48,
                      child: Center(
                        child: Text(
                          'Выбрать номер',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                    customizedBanners: [
                      SlideCard(imagePath: 'assets/images/pic_room_2.png',),
                      SlideCard(imagePath: 'assets/images/pic_room_1.png',),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Text(
                    'Стандартный с двумя раздельными кроватями',
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
                    children: [
                      ChipItem(label: 'Только завтра или ужин'),
                      ChipItem(label: 'Кондиционер'),
                    ],
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
                        '194 200 ₽',
                        style: TextStyle(
                            fontFamily: 'San Francisco',
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black
                        ),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        'за 7 ночей с перелётом',
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
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RoomScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.blue
                      ),
                      height: 48,
                      child: Center(
                        child: Text(
                          'Выбрать номер',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
