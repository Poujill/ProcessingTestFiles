class Ball{
  PVector pos,vel;
  int r;
  Ball(int radius){
    pos = new PVector(width/2, height/2);
    vel = new PVector(3,3);
    r = radius;
  }
  
  void display(){
    fill(50);
    noStroke();
    ellipse(pos.x, pos.y,r*2,r*2);
  }
  
  void update(){
    pos.add(vel);
  }
  
  void checkEdges(){
    if(pos.x-r < 0 || pos.x+r > width) vel.x *= -1;
    if(pos.y-r < 0) vel.y *= -1;
    if(pos.y+r > height) gameState ++;
  }
  boolean hitPaddle(Paddle paddle){
    if(pos.y+r > paddle.y && 
       pos.y-r < paddle.y + paddle.h && 
       pos.x+r > paddle.x  && 
       pos.x-r < paddle.x +paddle.w){ 
       hitPaddleSegment(paddle);
       return true;
       }
       else return false;
  }
  
  void hitPaddleSegment(Paddle paddle){
    if(pos.y+r > paddle.y && pos.y-r < paddle.y + paddle.h){
      if(pos.x+r > paddle.x && pos.x-r < paddle.x + paddle.w/3){
        vel.x *= -0.196;
        vel.y *= -0.981;
      }
      else if(pos.x+r > paddle.x- paddle.w/3 && pos.x-r < paddle.x + (2*paddle.w/3)){
        vel.x *= 0.1;
        vel.y *= -1;
      }
      else if(pos.x+r > paddle.x + (2*paddle.w/3) && pos.x-r < paddle.x+paddle.w){
        vel.x *= 2;
        vel.y *= -0.981;
      }
    }
  }
  
  boolean hitBrick(Brick brick){
    float distance = dist(pos.x, pos.y,brick.pos.x, brick.pos.y);
    if(distance < brick.r + this.r ) return true;
    else return false;
  }
}