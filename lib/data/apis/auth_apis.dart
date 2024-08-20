import 'package:neon_banking/data/model/auth_request.dart';
import 'package:neon_banking/utils/constant.dart';

import '../model/auth_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



Future<LoginResult> loginUser(AuthRequest auth_request) async {
  final loginUri = Uri.parse(Urls.loginUrl);

  final Map<String, dynamic> loginData = {
    'phone': auth_request.phone,
    'pin': auth_request.pin,
    'version': auth_request.version
  };

  final loginBody = json.encode(loginData);
  print("loginBody: $loginBody");

  final response = await http.post(
    loginUri,
    body: loginBody,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  );

  if (response.statusCode == 200) {
    return Success(response: responseFromJson(response.body));
  } else {
    return Error(error: response.body);
  }
}



