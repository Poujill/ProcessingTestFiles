import processing.video.*;

Capture cam;
int[][] colsRows;
color c;
void setup() {
  size(640, 480);
  colsRows = new int[width][height];
  cam = new Capture(this);
  cam.start();          
}

void draw() {
  background(200);
  if (cam.available() == true) {
    cam.read();
  }
  set(0,0, cam);
  colorArray();
  c = colsRows[mouseX][mouseY];
  fill(c);
  rect(mouseX,mouseY,15,15);
  println(frameRate);
}

void colorArray(){
  color s;
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      s = get(x,y);
      if(red(s) > 110 && red(s) < 150){
        if(green(s) > 110 && green(s) <150){
          if(blue(s)>100 && blue(s)< 150){
            colsRows[x][y] = color(0,255,0);
            fill(colsRows[x][y]);
            point(x,y);
          }
        }
      } else {
        colsRows[x][y] = s;
      }
    }
  }
}

void changeColor(){
  color s;
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      s = colsRows[x][y];
      if(red(s) == 226){
        colsRows[x][y] = color(0,green(s),blue(s));
      }
    }
  }
}

void mousePressed(){
  println(red(c)+"/"+green(c)+"/"+blue(c));
}