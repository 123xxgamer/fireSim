//State variable constants
int DIRT = 0;
int FIRE = 1;
int BURNT = 2;
int TREE = 3;

//color values
color DIRT_COLOR = #81582F;
color FIRE_COLOR = #F20C0C;
color BURNT_COLOR = #810707;
color TREE_COLOR = #49B90D;

//Constats for Forrest setup
int TREE_DENSITY = 60;
int NUM_TRACTS = 100;
int TRACT_LENGTH = 100;


//Driver variables
boolean burning;
int spreadPattern; //1 | 4 | 8
Forrest f;

void setup() {
  size(700, 750);
  frameRate(10);

  burning = false;
  spreadPattern = 1;
  textSize(30);
  f = new Forrest(NUM_TRACTS, TRACT_LENGTH, TREE_DENSITY);
}//setup

void draw() {
  background(255);
  f.displayAll();
  if (burning) {
    if (spreadPattern==1) {
      f.spread1();
    } else if (spreadPattern==4) {
      f.spread4();
    } else if (spreadPattern==8) {
      f.spread8();
    }
  }
  fill(0);
  if (spreadPattern==1) {
      text("Spread Pattern: 1",100,40);
    } else if (spreadPattern==4) {
      text("Spread Pattern: 4",100,40);
    } else if (spreadPattern==8) {
      text("Spread Pattern: 8",100,40);
    }
}//draw

void keyPressed() {
  if (key==' ') {
    burning=!burning;
  }
  if (key=='r') {
    burning=false;
    f = new Forrest(NUM_TRACTS, TRACT_LENGTH, TREE_DENSITY);
  }
  if (key=='1') {
    spreadPattern=1;
  }
  if (key=='4') {
    spreadPattern=4;
  }
  if (key=='8') {
    spreadPattern=8;
  }
}//keyPressed
