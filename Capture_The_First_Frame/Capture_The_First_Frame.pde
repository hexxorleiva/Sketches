import processing.video.*;
Capture cam;

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480, 30);
  
}

void draw() {
  if(cam.available() == true) {
    cam.read();
    image(cam, 0, 0); // draws the videofeed onto the screen
    cam.loadPixels(); // Sets up the scanning of the video?
    int index = 0;
    for (int y = 0; y < cam.height; y++) { // I am assuming that this scans the video feed vertically
      for (int x = 0; x < cam.width; x++) { // and that this scans the video horizontally
        int pixelValue = cam.pixels[index];
        float firstframe = lastframe(pixelValue);
        if (firstframe != lastframe) { // To try and compare the first image against the incoming feed, if they do not equal the following is true
          lastframe = black;
        
  
}
      }
      }
    }
}
void mousePressed() {
  color c = cam.pixels[index];
  // get the current image under mouse
}

