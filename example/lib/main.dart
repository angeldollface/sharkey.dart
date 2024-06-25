/*
SHARKEY.DART by Alexander Abraham, 
a.k.a. "Angel Dollface".
Licensed under the DSL v1.
*/

import 'package:sharkey/sharkey.dart';

Future<void> main() async {
  Map<String,dynamic> userInfo = await getUserInfo(
    "angeldollface666", 
    "blahaj.zone", 
    "https://blahaj.zone", 
    "/api"
  );
  print(userInfo);
}