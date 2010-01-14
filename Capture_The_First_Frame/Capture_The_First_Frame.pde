import processing.video.*; 
Capture cam;

void setup() {
  size(640, 480);
  println(Capture.list());
  cam = new Capture(this, 640, 480, 30);
}

void draw() {
  if(cam.available())
    cam.read();
image(cam, 0, 0);
}
void mousePressed() {
  saveFrame();
}
