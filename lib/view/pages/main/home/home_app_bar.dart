import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends AppBar implements PreferredSizeWidget {
  HomeAppBar({super.key});

  @override
  PreferredSizeWidget? get bottom =>
      PreferredSize(child: Divider(thickness: 2, color: Colors.grey, height: 3), preferredSize: preferredSize);

  @override
  bool get automaticallyImplyLeading => false;

  @override
  Widget? get title => Row(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text("안녕, ", style: TextStyle(color: Colors.white)),
                Text("그린컴퓨터 ", style: TextStyle(color: Color(0xffFFD21D))),
                Text("님", style: TextStyle(color: Colors.white)),
                SizedBox(width: 4),
                Icon(CupertinoIcons.chevron_down, size: 14)
              ],
            ),
          ),
        ],
      );

  // @override
  // bool? get centerTitle => false;
  //
  @override
  List<Widget>? get actions => [
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell)),
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.settings)),
      ];
  //
  // @override
  // Widget? get leading => Text("dd");
  //
  // @override
  // //final Size preferredSize; // This didnot work for me.
  // Size get preferredSize => Size.fromHeight(55); //This should work.

}
