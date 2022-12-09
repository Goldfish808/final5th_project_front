import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_form.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_password_form.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/line_button.dart';

import '../components/default_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLoginPage(context),
    );
  }

  Padding _buildLoginPage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          SizedBox(height: 110),
          Center(
            child: Text(
              "TODOFRIENDS",
              style: GoogleFonts.notoSans(
                fontSize: 38,
                fontWeight: FontWeight.w900,
                color: theme().primaryColor,
              ),
            ),
          ),
          SizedBox(height: 80),
          CustomForm("이메일", "이메일을 입력해주세요"),
          SizedBox(height: 18),
          CustomPasswordForm("비밀번호", "비밀번호를 입력해주세요"),
          SizedBox(height: 30),
          DefaultButton(routes: "/home", btnText: "로그인"),
          SizedBox(height: 10),
          LineButton("회원가입", "/join"),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/findPassword");
            },
            child: Text(
              "비밀번호 찾기",
              style: textTheme(color: kchacholGreyColor()).bodyText1,
              textAlign: TextAlign.center,
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
