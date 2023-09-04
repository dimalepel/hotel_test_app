import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_test_app/providers/hotel_provider.dart';
import 'package:hotel_test_app/screens/room_screen.dart';
import 'package:hotel_test_app/widgets/chip_item.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../themes/app_colors.dart';
import '../widgets/accent_button.dart';
import '../widgets/slide_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final hotelData = Provider.of<HotelDataProvider>(context, listen: false);
    hotelData.getHotelData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hotelData = Provider.of<HotelDataProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.greyAlt,
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
      body: (hotelData.loading)
          ? Center(
              child: Image.asset(
                'assets/images/spinner.gif'
              ),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          customizedBanners: List.generate(
                            hotelData.hotel!.imageUrls!.length,
                            (index) => SlideCard(imagePath: hotelData.hotel!.imageUrls![index]),
                          ),
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
                                '${hotelData.hotel?.rating} ${hotelData.hotel?.ratingName}',
                                style: TextStyle(
                                  fontFamily: 'San Francisco',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.orange
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          '${hotelData.hotel?.name}',
                          style: TextStyle(
                            fontFamily: 'San Francisco',
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black
                          ),
                        ),
                        SizedBox(height: 8,),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size(0, 0)
                          ),
                          child: Text(
                            '${hotelData.hotel?.address}',
                            style: TextStyle(
                                fontFamily: 'San Francisco',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue
                            ),
                          ),
                        ),
                        SizedBox(height: 16,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'от ${(NumberFormat().format(hotelData.hotel?.minimalPrice)).toString().replaceAll(',', ' ')} ₽',
                              style: TextStyle(
                                fontFamily: 'San Francisco',
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black
                              ),
                            ),
                            SizedBox(width: 8,),
                            Text(
                              '${hotelData.hotel?.priceForIt?.toLowerCase()}',
                              style: TextStyle(
                                  fontFamily: 'San Francisco',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyDark
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                    ),
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Об отеле',
                          style: TextStyle(
                            fontFamily: 'San Francisco',
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black
                          ),
                        ),
                        SizedBox(height: 16,),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                              hotelData.hotel!.aboutTheHotel!.peculiarities!.length,
                              (index) => ChipItem(label: hotelData.hotel!.aboutTheHotel!.peculiarities![index])
                          ),
                        ),
                        SizedBox(height: 12,),
                        Text(
                          '${hotelData.hotel?.aboutTheHotel?.description}',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'San Francisco',
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(height: 16,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.grey,
                          ),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/svgs/icon_smile.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 12,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Удобства',
                                        style: TextStyle(
                                          fontFamily: 'San Francisco',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.blackAlt
                                        ),
                                      ),
                                      SizedBox(height: 2,),
                                      Text(
                                        'Самое необходимое',
                                        style: TextStyle(
                                            fontFamily: 'San Francisco',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.greyDark
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    'assets/images/svgs/icon_chewron_right.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                height: 1,
                                width: MediaQuery.of(context).size.width - 96,
                                color: AppColors.greyDark15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/svgs/icon_check.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 12,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Что включено',
                                        style: TextStyle(
                                            fontFamily: 'San Francisco',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackAlt
                                        ),
                                      ),
                                      SizedBox(height: 2,),
                                      Text(
                                        'Самое необходимое',
                                        style: TextStyle(
                                            fontFamily: 'San Francisco',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.greyDark
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    'assets/images/svgs/icon_chewron_right.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                height: 1,
                                width: MediaQuery.of(context).size.width - 96,
                                color: AppColors.greyDark15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/svgs/icon_close.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 12,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Что не включено',
                                        style: TextStyle(
                                            fontFamily: 'San Francisco',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackAlt
                                        ),
                                      ),
                                      SizedBox(height: 2,),
                                      Text(
                                        'Самое необходимое',
                                        style: TextStyle(
                                            fontFamily: 'San Francisco',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.greyDark
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    'assets/images/svgs/icon_chewron_right.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: (hotelData.loading) ? null : Container(
        height: 72,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(
              color: AppColors.greyLight,
              width: 1
            )
          )
        ),
        child: AccentButton(
            label: 'К выбору номера',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RoomScreen()),
          ),
        ),
      ),
    );
  }
}
