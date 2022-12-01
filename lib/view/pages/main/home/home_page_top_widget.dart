import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/day_date.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/day_schedule.dart';

class HomePageTopWidget extends StatelessWidget {
  HomePageTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopfirstline(),
        SizedBox(height: 18),
        DayDate(),
        SizedBox(height: 16),
        DaySchedule(),
      ],
    );
  }

  Widget _buildHorizontalListSample() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 54.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 42.0,
            color: Colors.red,
          ),
          Container(
            width: 42.0,
            color: Colors.blue,
          ),
          Container(
            width: 42.0,
            color: Colors.green,
          ),
          Container(
            width: 42.0,
            color: Colors.yellow,
          ),
          Container(
            width: 42.0,
            color: Colors.orange,
          )
        ],
      ),
    );
  }

  Widget _buildTopfirstline() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //아래 버튼은 추후에 DropDown 버튼 추가할지 고민
        children: [_buildMonthDropdown(), _buildCelendarbutton()],
      ),
    );
  }

  Widget _buildCelendarbutton() {
    return InkWell(
      onTap: () {
        print("클릭 됨 달력 아이콘");
      },
      child: Container(
        alignment: Alignment.center,
        width: 24,
        height: 24,
        child: Icon(Icons.calendar_today_outlined, size: 15),
        decoration: BoxDecoration(
          color: klightGreyColor(),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  Widget _buildMonthDropdown() {
    return InkWell(
        onTap: () {
          print("클릭 됨 11월 버튼");
        },
        child: Text("11월", style: textTheme().headline1));
  }
}
