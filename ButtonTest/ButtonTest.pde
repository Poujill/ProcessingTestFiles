Button on_button;  // the button
int clk = 1;       // number of times the button is clicked

void setup() {
  size (300, 150);
  smooth();
  
  // create the button object
  on_button = new Button("Click Me", width/2, height/2, 100, 50);
}

void draw() {
  background(200);
  // draw the button in the window
  on_button.Draw();
  text(frameRate,23,7);
}

void mousePressed()
{
  if (on_button.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("Clicked: ");
    on_button.fill = 150;
    println(clk++);
  }
}

void mouseReleased(){
  if (on_button.MouseIsOver()) {
    on_button.fill = 218;
  }
}