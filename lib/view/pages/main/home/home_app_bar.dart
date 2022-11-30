import 'package:flutter/material.dart';

class HomeAppBar extends AppBar implements PreferredSizeWidget {
  HomeAppBar({super.key});

  // @override
  // Widget? get title => const Text("김나박이");

  @override
  bool? get centerTitle => false;

  @override
  List<Widget>? get actions => [];

  @override
  Widget? get title => Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "안녕, "),
            TextSpan(text: "그린컴퓨터"),
            TextSpan(text: "님"),
          ],
        ),
      );

  @override
  //final Size preferredSize; // This didnot work for me.
  Size get preferredSize => Size.fromHeight(55); //This should work.
}
