import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/mypage_app_bar.dart';

class MyPageMainPage extends StatelessWidget {
  const MyPageMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyPageAppBar(),
    );
  }
}
