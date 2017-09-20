class Movement{
  static final int NUMBER = 90;
  PVector position;
  PVector velocity;
  float[] xpos;
  float[] ypos;
  boolean counterFlag;

  //Randomly creates the location and velocity of the object
  public Movement(){
    position = new PVector(random(width),random(height));
    velocity = new PVector(random(1,5),random(1,5));
    xpos = new float[NUMBER];
    ypos = new float[NUMBER];
    counterFlag = false;
  }
  
  // Used when importing mouse coords
  public Movement(int xx, int yy){
    position = new PVector(xx,yy);
    xpos = new float[NUMBER];
    ypos = new float[NUMBER];
    counterFlag = false;
  }
  
  // Used to switch back to the original velocity from the mouse Coors and continue moving on its own
  public Movement(int xx, int yy,PVector velocity){
    position = new PVector(xx,yy);
    this.velocity = velocity;
    xpos = new float[NUMBER];
    ypos = new float[NUMBER];
    counterFlag = false;
  }
  
  //Updates array of past positions and adds new position to last index of the array
  void update(){
    position = position.add(velocity); //Adjusts position of object
    xpos[NUMBER-1] = position.x;       //last index = current position
    ypos[NUMBER-1] = position.y;
    for(int i=0; i<NUMBER-1;i++){      //Shift array down
        xpos[i] = xpos[i+1];
        ypos[i] = ypos[i+1];
      }
  }
  
  //Update ball based on mouse coords and store past positions in array
  void update(float xx, float yy){
    xpos[NUMBER-1] = xx;
    ypos[NUMBER-1] = yy;
    for(int i=0; i<NUMBER-1;i++){  
        xpos[i] = xpos[i+1];
        ypos[i] = ypos[i+1];
      }
  }
  
  //Shows fill trail divided into thirds by color
  void display(){
    int skip = 1;
      for(int i=0; i<NUMBER-1;i+=skip){
        int c = Math.max(255-i,0);
        c = abs(c-255);
        if(i>2*NUMBER/3){
          fill(255,0,0,c);
          ellipse(xpos[i],ypos[i],32,32);
        } else if (i>NUMBER/3){
          fill(0,255,0,c);
          ellipse(xpos[i],ypos[i],32,32);
        }else{
          fill(0,0,255,c);
          ellipse(xpos[i],ypos[i],32,32);
        }
      }
  }
  
  //Shows the delayed balls 1/3 of the way through the array list
  void displayTri(){
    
    fill(0,0,255);
    ellipse(this.xpos[NUMBER/3],this.ypos[NUMBER/3],32,32);
    fill(0,255,0);
    ellipse(xpos[2*NUMBER/3],ypos[2*NUMBER/3],32,32);
    fill(255,0,0);
    ellipse(xpos[NUMBER-1],ypos[NUMBER-1],32,32);
  }
  
  //Check for edges of screen and bounce off
  void checkEdges() {

    if (position.x > width || position.x < 0) {
      velocity.x *= -1;
    } 
    if (position.y > height|| position.y < 0) {
      velocity.y *= -1;
    } 
  }
  
  //initialize objects array lists so that past ellipses appear off screen
  void init(){
    for(int i=0; i<NUMBER-1;i++){  
        xpos[i] = -15;
        ypos[i] = -15;
      }
  }
  
  
}