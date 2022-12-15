import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/dto/chat/chat_req_dto.dart';
import 'package:riverpod_firestore_steam1/dto/response_dto.dart';
import 'package:riverpod_firestore_steam1/dto/write/todo_req_dto.dart';
import 'package:riverpod_firestore_steam1/models/schedule/todo_api_repository.dart';
import 'package:riverpod_firestore_steam1/service/write_service.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/model/write_view_model.dart';

import '../models/chat/chat_firestore_repository.dart';
import '../models/schedule/todo.dart';

final writeController = Provider<WriteController>((ref) {
  return WriteController(ref);
});

class WriteController {
  final WriteService writeService = WriteService();
  final Ref _ref;
  WriteController(this._ref);

  Future<void> insert({required String todoTitle, required bool isFinished}) async {
    // 1. DTO 변환
    TodoReqDto todoReqDto = TodoReqDto(todoTitle: todoTitle, isFinished: isFinished);

    // 2. 통신 요청
    Todo responseDto = await _ref.read(todoApiRepository).insert(todoReqDto);
    _ref.read(todoListViewModel.notifier).addTodo(responseDto);

    // 3. 비지니스 로직 처리
    if (responseDto.todoFinished == "CREATED") {
      print("todo 작성 성공");
      // 4. 응답된 데이터를 ViewModel에 반영해야 한다면 통신 성공시에 추가하기
    } else {
      //젠장,, 아래의 cupertino다이얼로그는 안 뜸
      //showCupertinoDialog(context: mContext!, builder: (context) => MyAlertDialog(msg: "tlqkf"));
      //showDialog(context: mContext!, builder: (context) => MyAlertDialog(msg: "이메일 또는 비밀번호를 확인해 주세요"));
      // ScaffoldMessenger.of(mContext!).showSnackBar(
      //   const SnackBar(content: Text("회원가입 실패")),
      // );
      print("todo 작성 실패");
    }
  }
}
