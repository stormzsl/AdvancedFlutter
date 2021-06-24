import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:myapp/json_convert/user.dart';

 void encode(){
  final user =User("storm", "1092698876@qq.com");
  String json = jsonEncode(user);
  debugPrint("json encode:$json");

  Map<String,dynamic> userMap=jsonDecode(json);
  final userDecode=User.fromJson(userMap);
  debugPrint("userDecode name:${userDecode.name}");
  debugPrint("userDecode email :${userDecode.email}");
}