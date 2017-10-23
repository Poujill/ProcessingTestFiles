class Ball {
  PVector pos, vel;
  int r;
  float topSpeed;
  
  Ball(int radius) {
    pos = new PVector(width/2, height/2);
    vel = new PVector(3, 3);
    r = radius;
    topSpeed = 8;
  }

  void display() {
    fill(50);
    noStroke();
    ellipse(pos.x, pos.y, r*2, r*2);
  }

  void update() {
    pos.add(vel);
  }

  void checkEdges() {
    if (pos.x-r < 0 || pos.x+r > width) vel.x *= -1;
    if (pos.y-r < 0) vel.y *= -1;
    //if (pos.y+r > height) gameState ++;
    
    if (pos.y+r > paddle.y && pos.y-r < paddle.y + paddle.h) {
      //Divided in two =============================================================================
      if (pos.x+r >= paddle.x && pos.x-r < paddle.x+paddle.w/2) {
        float distance = abs((paddle.x+paddle.w/2) - pos.x);
        distance = map(distance,0,60,1,10);
        vel.x = -distance;
        vel.y*= -1;
        vel.setMag(topSpeed);
      }
      else if (pos.x+r >= paddle.x+paddle.w/2 && pos.x-r < paddle.x +paddle.w) {
         float distance = abs((paddle.x+paddle.w/2) - pos.x);
        distance = map(distance,0,60,0,10);
        vel.x = distance;
        vel.y*= -1;
        vel.setMag(topSpeed);
      }
    }
  }

  boolean hitBrick(Brick brick) {
    float distance = dist(pos.x, pos.y, brick.pos.x, brick.pos.y);
    if (distance <= brick.r) return true;
    else return false;
  }
}