/*
SHARKEY.DART by Alexander Abraham, 
a.k.a. "Angel Dollface".
Licensed under the DSL v1.
*/

import 'users.dart';
import 'network.dart';

/// Attempts to retrieve the notes
/// a user has created on the supplied instance
/// as a map. If this fails, an error map is returned.
Future<Map<String,dynamic>> getUserNotes(
    String userName, 
    String server,
    String apiBase,
    String baseUrl
) async {
    Map<String,dynamic> userInfo = await getUserInfo(
        userName, 
        server, 
        baseUrl, 
        apiBase
    );
    String userId = '';
  if (userInfo.containsKey('result')){
    Map<String,dynamic> targetUserInfo = userInfo["result"];
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
  String reqUrl = '$baseUrl$apiBase/users/notes';
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['userId'] = userId;
  Map<String,dynamic> postRequest = await fetchJSON(
    'POST',
    headers,
    payload,
    reqUrl
  );
  return postRequest;
}

/// Attempts to create a text note on the supplied
/// instance.The visibility can be set to "public",
/// "home", "followers" or "direct". The "reactionAcceptance"
/// parameter allows you to set which reactions can be sent.
/// For the other parameters, when in doubt, please read
/// the API documentation here: https://misskey.io/api-doc
/// If the operation succeeds, a success map is returned.
/// If the operation fails, an error map is returned.
Future<Map<String,dynamic>> createTextNoteForUser(
  String apiBase,
  String baseUrl,
  String apiToken,
  String visibility,
  bool localOnly,
  String reactionAcceptance,
  bool noExtractMentions,
  bool noExtractHashtags,
  bool noExtractEmojis,
  String note
) async {
  String reqUrl = '$baseUrl$apiBase/notes/create';
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['visibility'] = visibility;
  payload['localOnly'] = localOnly;
  payload['reactionAcceptance'] = reactionAcceptance;
  payload['noExtractMentions'] = noExtractMentions;
  payload['noExtractHashtags'] = noExtractHashtags;
  payload['noExtractEmojis'] = noExtractEmojis;
  payload['text'] = note;
  payload['i'] = apiToken;
  Map<String,dynamic> postRequest = await fetchJSON(
    'POST',
    headers,
    payload,
    reqUrl
  );
  return postRequest;
}

/// Attempts to delete a note.
/// If the operation succeeds, a success map is returned.
/// If the operation fails, an error map is returned.
Future<Map<String,dynamic>> deleteNoteForUser(
  String apiBase,
  String baseUrl,
  String apiToken,
  String noteId
) async {
  String reqUrl = '$baseUrl$apiBase/notes/delete';
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['noteId'] = noteId;
  payload['i'] = apiToken;
  Map<String,dynamic> postRequest = await fetchJSON(
    'POST',
    headers,
    payload,
    reqUrl
  );
  return postRequest;
}

/// Attempts to like a note.
/// If the operation succeeds, a success map is returned.
/// If the operation fails, an error map is returned.
/// You can customize which reaction you want to send.
Future<Map<String,dynamic>> likeNoteForUser(
  String apiBase,
  String baseUrl,
  String apiToken,
  String noteId,
  String reaction
) async {
  String reqUrl = '$baseUrl$apiBase/notes/reactions/create';
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['i'] = apiToken;
  payload['noteId'] = noteId;
  payload['reaction'] = reaction;
  Map<String,dynamic> postRequest = await fetchJSON(
    'POST',
    headers,
    payload,
    reqUrl
  );
  return postRequest;
}

/// Attempts to unlike a note.
/// If the operation succeeds, a success map is returned.
/// If the operation fails, an error map is returned.
/// You can customize which reaction you want to reverse.
Future<Map<String,dynamic>> unlikeNoteForUser(
  String apiBase,
  String baseUrl,
  String apiToken,
  String noteId,
  String reaction
) async {
  String reqUrl = '$baseUrl$apiBase/notes/reactions/delete';
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['i'] = apiToken;
  payload['noteId'] = noteId;
  payload['reaction'] = reaction;
  Map<String,dynamic> postRequest = await fetchJSON(
    'POST',
    headers,
    payload,
    reqUrl
  );
  return postRequest;
}