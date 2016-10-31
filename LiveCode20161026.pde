import peasy.*;

int CUBES = 50;
boolean video = false;

PeasyCam cam;
PImage[] img = new PImage[5];
ArrayList<Cube> cube = new ArrayList<Cube>();

void setup() {
  size (640, 360, OPENGL);
  cam = new PeasyCam(this, 750);
  for (int i = 0; i < img.length; i++) {
    img[i] = loadImage("pattern" + i + ".png");
  }
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < CUBES; i++) {
    cube.add(new Cube());
  }
  textureMode(IMAGE);
}

void draw() {
  background(frameCount % 360, 50, 50);
  scale(50);
  rotateX(radians(frameCount / 57.0));
  rotateY(radians(frameCount / 81.0));
  lights();
  
  for (Cube c : cube) {
    c.draw();
  }

  if (video) {
    saveFrame("frame#####.png");
    if (frameCount > 500) {
      exit();
    }
  }
}

void keyPressed() {
  saveFrame("frame####.png");
}

class Cube {  
  PShape shape = null;
  int tex0, tex1, tex2, tex3, tex4, tex5;
  float rx, ry, rz, dx, dy, dz;
  float x, y, z;
  float MAX = 5.0;

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
      shape = createShape(GROUP);

      PShape shape0 = createShape();
      shape0.beginShape(QUADS);
      shape0.textureMode(NORMAL);
      tex0 = (int)random(img.length);
      shape0.texture(img[tex0]);
      shape0.vertex(-1, -1, -1, 0.0, 0.0);
      shape0.vertex(-1, 1, -1, 1.0, 0.0);
      shape0.vertex(-1, 1, 1, 1.0, 1.0);
      shape0.vertex(-1, -1, 1, 0.0, 1.0);
      shape0.endShape();
      shape.addChild(shape0);

      PShape shape1 = createShape();
      shape1.beginShape(QUADS);
      shape1.textureMode(NORMAL);
      tex1 = (int)random(img.length);
      shape1.texture(img[tex1]);
      shape1.vertex(-1, -1, -1, 0, 0);
      shape1.vertex(1, -1, -1, 1, 0);
      shape1.vertex(1, -1, 1, 1, 1);
      shape1.vertex(-1, -1, 1, 0, 1);
      shape1.endShape();
      shape.addChild(shape1);

      PShape shape2 = createShape();
      shape2.beginShape(QUADS);
      shape2.textureMode(NORMAL);
      tex2 = (int)random(img.length);
      shape2.texture(img[tex2]);
      shape2.vertex(-1, -1, -1, 0, 0);
      shape2.vertex(1, -1, -1, 1, 0);
      shape2.vertex(1, 1, -1, 1, 1);
      shape2.vertex(-1, 1, -1, 0, 1);
      shape2.endShape();
      shape.addChild(shape2);

      PShape shape3 = createShape();
      shape3.beginShape(QUADS);
      shape3.textureMode(NORMAL);
      tex3 = (int)random(img.length);
      shape3.texture(img[tex3]);
      shape3.vertex(1, -1, -1, 0, 0);
      shape3.vertex(1, 1, -1, 1, 0);
      shape3.vertex(1, 1, 1, 1, 1);
      shape3.vertex(1, -1, 1, 0, 1);
      shape3.endShape();
      shape.addChild(shape3);

      PShape shape4 = createShape();
      shape4.beginShape(QUADS);
      shape4.textureMode(NORMAL);
      tex4 = (int)random(img.length);
      shape4.texture(img[tex4]);
      shape4.vertex(-1, 1, -1, 0, 0);
      shape4.vertex(1, 1, -1, 1, 0);
      shape4.vertex(1, 1, 1, 1, 1);
      shape4.vertex(-1, 1, 1, 0, 1);
      shape4.endShape();
      shape.addChild(shape4);

      PShape shape5 = createShape();
      shape5.beginShape(QUADS);
      shape5.textureMode(NORMAL);
      tex5 = (int)random(img.length);
      shape5.texture(img[tex5]);
      shape5.vertex(-1, -1, 1, 0, 0);
      shape5.vertex(1, -1, 1, 1, 0);
      shape5.vertex(1, 1, 1, 1, 1);
      shape5.vertex(-1, 1, 1, 0, 1);
      shape5.endShape();
      shape.addChild(shape5);
    }
    rx += dx;
    ry += dy;
    rz += dz;
    pushMatrix();
    translate(x, y, z);
    shape.setStroke(false);
    shape.rotateX(dx);
    shape.rotateY(dy);
    shape.rotateZ(dz);
    shape(shape);
    popMatrix();
  }
}