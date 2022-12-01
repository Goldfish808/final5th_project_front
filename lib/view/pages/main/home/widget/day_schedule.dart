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
}
