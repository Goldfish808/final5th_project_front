import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class HomePageTopWidget extends StatelessWidget {
  HomePageTopWidget({Key? key}) : super(key: key);

  final List<String> week = ["월", "화", "수", "목", "금", "토", "일"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopfirstline(),
        SizedBox(height: 18),
        _buildDay(),
        SizedBox(height: 16),
        _builSchedule(),
      ],
    );
  }

  Widget _builSchedule() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      //margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 170.0,
      child: ListView.builder(
        itemCount: week.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              //padding: EdgeInsets.only(right: 12),
              alignment: Alignment.center,
              width: 130,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 3),
                    child: Text(week[index], style: textTheme(color: kchacholGreyColor()).bodyText1),
                  ),
                  Text("2" + "$index", style: textTheme().bodyText1),
                ],
              ),
              decoration: BoxDecoration(
                color: klightGreyColor(),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDay() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        decoration: BoxDecoration(
          color: klightGreyColor(),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.zero,
              topRight: Radius.zero),
        ),
        padding: const EdgeInsets.all(4),
        child: Container(
          padding: const EdgeInsets.only(left: 4),
          //margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 54.0,
          child: ListView.builder(
            itemCount: week.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  //padding: EdgeInsets.only(right: 12),
                  alignment: Alignment.center,
                  width: 42,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 3),
                        child: Text(week[index], style: textTheme(color: kchacholGreyColor()).bodyText1),
                      ),
                      Text("2" + "$index", style: textTheme().bodyText1),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalList() {
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
