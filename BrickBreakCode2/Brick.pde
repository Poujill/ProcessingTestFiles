class Brick {

  int r;
  PVector pos;
  int health;
  Timer cooldown;

  Brick() {
    r = 40;
    pos = new PVector(random(50, width-50), random(50, height-200));
    health = calcHealth(weight1);
    cooldown = new Timer(500);
    
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    stroke(0);
    strokeWeight(3);
    rectMode(CENTER);
    rect(0, 0, r, r);
    text(health, 0,0);
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

//function weightedRand2(spec) {
//  var i, sum=0, r=Math.random();
//  for (i in spec) {
//    sum += spec[i];
//    if (r <= sum) return i;
//  }
//}
//weightedRand2({0:0.8, 1:0.1, 2:0.1});