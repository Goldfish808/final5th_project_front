class ToDo {
  int date;
  String day;
  String content;
  String time;
  bool? done;

  ToDo(
      {required this.date,
      required this.day,
      required this.content,
      required this.time,
      required this.done});
}

// 샘플 데이터
List<ToDo> ToDoList = [
  ToDo(
      done: false,
      date: 12,
      day: "월요일",
      content: "죽고살지 못해 살까말까 응엉으엉",
      time: "AM 09:00 ~ PM 18:00"),
  ToDo(
      done: false,
      date: 13,
      day: "화요일",
      content: "이게 맞나싶기도 하고 해야할건 산더미",
      time: "PM 19:00"),
  ToDo(
      done: false,
      date: 14,
      day: "수요일",
      content: "중간정검 2",
      time: "AM 12:00 ~ PM 18:18"),
  ToDo(
      done: false,
      date: 15,
      day: "목요일",
      content: "검토 확인해보기",
      time: "AM 12:00 ~ PM 18:18"),
  ToDo(
      done: false,
      date: 16,
      day: "금요일",
      content: "프로젝트 1차 마무리 짓기",
      time: "AM 12:00 ~ PM 18:18"),
  ToDo(
      done: false,
      date: 17,
      day: "토요일",
      content: "죽자",
      time: "AM 12:00 ~ PM 18:18"),
  ToDo(
      done: false,
      date: 18,
      day: "일요일",
      content: "프로젝트 회의",
      time: "AM 12:00 ~ PM 18:18"),
  ToDo(
      done: false,
      date: 19,
      day: "월요일",
      content: "죽고살지 못해 살까말까 응엉으엉",
      time: "AM 09:00 ~ PM 18:00"),
  ToDo(
      done: false,
      date: 20,
      day: "화요일",
      content: "이게 맞나싶기도 하고 해야할건 산더미",
      time: "PM 19:00"),
  ToDo(
      done: false,
      date: 21,
      day: "수요일",
      content: "중간정검 2",
      time: "AM 12:00 ~ PM 18:18"),
  ToDo(
      done: false,
      date: 22,
      day: "목요일",
      content: "검토 확인해보기",
      time: "AM 12:00 ~ PM 18:18"),
  ToDo(
      done: false,
      date: 23,
      day: "금요일",
      content: "프로젝트 1차 마무리 짓기",
      time: "AM 12:00 ~ PM 18:18"),
  ToDo(
      done: false,
      date: 24,
      day: "토요일",
      content: "죽자",
      time: "AM 12:00 ~ PM 18:18"),
  ToDo(
      done: false,
      date: 25,
      day: "일요일",
      content: "프로젝트 회의",
      time: "AM 12:00 ~ PM 18:18"),
];
