/*
SHARKEY.DART by Alexander Abraham, 
a.k.a. "Angel Dollface".
Licensed under the DSL v1.
*/

import 'dart:io';

/// Attempts to retrieve the value stored
/// in the supplied "envVar" name. If this
/// fails, an empty string is returned.
String getApiTokenFromEnv(String envVar){
  String result = '';
  Map<String,String> envVars= Platform.environment;
  if (envVars.containsKey(envVar)){
    result = envVars[envVar]!;
  }
  else {
    // Do nothing.
  }
  return result;
}