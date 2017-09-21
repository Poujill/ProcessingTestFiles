//String[] dots = loadStrings("genres");

String[] genres;
String[] issues;
String output = "";
PFont f;

void setup(){
  size(500,500);
  genres = loadStrings("genres.txt");
  issues = loadStrings("currentIssues.txt");
  textAlign(CENTER,CENTER);
  f = createFont("Times New Roman",72,true);
  
}

void draw(){
  background(0); 
  textFont(f);
  textSize(48);
  text(output,0,0,width,height);
}

void mouseClicked(){
  output = (genres[(int)random(genres.length-1)]  + "\n" + issues[(int)random(issues.length-1)]);
}

//Stealth | Rise of the AI
//T.D. | Ocean Pollution
  //
//Sim | Net Neutrality