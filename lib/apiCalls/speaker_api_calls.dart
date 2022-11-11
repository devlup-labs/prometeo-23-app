List speakerInformation = [];


findSpeakerData(List givenList, String parameter){
  for(int i = 0; i < givenList.length; i++){
    if(givenList[i]['type'] == parameter){
      continue;
    }else{
      givenList.remove(i);
    }
  }

  return givenList;
}