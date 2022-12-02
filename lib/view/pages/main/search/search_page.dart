import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/line_app_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSearchAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 24,
        ),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/dog.png",
                width: 104,
                height: 104,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }

  PreferredSize _buildSearchAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
            color: kPrimaryColor(),
          ),
          leadingWidth: 20,
          title: Container(
            height: 40,
            child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: klightGreyColor(),
                    hintText: "닉네임,키워드로 검색하세요",
                    contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    isDense: true,
                    hintStyle: textTheme(color: kchacholGreyColor(), weight: FontWeight.bold).headline3,
                    suffixIcon: Image.asset("assets/magnifier_icon.png")),
                keyboardType: TextInputType.text),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
