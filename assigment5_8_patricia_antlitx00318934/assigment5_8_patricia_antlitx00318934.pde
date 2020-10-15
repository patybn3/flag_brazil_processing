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
// this is the message that will be shown
String string = "ORDEM  E  PROGRESSO";

// variable of type font named font with no value
PFont font;

// radius of a circle
float raD = 3*width/2;


void setup(){
  // set up the screen size to 800px wide and 500px tall
  size(800, 500);
  /* call variable font and give it a value of function createFont, call the
  font name and size */
  font = createFont("ArialNarrow-Bold", height/35);
  // add the font to the text
  textFont(font);
  // align the text on the center
  textAlign(CENTER);
}

void draw(){
  // and a background color of white to the screen
  background(white);
  
  int tall = height;
  int wide = width;
  int tallH = tall/2;
  int wideH = wide/2;
  int tall16 = tall/16;
  int wide16 = wide/16;
  
  
/* call function creatingShapes which allows to create any type of pointy
  shape. We are making a rectangle first. We we call the color forestGreen,
  followed by x = 40 and y 40 for the first points. x= 750, y=40 for the 
  second point, x=750, y=450 for the third point and x=40, y=450 for the
  last point */
  creatingShapes(forestGreen, wide16, tall16, wide16*15, tall16, wide16*15,
  tall16*15, wide16, tall16*15);
   /* call function creatingShapes which allows to create any type of pointy
  shape. We are making a diamond shape. We we call the color yellow,
  followed by x = 100 and y 250 for the first points. x= 400, y=70 for the 
  second point, x=690, y=250 for the third point and x=400, y=430 for the
  last point */
  creatingShapes(yellow, wide/8, tallH, wideH, tall/7, wide16*14, tallH,
  wideH, tall16*14);
  
  /* function circles creates circles used on the screen. This circle
  call the color blue and is placed in the middle of the screen with size
  225 by 225 */
  circles(blue, wideH, tallH, 2*wideH/3, tallH);
  
  /* function curvature create the curved line in the middle of the circle
  calls for collor white, first point at x=280 and y=260 which marks the 
  location of the beginning of the line. Second point at x=380, y=210 which
  allows the line to be curved up, third point at x=430, y=210 extends the 
  curve. The last point at x=510, y=290 lowers and ends the line */
  curvature(white, 270, 280, 350, wideH/2, 450, wideH/2, 530, 280);
  
  outterCircle(yellow, wideH, tallH, 2*wide/6, tallH);
  
  // calls function flagText which writes the text on the screen
  flagText();


}

/* Function flagText writes a curved text on the flag placed inside of the
curved line */
void flagText() {
  
 translate(width/2, 3*height/4);
  
  // archL is the position the text start along the curve
  float archL = width/3;
  
    /* check for every box set variable i, as long a i is less than the
  lenght of the variable called string, add to i*/
  for(int i = 0; i < string.length (); i++) {
    
    /* variable of type character for the current letter on the string
    and its width */
    char currentLetter = string.charAt(i);
    
     /* instead of checking the width of the string, check the width of
    each character */
    float wide = textWidth(currentLetter);
    /* as each "box" is "centered" move half of the width, divide by 2 to 
    separate the characters*/
    archL += wide*2;
    // the angle is the archL divided by the radius divide by 2
    // start on the left side by adding PI
    float divRad = PI + archL / raD/2;
    
     // push current transformation matrix into matrix stack
    pushMatrix();
    
    /* Polar to Cartesian conversion to find point along curve.
    Still confused about this one, but it worked */
    translate(raD*cos(divRad), raD*sin(divRad));
    //rotate box, offset by 90 degrees
    rotate(divRad + PI/2);
    
     // display character in color forestGreen
    fill(forestGreen);
    text(currentLetter, 0, 0);
    
    //Pop the current transformation matriz  into the matrix stack
    popMatrix();
    
    // add to the width
    archL += wide;
  }
}

/* Function creatingShapes will take a param of type integer as "c" for 
color, float x and y from x"0" and y"0" to x3 and y3 will determinate the
location of x and y of each of the four point on the scree w*/
void creatingShapes(int c, float x, float y, float x1, float y1,
float x2, float y2, float x3, float y3){
  // remove border of shape
  noStroke(); 
  // fill it with desired color
  fill(c);
  // use beginShape function to create an adjustable shape
  beginShape();
  // add the amount of points needed as vertex for the desired shapes
  vertex(x, y);
  vertex(x1, y1);
  vertex(x2, y2);
  vertex(x3, y3);
  // ends and closes shape
  endShape(CLOSE);
}

// create a circle on the screen with no border
void circles(int c, float x, float y, float wide, float tall){
  noStroke(); 
  fill(c);
  ellipse(x, y, wide, tall);
}

// creates another circle with no fill and with a border
void outterCircle(int c, float x, float y, float wide, float tall){
  noFill();
  stroke(c);
  strokeWeight(25);
  ellipse(x, y, wide, tall);
}

// creates a curved line on the screen
void curvature(int c, float x, float y, float x1, float y1,
float x2, float y2, float x3, float y3) {
  stroke(c);
  strokeWeight(20);
  // makes the line ends square
  strokeCap(SQUARE);
  // allows flexible coordinates to make line curved
  bezier(x, y, x1, y1, x2, y2, x3, y3);
}

// end.
