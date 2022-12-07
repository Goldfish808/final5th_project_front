import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/event.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/line_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/calendar.dart';

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("", "null"),
      ),
      //title: '예약페이지',
      //bottomNavigationBar: reservationBottomBar(),
      body: Column(
        children: [
          Calendar(
            selectedDay: selectedDay,
            //focusedDay: focusedDay,
            onDaySelected: onDaySelected,
          ),
          Row(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  height: 100,
                ),
              ),
            ],
          ),
        ],
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
}
