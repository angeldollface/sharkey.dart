/*
SHARKEY.DART by Alexander Abraham, 
a.k.a. "Angel Dollface".
Licensed under the DSL v1.
*/

import 'package:dio/dio.dart';

/// Attempts to retrieve a response of
/// the supplied type and 
/// with the other supplied parameters. If this succeeds,
/// the response is returned as a map. If this fails,
/// an error is returned as a map.
Future<Map<String,dynamic>>  fetchJSON(
  String method,
  Map<String, dynamic> headers, 
  Map<String, dynamic> payload, 
  String reqUrl
) async {
  final Dio dioInstance = new Dio(
    new BaseOptions(
      method: method, 
      headers: headers
    )
  );
  Response resp;
  Map<String,dynamic> result = new Map();
  if (method == 'POST'){
    try {
      resp = await dioInstance.post(reqUrl, data: payload);
      if (resp.data == ''){
        result["result"] = "success";
      }
      else {
        result["result"] = resp.data;
      }
    }
    catch(e){
      result["error"] = e.toString();
    }
  }
  else {
    try {
      resp = await dioInstance.get(reqUrl, data: payload);
      if (resp.data == ''){
        result["result"] = 'success';
      }
      else {
        result["result"] = resp.data;
      }
    }
    catch(e){
      result["error"] = e.toString();
    }
  }
  return result;
}
