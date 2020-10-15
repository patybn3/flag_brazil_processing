/* Assigment 5-8
Student ID: 00318934
Name: Patricia Antlitz
Professor Ethel Schuster
Introduction to Computer Science CIS-140
14 October 2020 

8. myflag: choose and draw a flag. This flag should be large and occupy 
most of the output window. See World Flag Database. Include a label with the 
name of the country and the size of the flag.

I have used other sources, as detailed in my submitted source file. 
List these sources:

https://processing.org/reference/beginShape_.html
https://forum.processing.org/two/discussion/27698/how-to-make-curved-line

*/

// Code starts here

int forestGreen = color(0, 121, 19);
int yellow = color(255, 226, 3);
int white = color(255);
int blue = color(0, 3, 163);
int black = color(0);
int orig = 0;

PShape shapes;

// this code will create a curved text that will be placed inside of the flag
String string = "ORDEM  E  PROGRESSO";
PFont font;

// radius of a circle
float raD = 130;


void setup(){
  size(800, 500);
  font = createFont("ArialNarrow-Bold", 12);
  textFont(font);
  textAlign(CENTER);
}

void draw(){
  background(white);
  
  creatingShapes(forestGreen, 40, 40, 750, 40, 750, 450, 40, 450);
  
  creatingShapes(yellow, 100, 250, 400, 70, 690, 250, 400, 430);
  
  circles(blue, 400, 250, 225, 225);
  
  curvature(white, 280, 260, 380, 210, 430, 210, 510, 290);
  
  flagText();

}

void flagText() {
  
  translate(385, 360);
  //noFill();
  ////noStroke();
  //ellipse(orig, orig, raD, raD);
  
  float archL = 270;
  
  for(int i = 0; i < string.length (); i++) {
    
    char currentLetter = string.charAt(i);
    
    float wide = textWidth(currentLetter);
    
    archL += wide*2;
    
    float divRad = PI + archL / raD/2;
    
    pushMatrix();
    
    translate(raD*cos(divRad), raD*sin(divRad));
    
    rotate(divRad + PI/2);
    
    fill(forestGreen);
    text(currentLetter, 0, 0);
    
    popMatrix();
    
    archL += wide;
  }
}


void creatingShapes(int c, float x, float y, float x1, float y1,
float x2, float y2, float x3, float y3){
  noStroke(); 
  fill(c);
  beginShape();
  vertex(x, y);
  vertex(x1, y1);
  vertex(x2, y2);
  vertex(x3, y3);
  endShape(CLOSE);
}

void circles(int c, float x, float y, float wide, float tall){
  noStroke(); 
  fill(c);
  ellipse(x, y, wide, tall);
}

void curvature(int c, float x, float y, float x1, float y1,
float x2, float y2, float x3, float y3) {
  stroke(c);
  strokeWeight(20);
  strokeCap(SQUARE);
  bezier(x, y, x1, y1, x2, y2, x3, y3);
}

// end.
