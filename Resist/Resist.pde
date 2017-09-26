
Button button;

int clk;
float hr,vr;
void setup(){
  size(1000,1000);
  //fullScreen();
  smooth();
  
  button = new Button("Click Me", width/2, height/2, 100, 50); //<>//
  hr = button.w;
  vr = button.h;
}

void draw(){
  background(200);
   //<>//
  button.display();
  
  if(mouseY>button.y && mouseY <= button.y+100) button.y -= 5;
  if(mouseY<button.y && mouseY >= button.y-100) button.y += 5;
  
  if(mouseX>button.x && mouseX <= button.x+100) button.x -= 5;
  if(mouseX>button.x && mouseX <= button.x100) button.x -= 5;
  
  button.checkEdges();
}

void mousePressed(){
 if(button.mouseIsOver()){
   button.fill = 150;

   //clk++;
   //println(clk);
 } 
}

void mouseReleased(){
  if(button.mouseIsOver()){
    button.fill = 218;
    button.x = random(button.w, width-button.w);
    button.y = random(button.h, height-button.h);
  }
}

void keyPressed(){
  println(hr + " " + vr);
}