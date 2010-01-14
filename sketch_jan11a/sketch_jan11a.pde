import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);

  // If no device is specified, will just use the default.
  cam = new Capture(this, 640, 480, 60);

  // To use another device (i.e. if the default device causes an error),  
  // list all available capture devices to the console to find your camera.
  //String[] devices = Capture.list();
  //println(devices);
  
  // Change devices[0] to the proper index for your camera.
  //cam = new Capture(this, width, height, devices[0]);

  // Opens the settings page for this capture device.
  //camera.settings();
}


void draw() {
  if (cam.available() == true) {
    cam.read();
  imageMode(CORNER);
    image(cam, 0, 0, 320, 240);
    imageMode(CORNER);
    image(cam, 320, 0, 320, 240);
    imageMode(CORNER);
    image(cam, 0, 240, 320, 240);
    imageMode(CORNER);
    image(cam, 320, 240, 320, 240);
    // The following does the same, and is faster when just drawing the image
    // without any additional resizing, transformations, or tint.
    //set(160, 100, cam);
  }
} 

