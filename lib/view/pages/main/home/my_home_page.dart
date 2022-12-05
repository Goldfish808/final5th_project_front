import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/home_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/home_page_top.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/update_password_page.dart';

import '../../../../models/todo.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<ToDo> items = List.of(ToDoList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar("Zne.vil", context: context),
      body: Column(
        children: [
          //Container(height: 320, child: HomePageTop()),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                const SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  pinned: true,
                  expandedHeight: 380.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: HomePageTop(),
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 50.0,
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      child: _TimelineList(),
                    );
                  }, childCount: 10),
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: drawer(context),
    );
  }

  Widget drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
              height: 55,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 2, right: 14),
                    child: SizedBox(
                      width: 12,
                      height: 12,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                        icon: Image.asset("assets/icon_close.png", width: 12, height: 12),
                      ),
                    ),
                  ),
                  Text(
                    "설정",
                    style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline2,
                  )
                ],
              )),
          Container(
            height: 62,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img_banner.png'),
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("화면", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("알림", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("구독/결제", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("친구초대", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("비밀번호 변경", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePasswordPage()));
            },
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("고객센터", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("버전", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("로그아웃", style: textTheme(color: kchacholGreyColor(), weight: FontWeight.bold).headline3),
            //trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
  Widget _TimelineList() {
    return Slidable(
      key: Key(items[0].content),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: const [
          SlidableAction(
            onPressed: printSome,
            //backgroundColor: Color(0xFF7BC043),
            //foregroundColor: kchacholGreyColor(),
            icon: CupertinoIcons.gear_big,
          ),
          SlidableAction(
            onPressed: printSome,
            //backgroundColor: Color(0xFF0392CF),
            foregroundColor: primary,
            icon: CupertinoIcons.trash,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 4),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: klightGreyColor(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: kchacholGreyColor(),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "플러터 디자인 하기",
                      style: textTheme(color: kPrimaryColor(), weight: FontWeight.w500).headline3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void printSome(BuildContext context) {
  print("클릭됨");
=======
  Widget drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
              height: 55,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 2, right: 14),
                    child: SizedBox(
                      width: 12,
                      height: 12,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                        icon: Image.asset("assets/icon_close.png", width: 12, height: 12),
                      ),
                    ),
                  ),
                  Text(
                    "설정",
                    style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline2,
                  )
                ],
              )),
          Container(
            height: 62,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img_banner.png'),
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("화면", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("알림", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("구독/결제", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("친구초대", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("비밀번호 변경", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePasswordPage()));
            },
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("고객센터", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("버전", style: textTheme(color: kPrimaryColor()).headline3),
            trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("로그아웃", style: textTheme(color: kchacholGreyColor(), weight: FontWeight.bold).headline3),
            //trailing: Image.asset("assets/icon_arrow_next.png", width: 8),
            onTap: () {},
            shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
          ),
        ],
      ),
    );
  }
>>>>>>> f95fde314bfa4c6c3261348c979d5de9c2708ad9
}
