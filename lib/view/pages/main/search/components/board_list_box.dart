import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/board.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/board_list_comment_page.dart';

class BoardListBox extends StatelessWidget {
  const BoardListBox({Key? key, required this.board}) : super(key: key);
  final Board board;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  image: DecorationImage(image: AssetImage(board.userImg), fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
              Text(
                board.name,
                style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline3,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(board.boardImg[1]), fit: BoxFit.cover),
                border: Border.all(color: kmidGreyColor(), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 15,
                height: 15,
                child: FavoriteButton(
                  isFavorite: false,
                  iconSize: 30,
                  valueChanged: (_isFavorite) {
                    print('Is Favorite : $_isFavorite');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                child: Container(
                  width: 15,
                  height: 15,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BoardListCommentPage()),
                      );
                    },
                    padding: EdgeInsets.zero,
                    icon: Image.asset("assets/comment_icon.png", width: 15, height: 15),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                board.title,
                style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).bodyText1,
              ),
              SizedBox(height: 4),
              Text(
                board.content,
                style: textTheme(color: kchacholGreyColor(), weight: FontWeight.w200).bodyText1,
              )
            ],
          ),
        ],
      ),
    );
  }
}
