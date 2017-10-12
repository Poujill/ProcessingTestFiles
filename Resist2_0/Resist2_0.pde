Button[] buttons;
Timer resetTimer;
float topSpeed = 5;
int clk;
int text;
String[] textList;
boolean moving;
boolean addButton = true;
boolean sw1, sw2;

void setup() {
  //size(800, 800);
  fullScreen();
  smooth();
  textList = loadStrings("computerText.txt");
  buttons = new Button[1];
  resetTimer = new Timer(120*1000);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button("Click Me", width/2, height/2, 100, 50);
  }
  moving = false;
  text = 0;
  sw1 = false;
  sw2 = true;
}

void draw() {
  background(255);

  if (resetTimer.isFinished()) {
    reset();
  } else {
  }

  moving = mouseMovementCheck();
  fill(0);

  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
  }
  

  //This is debug code( shows number of clicks / number of buttons on screen / current time|start time of timer| amount of time between current time and start that has to pass to reset sketch.
      //textSize(12);
      //text((clk + "\n" + buttons.length), 10, 20);
      //text(resetTimer.cTime/1000 + " / " + resetTimer.sTime/1000 + " / " + resetTimer.dTime/1000, width-50, 15);

  textSize(24);
  switch (clk) {
  case 10:
    sw1 = true;
    if (sw2) text ++;
    sw2 = false;
    break;
  case 20:
    if (!sw2) {
      text++;
      buttons = (Button[]) append(buttons, new Button("Click Me", width/2, height/2, 100, 50));
    }
    sw2 = true;
    break;
  case 30:
    sw1 = true;
    if (sw2) text ++;
    sw2 = false;
    break;
  case 40:
    if (!sw2) {
      text++;
    }
    sw2 = true;
    break;
  case 41:
    sw1 = true;
    if (sw2) text ++;
    sw2 = false;
    break;
  case 42:
    if (!sw2) {
      text++;
    }
    sw2 = true;
    break;
  case 43:
    sw1 = true;
    if (sw2) text ++;
    sw2 = false;
    break;
  case 44:
    if (!sw2) {
      text++;
    }
    sw2 = true;
    break;
  case 45:
    sw1 = true;
    if (sw2) text ++;
    sw2 = false;
    break;
  case 46:
    if (!sw2) {
      text++;
    }
    sw2 = true;
    break;
  case 47:
    sw1 = true;
    if (sw2) text ++;
    sw2 = false;
    break;
  case 48:
    if (!sw2) {
      text++;
      for (int i = 0; i < 100; i++) {
        buttons = (Button[]) append(buttons, new Button("Click Me", (int)random(width), (int)random(height), 100, 50));
      }
    }    
    sw2 = true;
    break;
  case 60:
    sw1 = false;
    sw2 = true;
    break;
  case 200:
    if (sw2) {
      int temp = buttons.length;
      for (int i = 0; i < temp; i++) {
        buttons = (Button[]) append(buttons, new Button("Click Me", (int)random(width), (int)random(height), 100, 50));
      }
    }
    sw2 = false;
    break;
  case 300:
    if (!sw2) {
      int temp = buttons.length;
      for (int i = 0; i < temp; i++) {
        buttons = (Button[]) append(buttons, new Button("Click Me", (int)random(width), (int)random(height), 100, 50));
      }
    }    
    sw2 = true;
    break;
  }


  if (sw1) {
    text(textList[text], width/2, height/4+150, width, height);
  }
}

void mousePressed() {
  clk++;
  resetTimer.reset();
  //println(clk);
  //if (mouseButton == RIGHT) clk += 10;
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].isClicked();
  }
}

//Checks to see if the mouse is moving and adjust the starts the reset time if the mouse stops moving.
boolean mouseMovementCheck() {
  if (abs(pmouseX - mouseX) > 0 || abs(pmouseY - mouseY) > 0) {
    resetTimer.reset();
    return true;
  } else {
    return false;
  }
}

void reset() {
  clk = 0;
  buttons = new Button[1];
  resetTimer = new Timer(10000);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button("Click Me", width/2, height/2, 100, 50);
  }
  moving = false;
  addButton = true;
  text = 0;
  sw1 = false;
  sw2 = true;
}