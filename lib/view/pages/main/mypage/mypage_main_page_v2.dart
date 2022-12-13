import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

import '../components/home_app_bar.dart';
import '../home/update_password_page.dart';
import 'components/mypage_profile.dart';
import 'components/profile_tab_v2.dart';

class MyPageMainPageV2 extends StatefulWidget {
  const MyPageMainPageV2({Key? key}) : super(key: key);

  @override
  State<MyPageMainPageV2> createState() => _MyPageMainPageV2State();
}

class _MyPageMainPageV2State extends State<MyPageMainPageV2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(null, context: context),
      body: Column(
        children: [
          SizedBox(height: 22),
          MypageProfile(),
          SizedBox(height: 24),
          Expanded(
            child: ProfileTabV2(),
          ),
        ],
      ),
      endDrawer: _drawer(context),
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: false,
    );
  }

  Widget _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
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
                          Navigator.of(context).pop();
                        },
                        padding: EdgeInsets.zero,
                        icon: SvgPicture.asset("assets/icon_close.svg", width: 12, height: 12),
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
          _buildMenuList(text: "화면", fontColor: kPrimaryColor()),
          _buildMenuList(text: "알림", fontColor: kPrimaryColor()),
          _buildMenuList(text: "구독/결제", fontColor: kPrimaryColor()),
          _buildMenuList(text: "친구초대", fontColor: kPrimaryColor()),
          _buildMenuList(text: "비밀번호 변경", fontColor: kPrimaryColor()),
          _buildMenuList(text: "고객센터", fontColor: kPrimaryColor()),
          _buildMenuList(text: "버전", fontColor: kPrimaryColor()),
          _buildMenuList(
            text: "로그아웃",
            fontColor: kchacholGreyColor(),
          ),
        ],
      ),
    );
  }

  ListTile _buildMenuList({required String text, Color? fontColor, FontWeight? fontWeight}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      title: Text(text, style: textTheme(color: fontColor, weight: fontWeight).headline3),
      trailing: text != "로그아웃" ? SvgPicture.asset("assets/icon_arrow_next.svg", width: 8) : null,
      onTap: () {
        text == "비밀번호 변경"
            ? Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdatePasswordPage()),
              )
            : null;
      },
      shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
    );
  }
}
