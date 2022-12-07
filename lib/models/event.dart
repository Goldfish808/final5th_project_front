import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

class Event {
  String title;
  bool complete;
  Event(this.title, this.complete);

  @override
  String toString() => title;
}

Map<DateTime, dynamic> eventSource = {
  DateTime(2022, 1, 3): [
    Event('5분 기도하기', false),
    Event('교회 가서 인증샷 찍기', true),
    Event('QT하기', true),
    Event('셀 모임하기', false),
  ],
  DateTime(2022, 1, 5): [
    Event('5분 기도하기', false),
    Event('치킨 먹기', true),
    Event('QT하기', true),
    Event('셀 모임하기', false),
  ],
  DateTime(2022, 1, 8): [
    Event('5분 기도하기', false),
    Event('자기 셀카 올리기', true),
    Event('QT하기', false),
    Event('셀 모임하기', false),
  ],
  DateTime(2022, 1, 11): [
    Event('5분 기도하기', false),
    Event('가족과 저녁식사 하기', true),
    Event('QT하기', true)
  ],
  DateTime(2022, 1, 13): [
    Event('5분 기도하기', false),
    Event('교회 가서 인증샷 찍기', true),
    Event('QT하기', false),
    Event('셀 모임하기', false),
  ],
  DateTime(2022, 1, 15): [
    Event('5분 기도하기', false),
    Event('치킨 먹기', false),
    Event('QT하기', true),
    Event('셀 모임하기', false),
  ],
  DateTime(2022, 1, 18): [
    Event('5분 기도하기', false),
    Event('자기 셀카 올리기', true),
    Event('QT하기', false),
    Event('셀 모임하기', false),
  ],
  DateTime(2022, 1, 20): [
    Event('5분 기도하기', true),
    Event('자기 셀카 올리기', true),
    Event('QT하기', true),
    Event('셀 모임하기', true),
  ],
  DateTime(2022, 1, 21): [
    Event('5분 기도하기', false),
    Event('가족과 저녁식사 하기', true),
    Event('QT하기', false)
  ]
};

final events = LinkedHashMap(
  equals: isSameDay,
)..addAll(eventSource);
