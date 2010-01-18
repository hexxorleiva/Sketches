 	

import processing.video.*;
Capture myCapture;
MovieMaker mm;

void setup() 
{
  size(640, 480);
  myCapture = new Capture(this, width, height, 30);
  mm = new MovieMaker(this, width, height, "cam.mov", 30, MovieMaker.H263, MovieMaker.HIGH);
}

void draw() {
  image(myCapture, 0, 0);
  mm.addFrame();
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}

void keyPressed() {
if (key == 'a') {
  mm.finish();
}
}
