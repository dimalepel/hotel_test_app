import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_test_app/screens/succcess_screen.dart';
import 'package:hotel_test_app/widgets/tourist_card.dart';

import '../themes/app_colors.dart';
import '../widgets/accent_button.dart';
import '../widgets/custom_form_field.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

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
                  CustomFormField(label: 'Номер телефона'),
                  SizedBox(height: 8,),
                  CustomFormField(label: 'Почта'),
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
            TouristCard(
              labelText: 'Первый турист ',
              children: [
                SizedBox(height: 20,),
                CustomFormField(label: 'Имя'),
                SizedBox(height: 8,),
                CustomFormField(label: 'Фамилия'),
                SizedBox(height: 8,),
                CustomFormField(label: 'Дата рождения'),
                SizedBox(height: 8,),
                CustomFormField(label: 'Гражданство'),
                SizedBox(height: 8,),
                CustomFormField(label: 'Номер загранпаспорта'),
                SizedBox(height: 8,),
                CustomFormField(label: 'Срок действия загранпаспорта'),
              ],
            ),
            TouristCard(
              labelText: 'Второй турист ',
              children: [
                SizedBox(height: 20,),
                CustomFormField(label: 'Имя'),
                SizedBox(height: 8,),
                CustomFormField(label: 'Фамилия'),
                SizedBox(height: 8,),
                CustomFormField(label: 'Дата рождения'),
                SizedBox(height: 8,),
                CustomFormField(label: 'Гражданство'),
                SizedBox(height: 8,),
                CustomFormField(label: 'Номер загранпаспорта'),
                SizedBox(height: 8,),
                CustomFormField(label: 'Срок действия загранпаспорта'),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white,
              ),
              margin: EdgeInsets.only(bottom: 8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Добавить туриста',
                      style: TextStyle(
                          fontFamily: 'San Francisco',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/svgs/icon_plus.svg',
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                            'Тур',
                            style: TextStyle(
                                fontFamily: 'San Francisco',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyDark
                            ),
                          ),
                          Text(
                            '186 600 ₽',
                            textAlign: TextAlign.end,
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
                            'Топливный сбор',
                            style: TextStyle(
                                fontFamily: 'San Francisco',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyDark
                            ),
                          ),
                          Text(
                            '9 300 ₽',
                            textAlign: TextAlign.end,
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
                            'Сервисный сбор',
                            style: TextStyle(
                                fontFamily: 'San Francisco',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyDark
                            ),
                          ),
                          Text(
                            '2 136 ₽',
                            textAlign: TextAlign.end,
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
                            'К оплате',
                            style: TextStyle(
                                fontFamily: 'San Francisco',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyDark
                            ),
                          ),
                          Text(
                            '198 036 ₽',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: 'San Francisco',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue
                            ),
                          ),
                        ]
                    ),
                  ],
                )
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
