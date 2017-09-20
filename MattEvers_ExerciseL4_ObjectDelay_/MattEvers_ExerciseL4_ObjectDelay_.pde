/*
 *author Matthew Evers
 *
 */

boolean flag = false;
boolean mouse = false;
PVector initVelocity;
Movement ball;

void setup(){
  size(500,500,P2D);  
  ball = new Movement();
  ball.init();
  initVelocity = ball.velocity;
  noStroke();
}

void draw(){
  background(200);
  if(mouse){
    ball.update(mouseX,mouseY);
  }else{
    ball.update();
  }
  
  ball.checkEdges();
  if(flag){
    ball.displayTri();
  } else {
    ball.display();
  }
  fill(100);
  String s = "Left-Click -- Toggle follow mouse \nRight-Click -- Toggle Trail/Delay";
  text(s,10,height-40,width,height);
}

void mouseClicked(){
  if(mouseButton == LEFT){
    mouse = !mouse;
    if(mouse){
      ball = new Movement(mouseX,mouseY);
      ball.init();
    }else{
      ball = new Movement(mouseX,mouseY,initVelocity);
      ball.init();
    }
    
  }else{
    flag = !flag;
  }
}