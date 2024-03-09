import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: const Text("Checkout Success"),
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_empty_cart.png',
              width: 80,
            ),
            const SizedBox(height: 20),
            Text(
              "You made a transaction",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Stay at home while we\nprepare your dream shoes",
              style: secondaryTextStyle,
              textAlign: TextAlign.center,
            ),
            Container(
              height: 44,
              width: 196,
              margin: EdgeInsets.only(top: defaultMargin),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Order Other Shoes",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
            Container(
              height: 44,
              width: 196,
              margin: const EdgeInsets.only(top: 12),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff393748),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "View My Order",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                    color: const Color(0xffB7B6BF),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
