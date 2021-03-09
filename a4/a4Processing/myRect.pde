
class myRect {
  PShape s;
  float x, y;
  float scalePercent;
  int r = 245;
  int g = 118;
  int b = 0;
  int alpha = 255;
  float size = 0;
  boolean fade = false;
  float sizeLimit = 300;
  float sizeIncrement = 3;
  
  myRect(float tempSize) {
    size = tempSize;
  }
  
  void display() {
    pushMatrix();
    noFill();
    stroke(r, g, b, alpha);
    strokeWeight(4);
    rect(width/2, height/2, size*1.3, size, 10);
    popMatrix();
    
  }
  
  void update() {
    size += sizeIncrement;
    if (size >= sizeLimit) fade = true;
    if (fade & alpha > 0) alpha -= 20;
    if (alpha <= 0) {
      alpha = 255;
      fade = false;
      size = 0;
    }
  }
}
