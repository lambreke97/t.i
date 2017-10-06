import org.openkinect.processing.*;
Kinect kinect;
void setup() {
  kinect = new Kinect(this);
  kinect.initDevice();
}
PImage img = kinect.getVideoImage();
image(img, 0, 0);
int[] depth = kinect.getRawDepth();
float angle = kinect.getTilt();
angle = angle + 1;
kinect.setTilt(angle);