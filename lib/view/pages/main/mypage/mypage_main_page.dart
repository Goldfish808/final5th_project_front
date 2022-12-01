import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/mypage.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/mypage_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/mypage_profile.dart';

class MyPageMainPage extends StatelessWidget {
  const MyPageMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyPageAppBar(),
      body: ListView(
        padding: EdgeInsets.only(top: 12, left: 20, right: 20),
        children: List.generate(MyPages.length, (index) => MypageProfile(myPage: MyPages[index])),
      ),
    );
  }
}
