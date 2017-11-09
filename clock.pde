int num = 5000;
int range = 30; //size of lines

float[] ax = new float[num];
float[] ay = new float[num]; 

float[] bx = new float[num];
float[] by = new float[num];

float[] cx = new float[num];
float[] cy = new float[num];

PShape recth;
PShape rectm1;
PShape rectm2;

void setup() {
  fullScreen();

for(int i = 0; i < num; i++) {
    ax[i] = width/7; //getting rid of these means there's just a point
    ay[i] = height/3; //these also determine where the lines start
  }
  frameRate(60);
  
  for(int i2 = 0; i2 < num; i2++) {
    bx[i2] = width/9*4; //getting rid of these means there's just a point
    by[i2] = height/3; //these also determine where the lines start
  }
  frameRate(60);
  
  for(int i3 = 0; i3 < num; i3++) {
    bx[i3] = width/6*4; //getting rid of these means there's just a point
    by[i3] = height/3; //these also determine where the lines start
  }
  frameRate(60);
  
//  recth = createShape(RECT, width/7, height/3, width/5, height/2);
//  recth.setFill(color(255));
//  recth.setStroke(false);
  
//  rectm1 = createShape(RECT, width/9*4, height/3, width/5, height/2);
//  rectm1.setFill(color(255));
//  rectm1.setStroke(false);
  
//  rectm2 = createShape(RECT, width/6*4, height/3, width/5, height/2);
//  rectm2.setFill(color(255));
//  rectm2.setStroke(false);
}


void draw() {
  background(255);
noStroke();
  
  String ap = "am";
  int h = hour();    
  int min = minute();  

  if (h == 0) {
    h = 12; //makes midnight show 12
  }

  if (h > 12) {
    h = h%12;
    ap = "pm"; //makes pm times appear as 1-11
  }

  String minp;  
  if (min < 10) {
    minp = nf(min, 2);
  } else {
    minp = "" + min; //makes single digit minutes include a zero
  }

  String time = h + ":" + minp; // strings together time as h:m

fill (36, 158, 138);
textSize (width/3);
textAlign (CENTER, CENTER);
text (time, width/2, height/2);

for(int i = 1; i < num; i++) {
    ax[i-1] = ax[i]; //getting rid of one of these makes the lines go only vt or hz
    ay[i-1] = ay[i];
  }

  // Put a new value at the end of the array
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);

  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], width/7, width/7+width/5);
  ay[num-1] = constrain(ay[num-1], height/3, height/3+height/2);
  
  // connects the points with a line
  for(int i=1; i<num; i++) {    
    stroke(255);
    strokeWeight(5);
    line(ax[i-1], ay[i-1], ax[i], ay[i]);
}

for(int i2 = 1; i2 < num; i2++) {
    bx[i2-1] = bx[i2]; //getting rid of one of these makes the lines go only vt or hz
    by[i2-1] = by[i2];
  }

  // Put a new value at the end of the array
  bx[num-1] += random(-range, range);
  by[num-1] += random(-range, range);

  // Constrain all points to the screen
  bx[num-1] = constrain(bx[num-1], width/9*4, width/9*4+width/5);
  by[num-1] = constrain(by[num-1], height/3, height/3+height/2);
  
  // connects the points with a line
  for(int i2=1; i2<num; i2++) {    
    stroke(255);
    strokeWeight(5);
    line(bx[i2-1], by[i2-1], bx[i2], by[i2]);
}

for(int i3 = 1; i3 < num; i3++) {
    cx[i3-1] = cx[i3]; //getting rid of one of these makes the lines go only vt or hz
    cy[i3-1] = cy[i3];
  }

  // Put a new value at the end of the array
  cx[num-1] += random(-range, range);
  cy[num-1] += random(-range, range);

  // Constrain all points to the screen
  cx[num-1] = constrain(cx[num-1], width/6*4, width/6*4+width/5);
  cy[num-1] = constrain(cy[num-1], height/3, height/3+height/2);
  
  // connects the points with a line
  for(int i3=1; i3<num; i3++) {    
    stroke(255);
    strokeWeight(5);
    line(cx[i3-1], cy[i3-1], cx[i3], cy[i3]);
}

//shape(recth, 0, 0);
//shape(rectm1, 0, 0);
//shape(rectm2, 0, 0);
}
