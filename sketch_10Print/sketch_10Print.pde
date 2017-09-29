int x = 0;
int y = 0;

int spacing = 20;

void setup() {
  //size(400, 400);
  fullScreen();
  
  background(#000000);
}

void draw() {
  stroke(#404040);
  strokeWeight(4);

  if (random(1)<0.5) {
    //line(x, y+spacing/2, x+spacing, y+spacing/2);
    line(x, y, x+spacing, y+spacing);
  } else {
    //line(x+spacing/2, y, x+spacing/2, y+spacing);
    line(x, y+spacing, x+spacing, y);
  }
  
  x += spacing;
  if (x>width) {
    x = 0;
    y+=spacing;
  }
  if(y>height) noLoop();
  
}