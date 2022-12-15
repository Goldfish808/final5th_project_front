import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_firestore_steam1/dto/write/todo_req_dto.dart';
import 'package:riverpod_firestore_steam1/models/schedule/todo.dart';

import '../../core/http_connector.dart';

final todoApiRepository = Provider<TodoApiRepository>((ref) {
  return TodoApiRepository(ref);
});

class TodoApiRepository {
  Ref _ref;
  TodoApiRepository(this._ref);

  Future<Todo> insert(TodoReqDto todoReqDto) async {
    // http 통신 코드 (product 전송)
    // body
    String body = jsonEncode(todoReqDto.toJson());
    Response response = await _ref.read(httpConnector).post("/api/product", body);
    Todo todo = Todo.fromJson(jsonDecode(response.body)["data"]);
    return todo;
  }
}
