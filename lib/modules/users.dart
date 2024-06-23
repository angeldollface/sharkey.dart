/*
SHARKEY.DART by Alexander Abraham, 
a.k.a. "Angel Dollface".
Licensed under the DSL v1.
*/

import 'network.dart';

/// Attempts to return the information
/// about a user profile as a map.
/// If this fails, an error as a map is
/// returned.
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

/// Attempts to get a list of users a user
/// is following. If this fails, an error map is
/// returned.
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
      Map<String,dynamic> errMap = new Map();
      errMap["error"] = "Could not retrieve user ID!";
      return errMap;
    }
  }
  else {
    Map<String,dynamic> errMap = new Map();
    errMap["error"] = "Error response received for retrieving user ID!";
    return errMap;
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

/// Attempts to get a list of users
/// following a user. If this fails, an error map is
/// returned.
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
      Map<String,dynamic> errMap = new Map();
      errMap["error"] = "Could not retrieve user ID!";
      return errMap;
    }
  }
  else {
    Map<String,dynamic> errMap = new Map();
    errMap["error"] = "Error response received for retrieving user ID!";
    return errMap;
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

/// Attempts to follow a user. If the operation
/// succeeds, a success map is returned. If this
/// fails, an error map is returned.
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
      Map<String,dynamic> errMap = new Map();
      errMap["error"] = "Could not retrieve user ID!";
      return errMap;
    }
  }
  else {
    Map<String,dynamic> errMap = new Map();
    errMap["error"] = "Error response received for retrieving user ID!";
    return errMap;
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

/// Attempts to unfollow a user. If the operation
/// succeeds, a success map is returned. If this
/// fails, an error map is returned.
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
      Map<String,dynamic> errMap = new Map();
      errMap["error"] = "Could not retrieve user ID!";
      return errMap;
    }
  }
  else {
    Map<String,dynamic> errMap = new Map();
    errMap["error"] = "Error response received for retrieving user ID!";
    return errMap;
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
