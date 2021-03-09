import processing.video.*;

// death perception

ArrayList<myRect> rects;
int numRects;
int rectDelay; // time between adding new shapes
String[] cameras;
Capture cam;
PImage img;
float wave;
boolean imgTaken;
int imgDelay;
int imgDistort;

void setup() {
  size(600, 400);
  smooth();
  rectMode(CENTER);
  rects = new ArrayList<myRect>();
  numRects = 5;
  rectDelay = 15;
  imgDelay = 200;
  imgTaken = false;
  imgDistort = 1;
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

  wave = sin(radians(frameCount));

  if (frameCount == 300) {
    if (cam.available() == true && imgTaken == false) {
        cam.read();
        imgTaken = true;
        img = cam;
      }
  }
  if (imgTaken) {
    image(img, 0, 0);
    loadPixels();
    int len = width*height;
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int loc = x+y*width;
        pixels[loc] = pixels[(int)(imgDistort * loc + (int) random(10)) % len];
        //imgDistort = abs((int)(imgDistort + wave) % 10);
        //img = pixels;
        //pixels[loc] = pixels[loc / 2];
      }
    }
    updatePixels();
  }

  
  



  for (myRect curRect : rects) {
    curRect.display();
    curRect.update();
  }
  
  
  
}
