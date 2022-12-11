import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../../core/http_connector.dart';
import '../../dto/response_dto.dart';
import '../../dto/user/auth_req_dto.dart';
import '../../util/response_util.dart';

final userApiRepository = Provider<UserApiRepository>((ref) {
  return UserApiRepository(ref);
});

class UserApiRepository {
  UserApiRepository(this._ref);
  Ref _ref;

  Future<ResponseDto> join(JoinReqDto joinReqDto) async {
    String requestBody = jsonEncode(joinReqDto.toJson());

    Response response =
        await _ref.read(httpConnector).post("/join", requestBody);

    return toResponseDto(response); // ResponseDto 응답
  }
}
