import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;
PImage[] img = new PImage[5];

void setup() {
  size (640, 480, OPENGL);
  cam = new PeasyCam(this, 500);
  for (int i = 0 ; i < img.length ; i++) {
    img[i] = loadImage("pattern" + i + ".png");
  }
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(frameCount % 360, 50, 50);
}

  
class Cube {  
  void draw() {
  }
}