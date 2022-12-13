import 'package:flutter/material.dart';

import '../../../../../core/theme.dart';

class NoticeFollow extends StatefulWidget {
  const NoticeFollow({Key? key, required this.initialIndex}) : super(key: key);
  final int initialIndex;

  @override
  State<NoticeFollow> createState() => _NoticeFollowState();
}

class _NoticeFollowState extends State<NoticeFollow> {
  bool isEnabled = true;

  onPressedFunction() {
    print('Clicked');
  }

  String friendImg = "assets/pig.png";
  String friendName = "홍길동";
  String friendTodo = '"프로토타입 제작하기 및..."';
  String todoImg = "assets/board_1.png";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage("${friendImg}"), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    width: 175,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 43),
                      child: Text.rich(
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        TextSpan(
                          //text: 'Hello ',
                          children: <TextSpan>[
                            TextSpan(text: '${friendName}', style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline3),
                            TextSpan(
                              text: '님이 회원님을 팔로우하기 시작했습니다.',
                              style: textTheme(color: kPrimaryColor()).headline3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                _buildFollowBtn(),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: klightGreyColor(),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }

  Container _buildFollowBtn() {
    return Container(
      height: 28,
      margin: EdgeInsets.only(top: 6),
      child: ElevatedButton(
        onPressed: isEnabled ? () => onPressedFunction() : null,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 14, right: 14, bottom: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          elevation: 0.0,
        ),
        child: Text(
          "팔로우",
          style: textTheme().bodyText1,
        ),
      ),
    );
  }
}
