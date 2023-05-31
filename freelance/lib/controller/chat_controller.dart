import 'package:flutter/material.dart';
import 'package:freelance/api/api_mychat.dart';
import 'package:freelance/model/chatlist_model.dart';
import 'package:freelance/model/detailchat_model.dart';

import 'package:http/http.dart' as http;

import '../utils/user_token.dart';

class ChatController {
  final ApiMyChat _apiMyChat = ApiMyChat();
  final UserToken _userToken = UserToken();

  Future<MyChatlistModel?> getData() async {
    final getId = await _userToken.getUserId();
    http.Response result = await _apiMyChat.getAllMyChat(getId);
    if (result.statusCode < 400) {
      //debugPrint(result.body);
      return myChatlistModelFromJson(result.body);
    } else {
      return null;
    }
  }

  Future<Welcome?> getDetailData() async {
    final getId = await _userToken.getUserId();
    http.Response result = await _apiMyChat.getDetailMyChat(getId);
    if (result.statusCode < 400) {
      debugPrint(result.body);
      return welcomeFromJson(result.body);
    } else {
      return null;
    }
  }
}
