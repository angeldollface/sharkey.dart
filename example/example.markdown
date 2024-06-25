# EXAMPLE FOR SHARKEY.DART

Here's the example's `pubspec.yaml`:

```YAML
name: test
description: A test app for Sharkey.dart!
version: 1.0.0
publish_to: none
homepage: https://github.com/angeldollface/sharkey.dart
environment:
  sdk: ^3.4.3
dependencies:
  sharkey:
    git: git://github.com/angeldollface/sharkey.dart.git
```

Here's the example itself:

```dart
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
```
