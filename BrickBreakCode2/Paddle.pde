public class Paddle {
  int x, y;
  int w, h;

  Paddle(int w, int h) {
    x = width/2;
    y = height-(2*h);
    this.w = w;
    this.h = h;
  }

  void display() {
    rectMode(CORNER);
    fill(0);
    noStroke();
    //rect(x,y,w,h);
    fill(255, 0, 0);
    rect(x, y, w/3, h);
    fill(0, 255, 0);
    rect(x+w/3, y, w/3, h);
    fill(0, 0, 255);
    rect(x+2*w/3, y, w/3, h);
  }

  void update() {
    x = mouseX-w/2;
  }

  void checkEdges() {
    if (x+w/2< 0) x=w/2;
    if (x+w/2 > width)  x = width-w/2;
  }
}