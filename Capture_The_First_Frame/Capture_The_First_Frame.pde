import processing.video.*; 
Capture myCapture;
x = myCapture;
 
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
  if(x == myCapture);
  saveFrame();
  stop();
  else { noLoop();
}

}
