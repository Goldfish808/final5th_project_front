import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_firestore_steam1/dto/write/todo_req_dto.dart';
import '../core/http_connector.dart';
import '../core/util/response_util.dart';
import '../dto/response_dto.dart';
import '../dto/user/auth_req_dto.dart';
import '../models/user/user.dart';
import 'local_service.dart';

class WriteService {
  final HttpConnector httpConnector = HttpConnector();

  static final WriteService _instance = WriteService._single();
  WriteService._single();
  factory WriteService() {
    return _instance;
  }

  Future<ResponseDto> fetchInsert(TodoReqDto todoReqDto) async {
    String requestBody = jsonEncode(todoReqDto.toJson());
    Response response = await httpConnector.post("/write", requestBody);

    return toResponseDto(response); // ResponseDto 응답
  }
}
