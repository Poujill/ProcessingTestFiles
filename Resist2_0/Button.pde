class Button{
  
  int x,y,w,h;
  int fillCol;
  String label;
  PVector position, velocity, acceleration;

  Button(String label, int xPos, int yPos, int width, int height){
    this.label = label;
    position = new PVector(xPos,yPos);
    velocity = new PVector(0,0);
    w = width;
    h = height;
    fillCol = 218;
  }
  
  //void update(){
  //  PVector mouse = new PVector(mouseX, mouseY);
  //  PVector acceleration = PVector.sub(mouse,position);
  //  acceleration.setMag(-2);
    
  //  velocity.add(acceleration);
  //  velocity.limit(topSpeed);
  //  position.add(velocity);
  //  acceleration = new PVector();
  //}
  
  void update(){
    position = new PVector(random(width),random(height));
  }
  
  void display(){
    rectMode(CENTER);
    fill(fillCol);
    stroke(141);
    rect(position.x,position.y,w,h);
    fill(0);
    textSize(18);
    textAlign(CENTER,CENTER);
    text(label,position.x,position.y);
    if(mouseInRange()){
      update();
      checkEdges();
    }
  }
  
  boolean mouseOver(){
    if(mouseX > position.x-w/2 && mouseX < (position.x+w/2) && mouseY > position.y-h/2 && mouseY < (position.y+h/2)){
      return true;
    }
    return false;
  }
  
  boolean mouseInRange() {
    if (dist(mouseX, mouseY, position.x, position.y) < 58) return true;
    else return false;
  }
  
  void checkEdges() {
    if (position.x > width-w/2) position.x = w/2;
    if (position.x < w/2) position.x = width - w/2;
    if (position.y > height-h/2) position.y = h/2;
    if (position.y < h/2) position.y = height - h/2;
  }
  
  //void checkEdges() {
  //  if (position.x > width-w/2) position.x = width-w/2;
  //  if (position.x < w/2) position.x = w/2;
  //  if (position.y > height-h/2) position.y = height-h/2;
  //  if (position.y < h/2) position.y = h/2;
  //}
}