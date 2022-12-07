import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/event.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

CalendarFormat _calendarFormat = CalendarFormat.month;

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  //final DateTime focusedDay;
  final OnDaySelected? onDaySelected;

  const Calendar(
      {required this.onDaySelected,
      required this.selectedDay,
      //required this.focusedDay,
      Key? key})
      : super(key: key);

  List<Event> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
    );
    final defaultTextStyle = GoogleFonts.notoSans(
      color: kPrimaryColor(),
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
    return Container(
      decoration: BoxDecoration(color: Color(0xffF9F9F9)),
      padding: EdgeInsets.only(bottom: 14),
      child: TableCalendar(
        locale: 'ko-KR',
        daysOfWeekHeight: 30,
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2022, 01, 01),
        lastDay: DateTime.utc(2023, 12, 31),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: GoogleFonts.notoSans(
            fontWeight: FontWeight.w800,
            fontSize: 18.0,
          ),
          leftChevronIcon:
              Image.asset("assets/icon_calendar_prev.png", width: 28),
          rightChevronIcon:
              Image.asset("assets/icon_calendar_next.png", width: 28),
          headerMargin:
              EdgeInsets.only(top: 16, bottom: 24, left: 100, right: 100),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor(),
            ),
            weekendStyle: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xffF36B7F),
            )),
        calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          todayDecoration: BoxDecoration(
            color: kpointYellowColor(),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          outsideDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          defaultDecoration: defaultBoxDeco,
          weekendDecoration: defaultBoxDeco,
          selectedDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: createMaterialColor(Color(0xff6E34DA)),
              width: 1.0,
            ),
          ),
          defaultTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle,
          selectedTextStyle: GoogleFonts.notoSans(
            color: createMaterialColor(Color(0xff6E34DA)),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          canMarkersOverflow: false,
          markersAutoAligned: true,
          markerSize: 4,
          markerMargin: EdgeInsets.all(2),
          markersMaxCount: 3,
          markersOffset: PositionedOffset(),
          markerDecoration: BoxDecoration(
            color: kpointMintColor(),
            shape: BoxShape.circle,
          ),
          outsideTextStyle: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: kmidGreyColor(),
          ),
          cellMargin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          cellAlignment: Alignment.center,
        ),
        eventLoader: (day) {
          return getEventsForDay(day);
        },
        onDaySelected: onDaySelected,
        selectedDayPredicate: (DateTime date) {
          if (selectedDay == null) {
            return false;
          }
          return date.year == selectedDay!.year &&
              date.month == selectedDay!.month &&
              date.day == selectedDay!.day;
        },
        availableCalendarFormats: {
          CalendarFormat.month: '한달',
          CalendarFormat.week: '1주',
        },
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
      ),
    );
  }

  void setState(Null Function() param0) {}
}
