import 'package:sharkey/sharkey.dart';

Future<void> main() async {
  Map<String,dynamic> userInfo = await getUserInfo(
    "angeldollface666",
    "blahaj.zone",
    "https://blahaj.zone",
    "/api"
  );

  Map<String,dynamic> usersFollowing = await getUserFollowing(
    "angeldollface666",
    "blahaj.zone",
    "https://blahaj.zone",
    "/api"
  );

  Map<String,dynamic> usersFollowers = await getUserFollowers(
    "angeldollface666",
    "blahaj.zone",
    "https://blahaj.zone",
    "/api"
  );
  print(usersFollowers);
}