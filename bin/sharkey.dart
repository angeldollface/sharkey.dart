import 'package:sharkey/modules/timeline.dart';
import 'package:sharkey/sharkey.dart';

Future<void> main() async {
  String apiToken = getApiTokenFromEnv("BLAHAJ_API_TOKEN");
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

  Map<String,dynamic> followUserResp = await followUser(
    "frisaf",
    "blahaj.zone",
    apiToken,
    "https://blahaj.zone",
    "/api",
    false
  );
  Map<String,dynamic> unfollowUserResp = await unfollowUser(
    "frisaf",
    "blahaj.zone",
    apiToken,
    "https://blahaj.zone",
    "/api",
    false
  );

  Map<String,dynamic> searchResults = await searchForUser(
    "frisaf",
    "blahaj.zone",
    "https://blahaj.zone",
    "/api",
    5,
  );

  Map<String,dynamic> localTimeline = await instanceTimeline(
    "https://blahaj.zone", 
    "/api", 
    false, 
    false, 
    false, 
    50
  );
  Map<String,dynamic> globTimeline = await globalTimeline(
    "https://blahaj.zone", 
    "/api", 
    false, 
    false, 
    false, 
    50
  );
  Map<String,dynamic> mentioned = await mentionedTimeline(
    apiToken, 
    "https://blahaj.zone", 
    "/api", 
    50, 
    false, 
    "public"
  );
  print(mentioned);
}