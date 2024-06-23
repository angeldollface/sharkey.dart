import 'package:dio/dio.dart';

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
      result["result"] = resp.data;
    }
    catch(e){
      result["error"] = e.toString();
    }
  }
  else {
    try {
      resp = await dioInstance.get(reqUrl, data: payload);
      result["result"] = resp.data;
    }
    catch(e){
      result["error"] = e.toString();
    }
  }
  return result;
}


