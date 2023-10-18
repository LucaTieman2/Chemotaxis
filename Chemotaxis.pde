 Magnets [] Leo; //Global Array Initialization
int x = 150; //Global Variables
int y = 80;
boolean collision;

void setup () {
  size(500, 500); 
  collision = false;
  Leo = new Magnets[10]; //setting the # of magnets
  for (int i = 0; i < Leo.length; i++) { //drawing the magnets
    Leo[i] = new Magnets();
  }
}

void draw () {
  background(255, 244, 0);
  Magnet(); //calling the Magnet function
  for (int i = 0; i < Leo.length; i++) { //performing every magnet function
    Leo[i].show();
    Leo[i].move();
  }
}

class Magnets { 
  int myX, myY; //local variables
  Magnets () {
    myX = (int)(Math.random()*300)+100; //random place to be drawn
    myY = (int)(Math.random()*500)+100;
  }
  void move () { 
    myX = myX + (int)(Math.random()*3)-1; //unbiast movements
    myY = myY + (int)(Math.random()*2)-1; //biast movements
    if (myY < y) 
      myY = y;
    if (dist(myX, myY, x, y) < 50) { //checking if collision is true
      collision = true;
    }
    if (collision == true) { //delay between checks
      myX = x;
    }
  }
  void show () {
    stroke(0, 0, 255); //drawing the magnets
    ellipse(myX, myY, 30, 30);
  }
}

void Magnet () {
  stroke(255, 0, 0);
  strokeWeight(25); //Thicc Magnet
  arc(x, 35, 50, 50, -PI, 0); // upper half of circle
  stroke(0, 0, 255);
  strokeWeight(16);
  rect(x+22, 45, 7.5, 20);
  rect(x-29, 45, 7.5, 20);
  if (mouseX > x) //if mouse to the right magnet go right, vice versa
    x = x + 4;
  else 
    x = x - 4;
}
