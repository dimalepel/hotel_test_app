import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_test_app/screens/succcess_screen.dart';

import '../themes/app_colors.dart';
import '../widgets/accent_button.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

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
          'Бронирование',
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  ),
                  SizedBox(height: 8,),
                  Text(
                    'Steigenberger Makadi',
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
                      'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
                      style: TextStyle(
                          fontFamily: 'San Francisco',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue
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
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: [
                  TableRow(
                    children: [
                      Text(
                        'Вылет из',
                        style: TextStyle(
                          fontFamily: 'San Francisco',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyDark
                        ),
                      ),
                      Text(
                        'Санкт-Петербург',
                        style: TextStyle(
                            fontFamily: 'San Francisco',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      SizedBox(height: 16,),
                      SizedBox(height: 16,),
                    ]
                  ),
                  TableRow(
                      children: [
                        Text(
                          'Страна, город',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyDark
                          ),
                        ),
                        Text(
                          'Египет, Хургада',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        SizedBox(height: 16,),
                        SizedBox(height: 16,),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text(
                          'Даты',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyDark
                          ),
                        ),
                        Text(
                          '19.09.2023 – 27.09.2023',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        SizedBox(height: 16,),
                        SizedBox(height: 16,),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text(
                          'Кол-во ночей',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyDark
                          ),
                        ),
                        Text(
                          '7 ночей',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        SizedBox(height: 16,),
                        SizedBox(height: 16,),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text(
                          'Отель',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyDark
                          ),
                        ),
                        Text(
                          'Steigenberger Makadi',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        SizedBox(height: 16,),
                        SizedBox(height: 16,),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text(
                          'Номер',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyDark
                          ),
                        ),
                        Text(
                          'Стандартный с видом на бассейн или сад',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        SizedBox(height: 16,),
                        SizedBox(height: 16,),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text(
                          'Питание',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyDark
                          ),
                        ),
                        Text(
                          'Все включено',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black
                          ),
                        ),
                      ]
                  ),
                ],
              )
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
                    'Информация о покупателе',
                    style: TextStyle(
                        fontFamily: 'San Francisco',
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    style: TextStyle(
                      color: AppColors.blackInput,
                      fontSize: 16,
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w400
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 16,
                        top: 16
                      ),
                      filled: true,
                      fillColor: AppColors.greyAlt,
                      labelText: 'Номер телефона',
                      labelStyle: TextStyle(
                          fontFamily: 'San Francisco',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyPlaceholder
                      ),
                      floatingLabelStyle: TextStyle(
                        height: 4,
                        color: AppColors.greyPlaceholder
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    style: TextStyle(
                        color: AppColors.blackInput,
                        fontSize: 16,
                        fontFamily: 'San Francisco',
                        fontWeight: FontWeight.w400
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                          top: 16
                      ),
                      filled: true,
                      fillColor: AppColors.greyAlt,
                      labelText: 'Почта',
                      labelStyle: TextStyle(
                          fontFamily: 'San Francisco',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyPlaceholder
                      ),
                      floatingLabelStyle: TextStyle(
                          height: 4,
                          color: AppColors.greyPlaceholder
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                    style: TextStyle(
                      fontFamily: 'San Francisco',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyDark
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
          label: 'Оплатить 198 036 ₽',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessScreen()),
          ),
        ),
      ),
    );
  }
}
