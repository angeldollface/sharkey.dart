/*
SHARKEY.DART by Alexander Abraham, 
a.k.a. "Angel Dollface".
Licensed under the DSL v1.
*/

import 'users.dart';

/// Checks whether the supplied response map
/// has an "error" key. If it does, "true" is
/// returned. If it does not, "false" is returned.
bool responseIsError(Map<String,dynamic> subject){
  bool result = false;
  if (subject.containsKey("error")){
    result = true;
  }
  else {}
  return result;
}

/// Checks whether the supplied user
/// exists on the given instance. If they do exist,
/// "true" is returned. If they don't exist, "false"
/// is returned.
Future<bool> userExists(
	String userName,
  String server,
  String baseUrl,
  String apiBase,
) async {
	Map<String,dynamic> userInfo = await getUserInfo(
		userName,
		server,
		baseUrl,
		apiBase
	);
	bool result = false;
	if (responseIsError(userInfo) == false){
		result = true;
	}
	else {
		// Do nothing.
	}
	return result;
}
