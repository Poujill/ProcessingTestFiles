Timer time;
Paddle paddle;
Ball ball;
ArrayList<Brick> bricks;
int gameState = 0;
boolean start;

//Weights
float[] weight1 = {0.75, 0.15, 0.1};





void setup() {
  size(1000, 1000);
  start = false;
  paddle = new Paddle(100, 15);
  ball = new Ball(15);
  time = new Timer(5000);
  bricks = new ArrayList<Brick>();
  //noCursor();
  for (int i=0; i<10; i++) {
    bricks.add(new Brick());
  }
}

void draw() {
  switch (gameState) {
  case 0:
    gameStart();
    break;
  case 1:
    gameRun();
    break;
  case 2:
    gameEnd();
    break;
  }
}

void gameStart() {
  background(0);
}

void gameRun() {
  background(255);
  paddle.update();
  paddle.checkEdges();
  paddle.display();

  ball.update();
  ball.checkEdges();
  ball.display();

  for (int i=0; i<bricks.size(); i++) {
    Brick brick = bricks.get(i);
    if (ball.hitBrick(brick) && brick.cooldown.isFinished()) {
      
      
      ball.vel.y *= -1;
      if (brick.health > 0) {
        brick.health -= 1;
        brick.cooldown.reset();
      }
    } else if (brick.health <= 0) {
      bricks.remove(brick);
    }    
    brick.display();
  }
}


//if(time.isFinished()){
//  time.reset();
//  println("Timer has finished");
//  bricks.add(new Brick());
//} else {

//}

void gameEnd() {
  background(255, 0, 0);
}

void keyPressed() {
  if (!start && keyCode == 32)
    gameState ++;
  start = true;
}