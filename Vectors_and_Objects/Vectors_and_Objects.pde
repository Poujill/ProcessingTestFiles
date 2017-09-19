Movement[] objects = new Movement[1];
float average = 0;
float[] avgFrameRate = new float[0];

void setup() {
  size(640,360);
  for(int i = 0; i<objects.length; i++){
    objects[i] = new Movement();
  }
}

void draw() {
  background(255);
  for(int i = 0; i<objects.length; i++){
    objects[i].update();
    objects[i].checkEdges();
    objects[i].display();
  }
  avgFrameRate = append(avgFrameRate,frameRate);
  average += frameRate;
   //println(frameRate);
   //println("Objs Position: " + objects[0].position); 
}

void mousePressed(){
  for(int i = 0; i<objects.length; i++){
    objects[i].contains();
    if(objects[i].contains()){
      objects[i].changeCol();
      objects[i].update();
    }
  }
}

void keyPressed(){
  if(keyCode == 83){
    objects =(Movement[]) append(objects, new Movement());
  }
  if(keyCode == 37){
    if(objects.length>0){
      objects =(Movement[]) shorten(objects);    
    }  
  }
  
  if(keyCode == 38){
    for(int i = 0; i < objects.length; i++){
      println(objects[i].velocity + " " + objects[i].position);
    }
  }
  
  if(keyCode == 39){
    println(average/avgFrameRate.length);
  }
  //println(objects.length);
  
}
