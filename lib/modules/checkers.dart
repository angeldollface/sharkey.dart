bool responseIsError(Map<String,dynamic> subject){
  bool result = false;
  if (subject.containsKey("error")){
    result = true;
  }
  else {}
  return result;
}

