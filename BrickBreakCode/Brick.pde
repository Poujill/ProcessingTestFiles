class Brick{
  int r;
  PVector pos;
  Brick(){
    r = (int)random(20,80);
    pos = new PVector(random(50, width-50),random(50,height-200));
  }
  
  void display(){
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    stroke(0);
    strokeWeight(3);
    rectMode(CENTER);
    rect(0,0,r,r);
    popMatrix();
  }
}