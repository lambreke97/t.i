// Libro: Arduino and Kinect Projects. Enrique Ramos y Ciriaco Castro Díez
// Getting a map tranlated back into the real-scale 3D coordinates of
// the objects

import processing.opengl.*; //Render 3D
import SimpleOpenNI.*; //Librería para comunicarse con Kinect para Processing
import kinectOrbit.*; //Linrería para controlar la cámara

KinectOrbit myOrbit;
SimpleOpenNI kinect;// Arduino and Kinect Projects. Enrique Ramos y Ciriaco Castro Díez

void setup()
{
  size(800, 600, OPENGL);
  myOrbit = new KinectOrbit(this, 0);
  kinect = new SimpleOpenNI(this);
  // enable depthMap generation
  kinect.enableDepth();
}

void draw()
{
  kinect.update();
  background(0);
  myOrbit.pushOrbit(this);
  drawPointCloud();
  // draw the kinect cam and frustum
  kinect.drawCamFrustum();
  myOrbit.popOrbit(this);
}

void drawPointCloud() {
  
  // draw the 3d point depth map
  int[] depthMap = kinect.depthMap();
  int steps = 3; // to speed up the drawing, draw every third point
  int index;

  PVector realWorldPoint;
  stroke(255);
  for (int y=0;y < kinect.depthHeight();y+=steps)
  {
    for (int x=0;x < kinect.depthWidth();x+=steps)
    {
      stroke(kinect.depthImage().get(x, y));
      index = x + y * kinect.depthWidth();
      if (depthMap[index] > 0)
      {
        realWorldPoint = kinect.depthMapRealWorld()[index];
        point(realWorldPoint.x, realWorldPoint.y, realWorldPoint.z);
      }
    }
  }
}