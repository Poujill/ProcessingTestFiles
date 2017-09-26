Button[] buttons;
float topSpeed = 5;
int clk;
void setup(){
  size(500,500);
  buttons = new Button[1];
  //fullScreen();
  for(int i = 0; i < buttons.length; i++){
    buttons[i] = new Button("Click Me",width/2,height/2,100,50);
  }
}

void draw(){
  background(255);
  for(int i = 0; i < buttons.length; i++){
    buttons[i].display();
  }
  fill(0);
  textSize(12);
  text(str(clk),5,5);
  textSize(48);
  if(clk<=10)  text("Click the button to continue.", width/2, height/4+100,width,height);
  if(clk>10 && clk <=20)  text("Come on you can do it.", width/2, height/4+100,width,height);
  if(clk>20 && clk <=30){ 
    text("Here I'll add a button for you.", width/2, height/4+100,width,height);
  }
}
  
void mousePressed(){
  //if(button.mouseOver()){
  //  clk++;
  //  button.fillCol = 150;
  //} else {
  //  button.fillCol = 218;
  //}
  clk++;
  println(clk);
  if(mouseButton == RIGHT) clk = 0;
}