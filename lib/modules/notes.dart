import 'users.dart';
import 'network.dart';

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