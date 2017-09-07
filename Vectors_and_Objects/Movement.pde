class Movement {

  PVector position;
  PVector velocity;
  color fillCol = 0;

  Movement() {
    position = new PVector(random(width), random(height)); //Acutal position of the object.
    velocity = new PVector(random(-2, 2), random(-2, 2));  //The amount that the object will change in x or y.
  }

  void update() {
    position.add(velocity);
  }

  void display() {
    noStroke();
    strokeWeight(2);
    fill(fillCol);
    ellipse(position.x, position.y, 48, 48);
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } 
    else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } 
    else if (position.y < 0) {
      position.y = height;
    }
  }
  
  boolean contains(){
    float disX = position.x - mouseX;
    float disY = position.y - mouseY;
    if(sqrt(sq(disX) + sq(disY)) < 24 ) {
      return true;
    } else {
      return false;
    }
  }
  
  void changeCol(){
    fillCol = color(random(255),random(255),random(255));
  }
}