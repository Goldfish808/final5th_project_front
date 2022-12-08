import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/event.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/line_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/calendar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/day_schedule_widget.dart';

class reservationScreen extends StatefulWidget {
  const reservationScreen({Key? key}) : super(key: key);

  @override
  State<reservationScreen> createState() => _reservationScreenState();
}

class _reservationScreenState extends State<reservationScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("", "null"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xfff9f9f9)),
        child: Column(
          children: [
            Calendar(
              selectedDay: selectedDay,
              //focusedDay: focusedDay,
              onDaySelected: onDaySelected,
            ),
            Expanded(
              child: CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverFillRemaining(
                    fillOverscroll: true,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2 + bottomInset,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 4,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: kmidGreyColor()),
                                  margin: EdgeInsets.only(bottom: 18),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(left: 20, right: 20),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: 20,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 10);
                                    },
                                    itemBuilder: (context, index) {
                                      return ScheduleCard(
                                        startTime: "10시",
                                        endTime: "24시",
                                        content: '공부하기 $index',
                                        color: ksubPrimaryColor(),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(
      () {
        this.selectedDay = selectedDay;
        this.focusedDay = selectedDay;
      },
    );
  }

  Widget ScheduleCard({required String startTime, required String endTime, required String content, required Color color}) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${startTime}", style: textTheme(color: kPrimaryColor()).headline3),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
              decoration: BoxDecoration(color: Color.fromRGBO(110, 52, 218, 0.1), borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategory(color),
                  SizedBox(height: 6),
                  _buildTitleText(content),
                  Text("- 메모1", style: textTheme().headline3),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      _rowIconAndText(FontAwesomeIcons.clock, "10:00 ~ 12:00"),
                      SizedBox(width: 10),
                      _rowIconAndText(FontAwesomeIcons.locationDot, "서면 어딘가"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _rowIconAndText(icon, text) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 90,
        minWidth: 50,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 10, color: kchacholGreyColor()),
          SizedBox(width: 4),
          Text(text, style: textTheme(color: kchacholGreyColor()).bodyText1, maxLines: 1, overflow: TextOverflow.clip),
        ],
      ),
    );
  }

  Text _buildTitleText(String content) {
    return Text(
      "${content}",
      style: textTheme(weight: FontWeight.bold).headline2,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
    );
  }

  Container _buildCategory(Color color) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 5, top: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text("카테고리1", style: textTheme(color: Colors.white).bodyText1),
    );
  }
}
