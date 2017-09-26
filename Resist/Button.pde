class Button {
  String label; // button label
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button
  int fill;
  float radius;
  
  // constructor
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    fill = 218;
  }
  
  void display() { //<>// //<>//
    rectMode(CENTER);
    fill(fill);
    stroke(141);
    rect(x, y, w, h);
    textAlign(CENTER,CENTER);
    fill(0);
    text(label, x , y);
  }
  
  boolean mouseIsOver() {
    if (mouseX > x-w/2 && mouseX < (x + w/2) && mouseY > y-h/2 && mouseY < (y + h/2)) {
      return true;
    }
    return false;
  }
  
  void checkEdges(){
    if(y<0) y = height - h;
    if(y>height) y = 0 + h;
    if(x<0) x = width-w;
    if(x>width) x = w;  
  }
}