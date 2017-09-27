PFont p;                   //Storage for current letters Font
String name = "Matt";      //String that you want to print to screen
String[] fontList;         //List of all the System Fonts
float m = 0;               //Storage for the first letters ascent to line up all other chars
void setup(){
  size(400,400);
  
  fontList = PFont.list();

}

void draw(){
  //background(200);
  
   //<>//
}

void mouseClicked(){
  background(200);
  drawText();
}

void drawText(){
  float sum = 0;
  for(int i = 0; i < name.length(); i++){
    p = createFont(fontList[(int)random(fontList.length)],72,true); 
    textFont(p);
    textSize(48);
    if(i==0) m = textAscent();
    fill(0);
    float ascent = textAscent();
    text(name.charAt(i),sum+140,ascent+(m-ascent)+165);
    noFill();
    rect(sum+140,ascent+(m-ascent)+165,textWidth(name.charAt(i)),-ascent+(m-ascent));
    sum += textWidth(name.charAt(i))+3;
    //line(sum,0,sum,height);
    //line(0,mouseY,width,mouseY);
    //line(width/2,0,width/2,height);
    //line(0,height/2,width,height/2);
  }
}