import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme.dart';
import '../../../models/users.dart';

class WriteSchedule extends StatelessWidget {
  WriteSchedule({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  final List<User> userList = List.of(users);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [],
      ),
    );
  }
}
