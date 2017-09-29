class Button {

  int x, y, w, h;
  int fillCol;
  String label;
  PVector position, velocity, acceleration;

  Button(String label, int xPos, int yPos, int width, int height) {
    this.label = label;
    position = new PVector(xPos, yPos);
    velocity = acceleration = new PVector(0, 0);
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

  void update() {
    //position = new PVector(random(width),random(height));

    velocity.add(acceleration);
    //velocity.limit(5);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    rectMode(CENTER);
    fill(fillCol);
    stroke(141);
    rect(position.x, position.y, w, h);
    fill(0);
    textSize(18);
    textAlign(CENTER, CENTER);
    text(label, position.x, position.y);
    if (mouseInRange()) {
      repulsed();
      update();
      checkEdges();
    }
  }

  boolean mouseOver() {
    if (mouseX > position.x-w/2 && mouseX < (position.x+w/2) && mouseY > position.y-h/2 && mouseY < (position.y+h/2)) {
      return true;
    }
    return false;
  }

  boolean mouseInRange() {
    if (dist(mouseX, mouseY, position.x, position.y) < 70) return true;
    else return false;
  }

  void checkEdges() {
    //Right Side
    if (position.x > width-w/2) position = new PVector(random(width), random(height));
    //Left Side
    if (position.x < w/2) position = new PVector(random(width), random(height));
    //Bottom
    if (position.y > height-h/2) position = new PVector(random(width), random(height));
    //Top
    if (position.y < h/2) position = new PVector(random(width), random(height));
  }

  //void checkEdges() {
  //  if (position.x > width-w/2) position.x = width-w/2;
  //  if (position.x < w/2) position.x = w/2;
  //  if (position.y > height-h/2) position.y = height-h/2;
  //  if (position.y < h/2) position.y = h/2;
  //}

  void repulsed() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector force = new PVector();
    force = force.sub(mouse, position);
    float d = force.mag();
    d = constrain(d, 1, 10);
    float grav = 1000;
    float strength = grav/(d*d);
    force.setMag(-strength);

    acceleration.add(force);
  }

  boolean isClicked() {
    if (mouseOver()) { 
      //println("true");
      return true;
    } else {      
      //println("false");
      return false;
    }
  }
}