import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:shamo/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ProductModel> listData = [];
  bool loading = true;

  Future<void> fetchData() async {
    final url = Uri.parse('http://10.0.2.2/shamo-backend/public/api/products');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<ProductModel> products = (jsonData['data']['data'] as List).map((e) => ProductModel.fromJson(e)).toList();
      if (products.isNotEmpty) {
        listData = products;
        setState(() {
          loading = false;
        });
      }
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //if (loading) fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset('assets/image_profile.png', width: 64),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hallo, Alex", style: primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold)),
                      Text("@alexkeinn", style: subtitleTextStyle.copyWith(fontSize: 16)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
                  },
                  child: Image.asset('assets/button_exit.png', width: 20),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: secondaryTextStyle.copyWith(fontSize: 13)),
            Icon(Icons.chevron_right, color: primaryTextColor),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(
            color: backgroundColor3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Account", style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem("Edit Profile"),
              ),
              menuItem("Your Orders"),
              menuItem("Help"),
              SizedBox(height: 30),
              Text("General", style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
              menuItem("Privacy & Policy"),
              menuItem("Term of Service"),
              menuItem("Rate App"),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
