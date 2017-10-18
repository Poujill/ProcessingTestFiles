class Ball{
  
  PVector pos, vel, acc;
  float topSpeed;

  Ball(){
    pos = new PVector(width/2,height/2);
    vel = new PVector(0,0);
    acc = new PVector(-2,5);
    topSpeed = 10;
  }
  
  void update(){
    vel.add(acc);
    vel.limit(topSpeed);
    pos.add(vel);
  }
  
  void display(){
    noStroke();
    fill(127);
    ellipse(pos.x,pos.y,48,48);
  }
  
  void checkEdges(){
    if(pos.x-24 < 0 || pos.x+24 > width){
      acc.x *= -1;
      vel.x *= -1;
    }
    if(pos.y-24<0){
      acc.y *= -1;
      vel.y *= -1;
    }
    
    //First Third
    if((pos.x-24 < 0 || pos.x +24 < 210) && pos.y+24 > height-10) {
      acc.x *= 5;
      acc.y *= -.961;
      vel.x *= 5;
      vel.y *= -.961;      
    }
    //Middle Third
    else if((pos.x - 24 >= 210 || pos.x+24 <= (420)) && pos.y+24 > height-10) {
      acc.x *= 2;
      acc.y *= -2;
      vel.x *= 2;
      vel.y *= -2;
    }
    //Last Third
    else if((pos.x-24 > (420)) && pos.y+24 > height-10) {
      acc.x *= 5;
      acc.y *= -.5;
      vel.x *= 5;
      vel.y *= -.5;
    } 
  }
  
  
}