int length=0;

boolean rectFade = false;
int rectColor = 170;
int rectAlpha = 100;

void setup() {
  size(400, 400);
  smooth();  // Only have to set this once
  rectMode(CENTER); // Only have to set this once
  //ellipseMode(CENTER); This is the default setting, don't need to call it
  //stroke(0); Also a default setting
}

void draw() {
  background(0);
  
  pushMatrix();
  fill(0);
  stroke(rectColor, rectAlpha);
  strokeWeight(4);
  rect(width/2, height/2, length, length);
  length += 6;

  if (rectFade & rectColor > 0) rectAlpha -= 30;
  if (length >= 100) rectFade = true;
  popMatrix();
  
  if (rectAlpha <= 0) {
    rectColor = 255;
    rectAlpha = 255;
    rectFade = false;
    length = 0;
  }
  //pushMatrix();
  //beginShape();
  //vertex(100, 100);
  //vertex(300, 100);
  //vertex(300, 500);
  //vertex(100, 500);
  //endShape();
  //popMatrix();

}

//class myOct {
//  int 
//}
