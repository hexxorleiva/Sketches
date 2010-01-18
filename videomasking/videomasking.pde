import processing.video.*;
int numPixels;
int camPixels;
//int [] backgroundPixels;
Capture video;
Movie cam;
PImage img = video;

void setup() {
size(640, 480, P2D);

video = new Capture(this, width, height, 30);
numPixels = video.width * video.height;
cam = new Movie(this, "cam.mov");
cam.loop();
camPixels = cam.width * cam.height;
loadPixels();
}

void draw() {
if (video.available()) {
  video.read();
  image(video, 0, 0);
  image(cam, 0, 0);
  //image(cam, 0, 0);
  video.loadPixels();
  for (int i = 0; i < cam.width * cam.height; i++) {
  //camPixels = cam.pixels[i];
  //numPixels = video.pixels[i];
  img.mask(cam);
  
  //pixels[i] = (camPixels - numPixels);

  }
updatePixels();
}
}


