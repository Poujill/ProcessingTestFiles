Timer time;
Paddle paddle;
Ball ball;
ArrayList<Brick> bricks;
int gameState = 0;
boolean start;

void setup() {
  size(500, 500,P2D);
  start = false;
  paddle = new Paddle(100, 15);
  ball = new Ball(15);
  bricks = new ArrayList<Brick>();
  noCursor();
  for (int i=0; i<10; i++) {
    bricks.add(new Brick());
  }
}

void draw() {
  switch (gameState){
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
  //if (ball.hitPaddle(paddle)) ball.hitPaddleSegment(paddle);
  ball.hitPaddleSegment(paddle);
  ball.checkEdges();
  ball.display();
  
  println(ball.vel.x + " / " + ball.vel.y);

  for (int i=0; i<bricks.size(); i++) {
    Brick brick = bricks.get(i);
    if (ball.hitBrick(brick)) {
      if (brick.r > 40) {
        brick.r /= 2;
      } else {
        bricks.remove(brick);
      }
      ball.vel.y *= -1;
    }
    brick.display();
  }
}

void gameEnd() {
  background(255,0,0);
}

void keyPressed(){
  if(!start && keyCode == 32)
    gameState ++;
    start = true;
}