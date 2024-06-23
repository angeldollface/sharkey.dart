import 'package:sharkey/sharkey.dart';

import './network.dart';

Future<Map<String,dynamic>> getUserInfo(
  String userName,
  String server,
  String baseUrl,
  String apiBase
) async {
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['username'] = userName;
  payload['host'] = server;
  payload['detailed'] = true;
  String reqUrl = '$baseUrl$apiBase/users/show';
  Map<String,dynamic> userInfo = await fetchJSON(
    'POST', 
    headers, 
    payload, 
    reqUrl
  );
  return userInfo;
}

Future<Map<String,dynamic>> getUserFollowing(
  String userName, 
  String server,
  String baseUrl,
  String apiBase
) async {
  String reqUrl = '$baseUrl$apiBase/users/following';
  Map<String,dynamic> targetUserResponse = await getUserInfo(
    userName,
    server, 
    baseUrl, 
    apiBase
  );
  String userId = '';
  if (targetUserResponse.containsKey('result')){
    Map<String,dynamic> targetUserInfo = targetUserResponse["result"];
    if (targetUserInfo.containsKey('id')){
      userId = targetUserInfo['id'];
    }
    else {
      // Hm.
    }
  }
  else {
    // Hm.
  }
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['username'] = userName;
  payload['host'] = server;
  payload['userId'] = userId;
  Map<String,dynamic> usersFollowing = await fetchJSON(
    'POST', 
    headers, 
    payload, 
    reqUrl
  );
  return usersFollowing;

}

Future<Map<String,dynamic>> getUserFollowers(
  String userName, 
  String server,
  String baseUrl,
  String apiBase
) async {
  String reqUrl = '$baseUrl$apiBase/users/followers';
  Map<String,dynamic> targetUserResponse = await getUserInfo(
    userName,
    server, 
    baseUrl, 
    apiBase
  );
  String userId = '';
  if (targetUserResponse.containsKey('result')){
    Map<String,dynamic> targetUserInfo = targetUserResponse["result"];
    if (targetUserInfo.containsKey('id')){
      userId = targetUserInfo['id'];
    }
    else {
      // Hm.
    }
  }
  else {
    // Hm.
  }
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['username'] = userName;
  payload['host'] = server;
  payload['userId'] = userId;
  Map<String,dynamic> usersFollowing = await fetchJSON(
    'POST', 
    headers, 
    payload, 
    reqUrl
  );
  return usersFollowing;

}

Future<Map<String,dynamic>> followUser(
  String userName,
  String server,
  String apiToken,
  String baseUrl,
  String apiBase,
  bool withReplies
) async {
  String reqUrl = '$baseUrl$apiBase/following/create';
  Map<String,dynamic> targetUserResponse = await getUserInfo(
    userName,
    server, 
    baseUrl, 
    apiBase
  );
  String userId = '';
  if (targetUserResponse.containsKey('result')){
    Map<String,dynamic> targetUserInfo = targetUserResponse["result"];
    if (targetUserInfo.containsKey('id')){
      userId = targetUserInfo['id'];
    }
    else {
      // Hm.
    }
  }
  else {
    // Hm.
  }
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['i'] = apiToken;
  payload['withReplies'] = withReplies;
  payload['userId'] = userId;
  Map<String,dynamic> followUserResp = await fetchJSON(
    'POST', 
    headers, 
    payload, 
    reqUrl
  );
  return followUserResp;
}

Future<Map<String,dynamic>> unfollowUser(
  String userName,
  String server,
  String apiToken,
  String baseUrl,
  String apiBase,
  bool withReplies
) async {
  String reqUrl = '$baseUrl$apiBase/following/delete';
  Map<String,dynamic> targetUserResponse = await getUserInfo(
    userName,
    server, 
    baseUrl, 
    apiBase
  );
  String userId = '';
  if (targetUserResponse.containsKey('result')){
    Map<String,dynamic> targetUserInfo = targetUserResponse["result"];
    if (targetUserInfo.containsKey('id')){
      userId = targetUserInfo['id'];
    }
    else {
      // Hm.
    }
  }
  else {
    // Hm.
  }
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['i'] = apiToken;
  payload['withReplies'] = withReplies;
  payload['userId'] = userId;
  Map<String,dynamic> followUserResp = await fetchJSON(
    'POST', 
    headers, 
    payload, 
    reqUrl
  );
  return followUserResp;
}