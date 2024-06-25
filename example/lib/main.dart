/*
SHARKEY.DART by Alexander Abraham, 
a.k.a. "Angel Dollface".
Licensed under the DSL v1.
*/

import 'package:sharkey/sharkey.dart';

Future<void> main() async {

  // Gets profile information
  // for the profile "angeldollface666"
  // on the Sharkey instance "blahaj.zone".
  Map<String,dynamic> userInfo = await getUserInfo(
    "angeldollface666", 
    "blahaj.zone", 
    "https://blahaj.zone", 
    "/api"
  );

  // Prints out this
  // information.
  print(userInfo);
  
}