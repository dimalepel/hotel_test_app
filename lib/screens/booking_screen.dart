import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_test_app/screens/succcess_screen.dart';
import 'package:hotel_test_app/widgets/tourist_card.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../providers/booking_provider.dart';
import '../themes/app_colors.dart';
import '../widgets/accent_button.dart';
import '../widgets/custom_form_field.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  var maskFormatter = MaskTextInputFormatter(
      mask: '+# (###) ###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  @override
  void initState() {
    final bookingData = Provider.of<BookingDataProvider>(context, listen: false);
    bookingData.getBookingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookingData = Provider.of<BookingDataProvider>(context);
    final int paySumm = bookingData.booking!.tourPrice
        + bookingData.booking!.fuelCharge
        + bookingData.booking!.serviceCharge;

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
                          '${(bookingData.booking!.horating).toString()} ${bookingData.booking!.ratingName}',
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
                    '${bookingData.booking!.hotelName}',
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
                      '${bookingData.booking!.hotelAddress}',
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
                        '${bookingData.booking!.departure}',
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
                          '${bookingData.booking!.arrivalCountry}',
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
                          '${bookingData.booking!.tourDateStart} – ${bookingData.booking!.tourDateStop}',
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
                          '${bookingData.booking!.numberOfNights} ночей',
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
                          '${bookingData.booking!.hotelName}',
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
                          '${bookingData.booking!.room}',
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
                          '${bookingData.booking!.nutrition}',
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
            Form(
              key: _formKey,
              child: Column(
                children: [
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
                        CustomFormField(
                          label: 'Номер телефона',
                          formatters: [maskFormatter],
                          hint: '+7 (***) ***-**-**',
                          req: true,
                        ),
                        SizedBox(height: 8,),
                        CustomFormField(
                          label: 'Почта',
                          validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
                          req: true,
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
                  TouristCard(
                    labelText: 'Первый турист ',
                    children: [
                      SizedBox(height: 6,),
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
                      SizedBox(height: 16,),
                    ],
                  ),
                  TouristCard(
                    labelText: 'Второй турист ',
                    children: [
                      SizedBox(height: 6,),
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
                      SizedBox(height: 16,),
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
                            'Тур',
                            style: TextStyle(
                                fontFamily: 'San Francisco',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyDark
                            ),
                          ),
                          Text(
                            '${(NumberFormat().format(bookingData.booking!.tourPrice)).toString().replaceAll(',', ' ')} ₽',
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
                            '${(NumberFormat().format(bookingData.booking!.fuelCharge)).toString().replaceAll(',', ' ')} ₽',
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
                            '${(NumberFormat().format(bookingData.booking!.serviceCharge)).toString().replaceAll(',', ' ')} ₽',
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
                            '${(NumberFormat().format(paySumm)).toString().replaceAll(',', ' ')} ₽',
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
          label: 'Оплатить ${(NumberFormat().format(paySumm)).toString().replaceAll(',', ' ')} ₽',
          onTap: () {
            if (_formKey.currentState!.validate()) {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SuccessScreen()));
            }
          },
        ),
      ),
    );
  }
}
