class Brick {

  int r;
  PVector pos;
  int health;
  Timer cooldown;

  Brick() {
    r = 40;
    pos = new PVector(random(50, width-50), random(50, height/2));
    health = calcHealth(weight1);
    cooldown = new Timer(500);
    
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
    stroke(150);
    strokeWeight(3);
    //rectMode(CENTER);
    rect(0, 0, r, r);
    text(health, 10,10);
    popMatrix();
  }

  int calcHealth(float[] weight) {
    float x = 0;
    int hp = 0;
    float y = random(1);
    for (int i=0; i<weight.length; i++) {
      x += weight[i];
      if (y <= x){
        hp = i+1;
        println(hp);
      }
    }
    return hp;
  }
}