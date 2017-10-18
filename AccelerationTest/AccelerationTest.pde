Ball ball;

void setup(){
  size(630,630);
  ball = new Ball();
}

void draw(){
  background(255);
  fill(255,0,0);
  rect(0,height-10,width/3,height);
  fill(0,255,0);
  rect(width/3,height-10,2*width/3,height);
  fill(0,0,255);
  rect(2*width/3,height-10,width,height);
  
  ball.update();
  ball.checkEdges();
  ball.display();
  println(ball.acc.x + " / " + ball.acc.y);
  
}