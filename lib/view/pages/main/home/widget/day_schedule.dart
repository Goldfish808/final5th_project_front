import 'package:flutter/material.dart';

import '../../../../../core/theme.dart';

class DaySchedule extends StatelessWidget {
  DaySchedule({Key? key}) : super(key: key);

  final List<String> week = ["월", "화", "수", "목", "금", "토", "일"];

  @override
  Widget build(BuildContext context) {
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
              child: _buildScheduleItem(index),
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

  Column _buildScheduleItem(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    height: 22,
                    alignment: Alignment.center,
                    color: ksubPrimaryColor(),
                    child: Text(
                      "카ffwafawawfawfawf테고리 명",
                      style: textTheme(color: Colors.white).bodyText2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
