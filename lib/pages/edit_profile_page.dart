import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text("Edit Profile"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
          ),
        ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name", style: secondaryTextStyle.copyWith(fontSize: 13)),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: "Alex Keinnzal",
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: subtitleColor)),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Username", style: secondaryTextStyle.copyWith(fontSize: 13)),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: "@alexkeinn",
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: subtitleColor)),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email Address", style: secondaryTextStyle.copyWith(fontSize: 13)),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: "alex.kein@gmail.com",
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: subtitleColor)),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/image_profile.png'),
                ),
              ),
            ),
            nameInput(),
            usernameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      body: content(),
    );
  }
}
