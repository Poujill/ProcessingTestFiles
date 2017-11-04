Timer time,movement;
Paddle paddle;
Ball ball;
ArrayList<Brick> bricks;
int gameState = 0;
boolean start;
int timeStart = 5000, movementStart =5000;
int timeCount = 0, moveCount = 0;

//Weights
float[] weight1 = {0.75, 0.15, 0.1};





void setup() {
  size(1000, 1000);
  start = false;
  paddle = new Paddle(100, 15);
  ball = new Ball(15);
  time = new Timer(timeStart);
  movement = new Timer(movementStart);
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
    if((ball.pos.y - ball.r) <= (brick.pos.y + brick.r) &&
       (ball.pos.y - ball.r) >= (brick.pos.y) &&
       ball.pos.x >= (brick.pos.x) &&
       ball.pos.x <= (brick.pos.x + brick.r) &&
       //ball.hitBrick(brick) &&
       brick.cooldown.isFinished())
       {
         ball.vel.y *= -1;
         bricks.remove(brick);
       }
       
     //Top of Brick
     if((ball.pos.y + ball.r) >= (brick.pos.y + brick.r) &&
       (ball.pos.y - ball.r) <= (brick.pos.y) &&
       ball.pos.x >= (brick.pos.x) &&
       ball.pos.x <= (brick.pos.x + brick.r) &&
       //ball.hitBrick(brick) &&
       brick.cooldown.isFinished())
       {
         bricks.remove(brick);
         ball.vel.y *= -1;
       }
       
     //Left side of Brick
     if((ball.pos.x + ball.r) >= (brick.pos.x) &&
        (ball.pos.x + ball.r) <= (brick.pos.x + brick.r) &&
        ball.pos.y >= (brick.pos.y) &&
        ball.pos.y <= (brick.pos.y + brick.r) &&
        //ball.hitBrick(brick) &&
        brick.cooldown.isFinished())
        {
          ball.vel.x *= -1;
          bricks.remove(brick);
        }
        
      //Right side of brick  
      if((ball.pos.x - ball.r) <= (brick.pos.x) &&
        (ball.pos.x + ball.r) >= (brick.pos.x + brick.r) &&
        ball.pos.y >= (brick.pos.y) &&
        ball.pos.y <= (brick.pos.y + brick.r) &&
        //ball.hitBrick(brick) &&
        brick.cooldown.isFinished())
        {
          ball.vel.x *= -1;
          bricks.remove(brick);
        } 
    ////Bottom of Brick
    //if((ball.pos.y - ball.r) <= (brick.pos.y + brick.r/2) &&
    //   (ball.pos.y - ball.r) >= (brick.pos.y - brick.r/2) &&
    //   ball.pos.x >= (brick.pos.x - brick.r/2) &&
    //   ball.pos.x <= (brick.pos.x + brick.r/2) &&
    //   ball.hitBrick(brick) &&
    //   brick.cooldown.isFinished())
    //   {
    //     ball.vel.y *= -1;
    //     bricks.remove(brick);
    //   }
       
    // //Top of Brick
    // if((ball.pos.y + ball.r) >= (brick.pos.y + brick.r/2) &&
    //   (ball.pos.y - ball.r) <= (brick.pos.y - brick.r/2) &&
    //   ball.pos.x >= (brick.pos.x - brick.r/2) &&
    //   ball.pos.x <= (brick.pos.x + brick.r/2) &&
    //   ball.hitBrick(brick) &&
    //   brick.cooldown.isFinished())
    //   {
    //     ball.vel.y *= -1;
    //     bricks.remove(brick);
    //   }
       
    // //Left side of Brick
    // if((ball.pos.x + ball.r) >= (brick.pos.x - brick.r/2) &&
    //    (ball.pos.x + ball.r) <= brick.pos.x &&
    //    ball.pos.y >= (brick.pos.y - brick.r/2) &&
    //    ball.pos.y <= (brick.pos.y + brick.r/2) &&
    //    ball.hitBrick(brick) &&
    //    brick.cooldown.isFinished())
    //    {
    //      ball.vel.x *= -1;
    //      bricks.remove(brick);
    //    }
        
    //  //Right side of brick  
    //  if((ball.pos.x - ball.r) <= (brick.pos.x - brick.r/2) &&
    //    (ball.pos.x + ball.r) >= brick.pos.x &&
    //    ball.pos.y >= (brick.pos.y - brick.r/2) &&
    //    ball.pos.y <= (brick.pos.y + brick.r/2) &&
    //    ball.hitBrick(brick) &&
    //    brick.cooldown.isFinished())
    //    {
    //      ball.vel.x *= -1;
    //      bricks.remove(brick);
    //    }   
    brick.display();
  }


  if(time.isFinished()){
    time.reset();
    //println("Timer has finished");
    bricks.add(new Brick());
    timeCount++;
    if(timeCount >= 5){
      timeCount = 0;
      timeStart -= 1000;
      time = new Timer(timeStart);
    }
  }
  
  if(movement.isFinished()){
    movement.reset();
    for(Brick brick: bricks){
      brick.pos.y += 20;
    }
    moveCount++;
    if(moveCount >= 10){
      moveCount = 0;
      movementStart -= 1000;
      movement = new Timer(movementStart);
    }
  }
  
  text(moveCount + " / " + movementStart + "\n" + timeCount + " / " + timeStart, 10, 10);
}


void gameEnd() {
  background(255, 0, 0);
}

void keyPressed() {
  if (!start && keyCode == 32)
    gameState ++;
  start = true;
}