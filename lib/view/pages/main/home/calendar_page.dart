import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/line_app_bar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<NeatCleanCalendarEvent> _todaysEvents = [
    NeatCleanCalendarEvent('Event A',
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
        description: 'A special event',
        color: Colors.blue[700]),
  ];

  final List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent('MultiDay Event A',
        description: 'test desc',
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 12, 0),
        color: Color(0xffAE8EEA),
        isMultiDay: true),
    NeatCleanCalendarEvent('Allday Event B',
        description: 'test desc',
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 17, 0),
        color: Color(0xffAFEBFD),
        isAllDay: true),
    NeatCleanCalendarEvent(
      'Normal Event C',
      description: 'test desc',
      startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 30),
      endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 17, 0),
      color: Color(0xffFFE681),
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("", ""),
      ),
      body: SafeArea(
        child: Calendar(
          hideTodayIcon: true,
          eventTileHeight: 100,
          startOnMonday: false,
          weekDays: ['일', '월', '화', '수', '목', '금', '토'],
          defaultDayColor: kPrimaryColor(),
          eventsList: _eventList,
          isExpandable: true,
          bottomBarColor: klightGreyColor(),
          eventDoneColor: null,
          selectedColor: primary,
          selectedTodayColor: kchacholGreyColor(),
          bottomBarArrowColor: primary,
          todayColor: primary,
          eventColor: null,
          locale: 'ko-KR',
          todayButtonText: "",
          allDayEventText: '',
          multiDayEndText: '',
          isExpanded: true,
          expandableDateFormat: 'MMMM dd일 EEEE',
          datePickerType: DatePickerType.date,
          dayOfWeekStyle: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: primary,
      ),
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}
