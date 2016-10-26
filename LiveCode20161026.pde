import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;
PImage[] img = new PImage[5];
Cube cube;

void setup() {
  size (640, 480, OPENGL);
  cam = new PeasyCam(this, 500);
  for (int i = 0 ; i < img.length ; i++) {
    img[i] = loadImage("pattern" + i + ".png");
  }
  colorMode(HSB, 360, 100, 100);
  cube = new Cube();
  textureMode(IMAGE);
}

void draw() {
  background(frameCount % 360, 50, 50);
  scale(50);
  cube.draw();
}

  
class Cube {  
  PShape shape = null;
  int tex0, tex1, tex2, tex3, tex4, tex5;
  float rx, ry, rz, dx, dy, dz;
  
  public Cube() {
    dx = random(-.02, .02);
    dy = random(-.02, .02);
    dz = random(-.02, .02);
  }

  void draw() {
    if (shape == null) {
      shape = createShape();
      shape.beginShape(QUADS);

      tex0 = (int)random(img.length);
      shape.texture(img[tex0]);
      shape.vertex(-1, -1, -1, 0, 0);
      shape.vertex(-1, 1, -1, 1, 0);
      shape.vertex(-1, 1, 1, 1, 1);
      shape.vertex(-1, -1, 1, 0, 1);

      tex1 = (int)random(img.length);
      shape.texture(img[tex1]);
      shape.vertex(-1, -1, -1, 0, 0);
      shape.vertex(1, -1, -1, 1, 0);
      shape.vertex(1, -1, 1, 1, 1);
      shape.vertex(-1, -1, 1, 0, 1);

      tex2 = (int)random(img.length);
      shape.texture(img[tex2]);
      shape.vertex(-1, -1, -1, 0, 0);
      shape.vertex(1, -1, -1, 1, 0);
      shape.vertex(1, 1, -1, 1, 1);
      shape.vertex(-1, 1, -1, 0, 1);

      tex3 = (int)random(img.length);
      shape.texture(img[tex3]);
      shape.vertex(1, -1, -1, 0, 0);
      shape.vertex(1, 1, -1, 1, 0);
      shape.vertex(1, 1, 1, 1, 1);
      shape.vertex(1, -1, 1, 0, 1);

      tex4 = (int)random(img.length);
      shape.setTexture(img[tex4]);
      shape.vertex(-1, 1, -1, 0, 0);
      shape.vertex(1, 1, -1, 1, 0);
      shape.vertex(1, 1, 1, 1, 1);
      shape.vertex(-1, 1, 1, 0, 1);

      tex5 = (int)random(img.length);
      shape.texture(img[tex5]);
      shape.vertex(-1, -1, 1, 0, 0);
      shape.vertex(1, -1, 1, 1, 0);
      shape.vertex(1, 1, 1, 1, 1);
      shape.vertex(-1, 1, 1, 0, 1);

      shape.endShape();
    }
    rx += dx;
    ry += dy;
    rz += dz;
    shape.rotateX(dx);
    shape.rotateY(dy);
    shape.rotateZ(dz);
    shape(shape);
  }
}