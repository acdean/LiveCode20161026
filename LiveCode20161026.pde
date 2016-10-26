import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

int CUBES = 50;

PeasyCam cam;
PImage[] img = new PImage[5];
ArrayList<Cube> cube = new ArrayList<Cube>();

void setup() {
  size (640, 480, OPENGL);
  cam = new PeasyCam(this, 1000);
  for (int i = 0 ; i < img.length ; i++) {
    img[i] = loadImage("pattern" + i + ".png");
  }
  colorMode(HSB, 360, 100, 100);
  for (int i = 0 ; i < CUBES ; i++) {
    cube.add(new Cube());
  }
  textureMode(IMAGE);
}

void draw() {
  background(frameCount % 360, 50, 50);
  scale(50);
  for (Cube c : cube) {
    c.draw();
  }
}

  
class Cube {  
  PShape shape = null;
  int tex0, tex1, tex2, tex3, tex4, tex5;
  float rx, ry, rz, dx, dy, dz;
  float x, y, z;
  float MAX = 1.0;
  
  public Cube() {
    x = random(-MAX, MAX);
    y = random(-MAX, MAX);
    z = random(-MAX, MAX);
    dx = random(-.02, .02);
    dy = random(-.02, .02);
    dz = random(-.02, .02);
  }

  void draw() {
    if (shape == null) {
      shape = createShape();
      shape.beginShape(QUADS);
      shape.textureMode(IMAGE);

      tex0 = (int)random(img.length);
      shape.texture(img[tex0]);
      shape.vertex(-1, -1, -1, 0.0, 0.0);
      shape.vertex(-1, 1, -1, 1.0, 0.0);
      shape.vertex(-1, 1, 1, 1.0, 1.0);
      shape.vertex(-1, -1, 1, 0.0, 1.0);

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
      shape.texture(img[tex4]);
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
    shape.translate(x, y, z);
    shape(shape);
  }
}