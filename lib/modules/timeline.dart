import 'network.dart';

Future<Map<String,dynamic>> instanceTimeline(
  String baseUrl,
  String apiBase,
  bool withFiles,
  bool withRenotes,
  bool withReplies,
  int noteCount
) async {
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['withFiles'] = withFiles;
  payload['withRenotes'] = withRenotes;
  payload['withReplies'] = withReplies;
  payload['limit'] = noteCount;
  String reqUrl = '$baseUrl$apiBase/notes/local-timeline';
  Map<String,dynamic> userInfo = await fetchJSON(
    'POST', 
    headers, 
    payload, 
    reqUrl
  );
  return userInfo;
}

Future<Map<String,dynamic>> globalTimeline(
  String baseUrl,
  String apiBase,
  bool withFiles,
  bool withRenotes,
  bool withReplies,
  int noteCount
) async {
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['withFiles'] = withFiles;
  payload['withRenotes'] = withRenotes;
  payload['withReplies'] = withReplies;
  payload['limit'] = noteCount;
  String reqUrl = '$baseUrl$apiBase/notes/global-timeline';
  Map<String,dynamic> userInfo = await fetchJSON(
    'POST', 
    headers, 
    payload, 
    reqUrl
  );
  return userInfo;
}

Future<Map<String,dynamic>> mentionedTimeline(
  String apiToken,
  String baseUrl,
  String apiBase,
  int noteCount,
  bool fromFollowing,
  String visibility
) async {
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['i'] = apiToken;
  payload['following'] = fromFollowing;
  payload['visibility'] = visibility;
  payload['limit'] = noteCount;
  String reqUrl = '$baseUrl$apiBase/notes/mentions';
  Map<String,dynamic> userInfo = await fetchJSON(
    'POST', 
    headers, 
    payload, 
    reqUrl
  );
  return userInfo;
}