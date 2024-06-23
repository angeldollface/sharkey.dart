import 'dart:io';
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