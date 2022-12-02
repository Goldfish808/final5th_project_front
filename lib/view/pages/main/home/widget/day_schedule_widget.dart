import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/theme.dart';

class DaySchedule extends StatelessWidget {
  DaySchedule({Key? key}) : super(key: key);

  final List<String> week = ["MON", "TUE", "WED", "THU", "금", "토", "일"];

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
                color: primary[50],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleItem(int index) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 14, top: 14),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ksubPrimaryColor(),
            ),
            padding: EdgeInsets.only(left: 11, top: 5, bottom: 5, right: 11),
            child: Text("카테고리 명",
                style: textTheme(color: Colors.white, weight: FontWeight.bold).bodyText2,
                maxLines: 1,
                overflow: TextOverflow.clip),
          ),
        ],
      ),
    );
  }
}
