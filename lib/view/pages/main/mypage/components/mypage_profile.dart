import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/mypage.dart';

class MypageProfile extends StatelessWidget {
  const MypageProfile({Key? key, required this.myPage}) : super(key: key);
  final MyPage myPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(myPage.myImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Text(
                myPage.name,
                style: textTheme().headline2,
              ),
            ),
            subtitle: Container(
              width: 160,
              child: Text(
                myPage.intro,
                style: textTheme().bodyText2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
