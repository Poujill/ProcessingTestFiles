Ball ball;
Paddle paddle;
void setup(){
  size(630,630);
  ball = new Ball();
  paddle = new Paddle(100,10);
  
}

void draw(){
  background(255);
  fill(255,0,0);
  rect(0,height-10,width/3,height);
  fill(0,255,0);
  rect(width/3,height-10,2*width/3,height);
  fill(0,0,255);
  rect(2*width/3,height-10,width,height);
  
  paddle.update();
  paddle.checkEdges();
  paddle.display();
  
  
  ball.update();
  ball.checkEdges();
  ball.display();
  println(ball.vel.x + " / " + ball.vel.y);
  
}