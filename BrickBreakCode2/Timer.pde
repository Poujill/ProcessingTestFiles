class Timer{ 
  int cTime;  //current time
  int sTime;  //start time
  int dTime;  //delay time
  
  Timer(int _d){ //constructor _d is delay
   dTime = _d;
   cTime = millis(); //set cTime to current time
   sTime = cTime; //set start time to Ctime.
    
  }
  
  void reset(){ //reset timer by setting sTime to cTime
    sTime = cTime;
  }
  
  //If timer is currently counting down returns true
  boolean isTriggered(){
    cTime = millis(); //keep cTime current
  
    if(cTime - sTime < dTime){ 
     return true;
    }else{
      return false;
    }
  }
  //If timer has passed delay time returns true
  boolean isFinished(){
    cTime = millis();
    if(cTime - sTime > dTime){
     return true;
    }else{
      return false;
    }
  }
}