import 'dart:convert';
import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_test_app/models/booking_model.dart';
import 'package:hotel_test_app/screens/succcess_screen.dart';
import 'package:hotel_test_app/widgets/tourist_card.dart';
import 'package:http/http.dart' as http;
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

  final formData = FormData();

  @override
  void initState() {
    final bookingData = Provider.of<BookingDataProvider>(context, listen: false);
    bookingData.getBookingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookingData = Provider.of<BookingDataProvider>(context);

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
      body: (bookingData.loading)
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.blue,
              ),
            )
          :SingleChildScrollView(
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
                          val: bookingData.customer!.phoneNumber,
                          save: (value) => formData.phoneNumber = value,
                        ),
                        SizedBox(height: 8,),
                        CustomFormField(
                          label: 'Почта',
                          validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
                          req: true,
                          val: bookingData.customer!.email,
                          save: (value) => formData.email = value,
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
                  Column(
                    children: List.generate(
                        bookingData.customer!.tourists!.length,
                        (index) => TouristCard(
                          labelText: '${convertToString(bookingData.customer!.tourists![index].id + 1)} турист',
                          children: [
                            SizedBox(height: 6,),
                            CustomFormField(
                                label: 'Имя',
                                save: (value) => bookingData.customer!.tourists![index].name = value,
                            ),
                            SizedBox(height: 8,),
                            CustomFormField(
                              label: 'Фамилия',
                              save: (value) => bookingData.customer!.tourists![index].surname = value,
                            ),
                            SizedBox(height: 8,),
                            CustomFormField(
                              label: 'Дата рождения',
                              save: (value) => bookingData.customer!.tourists![index].dateBirthday = value,
                            ),
                            SizedBox(height: 8,),
                            CustomFormField(
                              label: 'Гражданство',
                              save: (value) => bookingData.customer!.tourists![index].citizenship = value,
                            ),
                            SizedBox(height: 8,),
                            CustomFormField(
                              label: 'Номер загранпаспорта',
                              save: (value) => bookingData.customer!.tourists![index].passportNumber = value,
                            ),
                            SizedBox(height: 8,),
                            CustomFormField(
                              label: 'Срок действия загранпаспорта',
                              save: (value) => bookingData.customer!.tourists![index].datePassportStop = value,
                            ),
                            SizedBox(height: 16,),
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
                    child: InkWell(
                      onTap: () => Provider.of<BookingDataProvider>(context, listen: false).addTourist(),
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
                            '${(NumberFormat().format(bookingData.booking!.tourPrice
                                + bookingData.booking!.fuelCharge
                                + bookingData.booking!.serviceCharge)).toString().replaceAll(',', ' ')} ₽',
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
      bottomNavigationBar: (bookingData.loading) ? null : Container(
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
          label: 'Оплатить ${(NumberFormat().format(bookingData.booking!.tourPrice
              + bookingData.booking!.fuelCharge
              + bookingData.booking!.serviceCharge)).toString().replaceAll(',', ' ')} ₽',
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              late int orderId = Random().nextInt(100000);

              Map<String,String> headers = {'Content-Type': 'application/json; charset=UTF-8'};
              var map = new Map<String, dynamic>();
              map['order_id'] = orderId;
              map['hotel_detail'] = {
                'hotel': bookingData.booking!.hotelName,
                'hotel_address': bookingData.booking!.hotelAddress,
                'summ': '${(NumberFormat().format(bookingData.booking!.tourPrice
                    + bookingData.booking!.fuelCharge
                    + bookingData.booking!.serviceCharge)).toString().replaceAll(',', ' ')} ₽'
              };
              map['customer'] = {
                'phone_number': formData.phoneNumber,
                'email': formData.email
              };
              map['tourists'] = bookingData.customer!.tourists;

              final body = jsonEncode(map);

              http.Response response = await http.post(
                Uri.parse('https://webhook.site/c9d636b4-1e5d-4ddf-a17e-46e3cbd45166'),
                headers: headers,
                body: body,
              );

              if (response.statusCode == 200) {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SuccessScreen(orderId: orderId,)));
              }
            }
          },
        ),
      ),
    );
  }

  String convertToString(int num) {
    switch(num){
      case 1:
        return 'Первый';
      case 2:
        return 'Второй';
      case 3:
        return 'Третий';
      case 4:
        return 'Четвертый';
      case 5:
        return 'Пятый';
      case 6:
        return 'Шестой';
      case 7:
        return 'Седьмой';
      case 8:
        return 'Восьмой';
      case 9:
        return 'Девятый';
      default:
        return 'Еще один';
    }
  }
}

class FormData {
  String? phoneNumber;
  String? email;

  FormData({
    this.phoneNumber,
    this.email
  });
}
