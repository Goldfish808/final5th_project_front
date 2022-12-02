import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/chat_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/home_app_bar.dart';

import '../components/line_app_bar.dart';

class MyPageProfilePage extends StatelessWidget {
  const MyPageProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("프로필 수정"),
      ),
    );
  }
}
