class Ball {

  PVector pos, vel, dir;
  float topSpeed;
  int r;
  int speed;

  Ball() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(1, 1);
    dir = new PVector(1, 1).mult(8);
    topSpeed = 10;
    speed = 8;
    r = 24;
  }

  void update() {
    vel.y*= speed;
    vel.add(dir);
    vel.limit(topSpeed);
    pos.add(vel);
  }

  private void update(PVector update) {
    vel.add(update);
    vel.limit(topSpeed);
    pos.add(vel);
  }

  void display() {
    noStroke();
    fill(127);
    ellipse(pos.x, pos.y, 48, 48);
  }

  void checkEdges() {
    //Check left and right sides
    if (pos.x-r < 0 || pos.x+r > width) {
      vel.x *= -1;
    }
    //check top of screen
    if (pos.y-24<0) {
      vel.y *= -1;
    }
    
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

//    //This is for the paddle
//    if (this.pos.y+r > paddle.y && this.pos.y-r < paddle.y + paddle.h) {
//      //First Third
//      if (this.pos.x+r > paddle.x && this.pos.x-r < paddle.x + paddle.w/3) {
//        vel.x = -4;
//        vel.y *= -1;
//      }
//      //Middle Third
//      else if (this.pos.x+r > paddle.x- paddle.w/3 && this.pos.x-r < paddle.x + (2*paddle.w/3)) {
//        vel.x = .19;
//        vel.y *= -1;
//      }
//      //Last Third
//      else if (this.pos.x+r > paddle.x + (2*paddle.w/3) && this.pos.x-r < paddle.x+paddle.w) {
//        vel.x = 4;
//        vel.y *= -1;
//      }
//    }



    //THis is for the bottom of the screen
    //First Third
    //if ((pos.x-24 < 0 || pos.x +24 < 210) && pos.y+24 > height-10) {
    //  dir.x = -4;
    //  dir.y *= -1;
    //}
    ////Middle Third
    //else if ((pos.x - 24 >= 210 || pos.x+24 <= (420)) && pos.y+24 > height-10) {
    //  dir.x = .98;
    //  dir.y *= -1;
    //}
    ////Last Third
    //else if ((pos.x-24 > (420)) && pos.y+24 > height-10) {
    //  dir.x = 4;
    //  dir.y *= -1;
    //}
  }
}