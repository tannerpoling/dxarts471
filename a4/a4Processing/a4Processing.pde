import processing.video.*;

// death perception

ArrayList<myRect> rects;
int numRects;
int rectDelay; // time between adding new shapes
String[] cameras;
Capture cam;

void setup() {
  size(600, 400);
  smooth();
  rectMode(CENTER);
  rects = new ArrayList<myRect>();
  numRects = 5;
  rectDelay = 10;
  
  // set up camera
  cameras = Capture.list();
  if (cameras.length == 0) {
      println("failed to find camera");
      exit();
    } else {
      cam = new Capture(this, cameras[0]);
      cam.start();
    }
  
}


void draw() {
  background(0);
  for (int i = 0; i <= numRects; i++) {
    if (frameCount == i*rectDelay) rects.add(new myRect(0));
  }

  if (frameCount == 300) {
    boolean oneTime = true;
    if (cam.available() == true && oneTime == true) {
        cam.read();
        oneTime = false;
      }
      
  }
  image(cam, 0, 0);

  for (myRect curRect : rects) {
    curRect.display();
    curRect.update();
  }
  
  
  
}
