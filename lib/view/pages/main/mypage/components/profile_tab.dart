import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        SizedBox(height: 32),
        Text("2022년 11월", style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline2),
        Expanded(child: _buildTabBarView()),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: klightGreyColor()),
        ),
      ),
      child: TabBar(
        labelColor: createMaterialColor(Color(0xff6E34DA)),
        labelStyle: textTheme(weight: FontWeight.bold).bodyText1,
        unselectedLabelColor: kchacholGreyColor(),
        unselectedLabelStyle: textTheme(weight: FontWeight.w500).bodyText1,
        indicatorWeight: 3,
        controller: _tabController,
        tabs: [
          Tab(child: Text("갤러리")),
          Tab(child: Text("타임라인")),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      physics: BouncingScrollPhysics(),
      dragStartBehavior: DragStartBehavior.down,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/woman1.png",
                  width: 104,
                  height: 104,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Container(color: Colors.orange),
      ],
    );
  }
}
