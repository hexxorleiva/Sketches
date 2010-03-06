 	

import processing.video.*; 
Capture video;
int numPixels;
int[] previousFrame;
 
void setup() { 
  size(640, 480); 
  video = new Capture(this, width, height, 30); //any camera settings, to be changed here
  numPixels = video.width * video.height;
  previousFrame = new int[numPixels];
  loadPixels();
} 
 
void draw() { 
  if(video.available()) { 
    // Reads the new frame
    video.read();
        video.loadPixels();
      for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame...
      color currColor = video.pixels[i];
      color prevColor = previousFrame[i];
      // Extract the red, green, and blue components from current pixel
      int currR = (currColor >> 16) & 0xFF; // Like red(), but faster
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      //adding opacity layer - the 255 value being 100% Opacity
      // Extract red, green, and blue components from previous pixel
      int prevR = (prevColor >> 16) & 0xFF;
      int prevG = (prevColor >> 8) & 0xFF;
      int prevB = prevColor & 0xFF;
      //adding opacity layer - the 255 value being 100% Opacity
      // Compute the difference of the red, green, and blue values
      int diffR = abs(currR - prevR);
      int diffG = abs(currG - prevG);
      int diffB = abs(currB - prevB);
      
      if ((abs(diffR) + abs(diffG) + abs(diffB)) < 50)
      {
        pixels[i] = color(currR, currG, currB);
  filter(BLUR, 2);
}
else
{
  pixels[i] = color(currR, currG, currB);
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
