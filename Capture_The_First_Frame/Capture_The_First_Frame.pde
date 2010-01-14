import processing.video.*; 
Capture myCapture;
 
void setup() { 
  size(640, 480);
  myCapture = new Capture(this, 640, 480, 30);
} 
 
void draw() { 
  if(myCapture.available()) { 
    // Reads the new frame
    myCapture.read(); 
  } 
  image(myCapture, 0, 0);
}
  if(myCaptureavailable()) {
  saveFrame("image-0001.tif");
  stop();
  } else { noLoop();
}

}
