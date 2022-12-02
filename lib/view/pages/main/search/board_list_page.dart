import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/components/board_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/components/board_app_bar_v2.dart';

class BoardListPage extends StatelessWidget {
  const BoardListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BoardAppBarV2(bar_title: "TODOFRIENDS"),
    );
  }
}
