import 'dart:convert';
import 'dart:developer';

import 'package:ecommerceprojct/data/models/response_model.dart';
import 'package:ecommerceprojct/data/utils/urls.dart';
import 'package:ecommerceprojct/ui/state_managers/auth_controller.dart';
import 'package:http/http.dart';

class NetworkCaller {
  NetworkCaller._();

  static Future<ResponseModel> getReuqest({required String url}) async {
    try {
      print(AuthController.token.toString());
      final Response response =
          await get(Uri.parse(Urls.baseUrl + url), headers: {
        'content-type': 'application/json',
        'Accept': 'application/json',
        'token': AuthController.token.toString()
      });
      log(response.body);
      if (response.statusCode == 200) {
        return ResponseModel(
            isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        return ResponseModel(
            isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      } else {
        return ResponseModel(
            isSuccess: false,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
          isSuccess: false, statusCode: -1, returnData: e.toString());
    }
  }

  static Future<ResponseModel> postReuqest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      print(AuthController.token.toString());
      print(body);
      final Response response = await post(Uri.parse(Urls.baseUrl + url),
          headers: {
            'content-type': 'application/json',
            'Accept': 'application/json',
            'token': AuthController.token.toString()
          },
          body:jsonEncode(body));
      log(response.body);
      if (response.statusCode == 200) {
        return ResponseModel(
            isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        return ResponseModel(
            isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      } else {
        return ResponseModel(
            isSuccess: false,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
          isSuccess: false, statusCode: -1, returnData: e.toString());
    }
  }
}
