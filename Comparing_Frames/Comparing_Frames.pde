// Completed on 1/22/10 by Scott Geiser & Hector Leiva
// with template used by Golan Levin.



import processing.video.*;

int numPixels;
int[] previousFrame;
Capture video;

void setup() {
  size(640, 480); // Change size to 320 x 240 if too slow at 640 x 480
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height, 24);
  numPixels = video.width * video.height;
  // Create an array to store the previously captured frame
  previousFrame = new int[numPixels];
  loadPixels();
}

void draw() {
  if (video.available()) {
    // When using video to manipulate the screen, use video.available() and
    // video.read() inside the draw() method so that it's safe to draw to the screen
    video.read(); // Read the new frame from the camera
    video.loadPixels(); // Make its pixels[] array available
    
    int movementSum = 0; // Amount of movement in the frame
    for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame...
      color currColor = video.pixels[i];
      color prevColor = previousFrame[i];
      // Extract the red, green, and blue components from current pixel
      int currR = (currColor >> 16) & 0xFF; // Like red(), but faster
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      // Extract red, green, and blue components from previous pixel
      int prevR = (prevColor >> 16) & 0xFF;
      int prevG = (prevColor >> 8) & 0xFF;
      int prevB = prevColor & 0xFF;
      // Compute the difference of the red, green, and blue values
      int diffR = abs(currR - prevR);
      int diffG = abs(currG - prevG);
      int diffB = abs(currB - prevB);
      
      //This checks if the sum of the differences in the 3 pixel colors is less than some threshold
      //Increasing the threshold will remove aliasing effects but lower the contrast
      
      if ((abs(diffR) + abs(diffG) + abs(diffB)) < 75)
      {
        pixels[i] = color(currR, currG, currB);
      }
      else
      {
        pixels[i] = 0xffff0000;
      }
    }
    updatePixels();
  }
}

void keyPressed()
{
  video.read();
  video.loadPixels();  
  for (int i=0 ;i < numPixels; i++)
  {
    previousFrame[i] = video.pixels[i];
  }
}

