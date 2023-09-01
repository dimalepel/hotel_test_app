import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../widgets/accent_button.dart';
import 'home_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Заказ оплачен',
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Container(
                  width: 94,
                  height: 94,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: AppColors.greyAlt
                  ),
                  child: Image.asset(
                    'assets/images/pic_party.png',
                    fit: BoxFit.cover,
                    height: 44,
                    width: 44,
                  ),
                ),
              ),
              SizedBox(height: 32,),
              Text(
                'Ваш заказ принят в работу',
                style: TextStyle(
                  fontFamily: 'San Francisco',
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontSize: 22
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                style: TextStyle(
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyDark,
                    fontSize: 16
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
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
          label: 'Супер!',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),
          ),
        ),
      ),
    );
  }
}
