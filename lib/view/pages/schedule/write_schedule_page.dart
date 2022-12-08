import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/theme.dart';
import '../../../models/todo.dart';
import '../../../models/users.dart';
import 'components/calendar_date_picker_test.dart';

class WriteSchedule extends StatefulWidget {
  WriteSchedule({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  @override
  State<WriteSchedule> createState() => _WriteScheduleState();
}

class _WriteScheduleState extends State<WriteSchedule> {
  final TextEditingController _textController = TextEditingController();

  final List<User> userList = List.of(users);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSearchAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              style: textTheme().headline1,
              maxLines: null, //이걸 NULL 로 해주고
              maxLength: 50,
              decoration: const InputDecoration(
                  hintText: "할 일 작성",
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  focusColor: Colors.black),
              onSubmitted: _handleSubmitted,
            ),
            SizedBox(height: 20),
            DatePickerExample()
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(text) {
    _textController.clear();
    print(text);

    ToDo(
      content: text,
      time: DateFormat("a K:m").format(new DateTime.now()),
      date: 08,
      day: "Mon",
      done: false,
    );
  }

  PreferredSize _buildSearchAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: AppBar(
          leading: IconButton(
            icon: Image.asset("assets/icon_arrow_back.png", width: 10),
            onPressed: () {
              Navigator.pop(context);
            },
            color: kPrimaryColor(),
          ),
          title: Container(
            height: 40,
            width: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("스케줄 작성", style: textTheme(color: Colors.black).headline1, textAlign: TextAlign.center),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
