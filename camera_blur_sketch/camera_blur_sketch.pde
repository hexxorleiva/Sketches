 	

import processing.video.*; 
Capture video; 
 
void setup() { 
  size(640, 480); 
  video = new Capture(this, width, height, 30);
} 
 
void draw() { 
  if(video.available()) { 
    // Reads the new frame
    video.read(); 
  } 
  image(video, 0, 0);
  filter(BLUR, 6);
}
