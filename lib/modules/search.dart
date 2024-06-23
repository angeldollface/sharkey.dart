import 'network.dart';

Future<Map<String,dynamic>> searchForUser(
  String userName,
  String server,
  String baseUrl,
  String apiBase,
  int resultCount,
) async {
  Map<String,dynamic> headers = new Map();
  headers['Content-Type'] = 'application/json';
  Map<String,dynamic> payload = new Map();
  payload['limit'] = resultCount;
  payload['detail'] = false;
  payload['username'] = userName;
  payload['host'] = server;
  String reqUrl = '$baseUrl$apiBase/users/search-by-username-and-host';
  Map<String,dynamic> userInfo = await fetchJSON(
    'POST', 
    headers, 
    payload, 
    reqUrl
  );
  return userInfo;
}