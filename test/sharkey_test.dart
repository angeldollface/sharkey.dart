import 'package:test/test.dart';
import 'package:sharkey/sharkey.dart';

int noteCount = 50;
String apiBase = "/api";
String reaction = "like";
int searchResultCount = 5;
String server = "blahaj.zone";
String userToFollow = "frisaf";
String stdVisibility = "public";
String userName = "angeldollface666";
String reactionAccepted = "likeOnly";
String baseUrl = "https://blahaj.zone";
String noteIdToBeLiked = "9utzyrsmyoof00hr";
String apiToken = getApiTokenFromEnv("BLAHAJ_API_TOKEN");
String noteToBeDeletedText = "This note was posted from the \"Sharkey.dart\" test runner. It only exists to be deleted.";
String testRunnerNote = "This note was posted from the \"Sharkey.dart\" test runner.";

Future<void> main() async {

  test(
    "Testing the \"getUserInfo\" function.", 
    () async {
      Map<String,dynamic> userInfo = await getUserInfo(
        userName,
        server,
        baseUrl,
        apiBase
      );
      expect(false, equals(responseIsError(userInfo)));
    }
  );

  test(
    "Testing the \"getUserFollowing\" function.",
    () async {
      Map<String,dynamic> usersFollowing = await getUserFollowing(
        userName,
        server,
        baseUrl,
        apiBase
      );
      expect(false, equals(responseIsError(usersFollowing)));
    }
  );

  test(
    "Testing the \"getUserFollowing\" function.",
    () async {
      Map<String,dynamic> usersFollowers = await getUserFollowers(
        userName,
        server,
        baseUrl,
        apiBase
      );
      expect(false, equals(responseIsError(usersFollowers)));
    }
  );

  test(
    "Testing the \"followUser\" function.",
    () async {
      Map<String,dynamic> followUserResp = await followUser(
        userToFollow,
        server,
        apiToken,
        baseUrl,
        apiBase,
        false
      );
      expect(false, equals(responseIsError(followUserResp)));
    }
  );

  test(
    "Testing the \"unfollowUser\" function.",
    () async {
      Map<String,dynamic> unfollowUserResp = await unfollowUser(
        userToFollow,
        server,
        apiToken,
        baseUrl,
        apiBase,
        false
      );
      expect(false, equals(responseIsError(unfollowUserResp)));
    }
  );

  test(
    "Testing the \"searchForUser\" function.",
    () async {
      Map<String,dynamic> searchResults = await searchForUser(
        userToFollow,
        server,
        baseUrl,
        apiBase,
        searchResultCount,
      );
      expect(false, equals(responseIsError(searchResults)));
    }
  );

  test(
    "Testing the \"instanceTimeline\" function.",
    () async {
      Map<String,dynamic> localTimeline = await instanceTimeline(
        baseUrl, 
        apiBase, 
        false, 
        false, 
        false, 
        noteCount
      );
      expect(false, equals(responseIsError(localTimeline)));
    }
  );

  test(
    "Testing the \"globalTimeline\" function.",
    () async {
      Map<String,dynamic> globTimeline = await globalTimeline(
        baseUrl, 
        apiBase, 
        false, 
        false, 
        false, 
        noteCount
      );
      expect(false, equals(responseIsError(globTimeline)));
    }
  );

  test(
    "Testing the \"mentionedTimline\" function.",
    () async {
      Map<String,dynamic> mentioned = await mentionedTimeline(
        apiToken, 
        baseUrl, 
        apiBase, 
        noteCount, 
        false, 
        stdVisibility
      );
      expect(false, equals(responseIsError(mentioned)));
    }
  );

  test(
    "Testing the \"getUserNotes\" function.",
    () async {
      Map<String,dynamic> userNotes = await getUserNotes(
        userName, 
        server, 
        apiBase, 
        baseUrl
      );
      expect(false, equals(responseIsError(userNotes)));
    }
  );

  test(
    "Testing the \"createTextNoteForUser\" function.",
    () async {
      Map<String,dynamic> newNote = await createTextNoteForUser(
        apiBase,
		    baseUrl,
		    apiToken,
		    stdVisibility,
		    false,
		    reactionAccepted,
		    true,
		    true,
		    true,
		    testRunnerNote
      );
      expect(false, equals(responseIsError(newNote)));
    }
  );

  test(
    "Testing the \"deleteNoteForUser\" function.",
    () async {
      Map<String,dynamic> newNoteToBeDeleted = await createTextNoteForUser(
        apiBase,
		    server,
		    apiToken,
		    stdVisibility,
		    false,
		    reactionAccepted,
		    true,
		    true,
		    true,
		    noteToBeDeletedText
      );
      String id = newNoteToBeDeleted['result']['createdNote']['id'];
      Map<String,dynamic> deleted = await deleteNoteForUser(
        apiBase, 
        server,
        apiToken,
        id
      );
      expect(false, equals(responseIsError(deleted)));
    }
  );

  test(
    "Testing the \"likeNoteForUser\" function.",
    () async {
      Map<String,dynamic> likedNote = await likeNoteForUser(
        apiBase,
        baseUrl,
        apiToken,
        noteIdToBeLiked,
        reaction
      );
      print(likedNote);
      expect(false, equals(responseIsError(likedNote)));
    }
  );

  test(
    "testing the \"unlikeNoteForUser\" function.",
    () async {
      Map<String,dynamic> unlikedNote = await unlikeNoteForUser(
        apiBase,
        baseUrl,
        apiToken,
        noteIdToBeLiked,
        reaction
      );
      expect(false, equals(responseIsError(unlikedNote)));
    }
  );

  
}