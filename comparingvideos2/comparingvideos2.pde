import processing.video.*;
int numPixels;
int camPixels;
int[] backgroundPixels;
Capture video;
Movie cam;

void setup() {
  size(640, 480, P2D); 
  
  video = new Capture(this, width, height, 24);
  numPixels = video.width * video.height;
  // Create array to store the background image
  cam = new Movie(this, "cam.mov");
  cam.loop();
  camPixels = cam.width * cam.height;
  // Make the pixels[] array available for direct manipulation
  loadPixels();
}

void draw() {
  if (video.available()) {
    video.read(); // Read a new video frame
    image(cam, 0, 0);
    video.loadPixels(); // Make the pixels of video available
    // Difference between the current frame and the stored background
    int presenceSum = 0;
    for (int i = 0; i < cam.width * cam.height; i++) { // For each pixel in the video frame...
      // Fetch the current color in that location, and also the color
      // of the background in that spot
      color currColor = cam.pixels[i];
      color bkgdColor = video.pixels[i];

      pixels[i] = color(currColor - bkgdColor);
    }
    updatePixels(); // Notify that the pixels[] array has changed
  }
}

// When a key is pressed, capture the background image into the backgroundPixels
// buffer, by copying each of the current frame’s pixels into it.



