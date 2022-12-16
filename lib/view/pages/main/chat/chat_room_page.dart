import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/components/my_chat.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/line_app_bar.dart';
import 'package:uuid/uuid.dart';

class TextMessage {
  int chatUserId;
  String chatMessageId; //randomId 사용할거라서 Stirng
  String chatUserName;
  String chatMessageContent;
  DateTime chatCreatedAt;

  TextMessage(
      {required this.chatUserId,
      required this.chatMessageId,
      required this.chatUserName,
      required this.chatMessageContent,
      required this.chatCreatedAt});
  Map<String, dynamic> toJson() {
    return {
      "chatUserId": chatUserId,
      "chatMessageId": chatMessageId,
      "chatUserName": chatUserName,
      "chatMessageContent": chatMessageContent,
      "chatCreatedAt": chatCreatedAt
    };
  }
}

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  List<dynamic> _messageList = []; //다양한 타입으로 들어오고 보낼 수 있어서 dynamic
  String randomId = Uuid().v4(); //MessageId 를 랜덤하게 사용할거임 ( FireStore 특성 )

  final List<MyChat> chats = [];
  final TextEditingController _editingMessage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(55), child: LineAppBar("상대방이름", null)),
        body: Container(
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("채팅 메세지"),
                      MyChat(text: "안녕", time: "시간"),
                    ],
                  ),
                ),
                _buildSubmitContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addMessage(TextMessage message) async {
    setState(() {
      _messageList.insert(0, message);
    });
    await FirebaseFirestore.instance.collection('chat_room').doc('korea good').collection('contents').add(
      {
        'chatUserId': message.chatUserId,
        'chatUserName': message.chatUserName,
        'chatCreatedAt': message.chatCreatedAt,
        'chatMessageId': message.chatMessageId,
        'chatMessageContent': message.chatMessageContent,
        //'안의이름은내가지정함'
      },
    );
  }

  /* void _getMessage() async {
    final getData = await FirebaseFirestore.instance.collection('chat_room').doc("이름").collection('message').get();
    final messages = getData.docs.map(
      (e) => TextMessage(),
    );
  }*/

  Container _buildSubmitContainer() {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color(0xffd9d9d9),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icon_bottom_plus.svg", width: 24),
            padding: EdgeInsets.zero,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: TextField(
                controller: _editingMessage,
                maxLines: 1,
                style: textTheme().headline3,
                decoration: InputDecoration(focusedBorder: InputBorder.none, enabledBorder: InputBorder.none),
                onSubmitted: _handleSubmitted,
              ),
              height: 40,
              //width: 226,
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(width: 6),
          _buildMsgSendButton(),
        ],
      ),
    );
  }

  Padding _buildMsgSendButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: theme().primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _handleSubmitted(_editingMessage);
            });
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
          ),
          child: Text(
            "전송",
            style: textTheme(color: Colors.white, weight: FontWeight.w600).headline3,
          ),
        ),
      ),
    );
  }

  void _handleSubmitted(text) {
    final textMessage = TextMessage(
      chatUserId: 1, //로그인 한 유저의 아이디( 이것은 프로바이더 RiverPod 숙지하면 사용할 수 있음 )
      chatMessageId: randomId,
      chatUserName: "메세지 작성자 이름",
      chatMessageContent: _editingMessage.text, //"작성된 메세지",
      chatCreatedAt: DateTime.now(),
    );
    _addMessage(textMessage);
    _editingMessage.clear();
  }
}
