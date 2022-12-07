import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import '../schedule/write_schedule_page.dart';
import 'mypage/mypage_main_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/chat_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/my_home_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          MyHomePage(),
          ChatPage(),
          Center(child: Text("작성")),
          SearchPage(),
          MyPageMainPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      //height: 55,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xffe2e2e2), width: 1.0)),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 20.0,
        //unselectedFontSize: 10.0,
        //selectedFontSize: 10.0,
        selectedLabelStyle: textTheme().bodyText2,
        unselectedLabelStyle: textTheme().bodyText2,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: theme().primaryColor,
        unselectedItemColor: Color(0xff9999A3),
        onTap: (index) {
          index == 2
              ? _writeForm()
              : setState(() {
                  _selectedIndex = index;
                });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/home.png", width: 20, height: 20),
            activeIcon: Image.asset("assets/home_selected.png"),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/chat.png", width: 20, height: 20),
            activeIcon: Image.asset("assets/chat_selected.png"),
            label: "채팅",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/write.png", width: 20, height: 20),
            activeIcon: Image.asset("assets/write_selected.png"),
            label: "글쓰기",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/search.png", width: 20, height: 20),
            activeIcon: Image.asset("assets/search_selected.png"),
            label: "검색",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/my.png", width: 20, height: 20),
            activeIcon: Image.asset("assets/my_selected.png"),
            label: "MY",
          ),
        ],
      ),
    );
  }

  Future<dynamic> _writeForm() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          //위 패딩은 모달창의 터치 가능한 영역 내부 패딩
          height: 400,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                  width: 50,
                  child: Divider(height: 1, color: kchacholGreyColor(), thickness: 4),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
