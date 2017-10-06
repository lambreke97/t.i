import SimpleOpenNI.*;
SimpleOpenNI kinect;

float spos=90;
float currentX;
float lastX;
float currentY;
float lastY;
int x;
int y;
  
float interpolatedX;
float interpolatedY;
 
 
ArrayList<PVector> handPositions;
PVector currentHand;
PVector previousHand;
 
void setup(){
  size (640,480);
  SimpleOpenNI kinect = new SimpleOpenNI(this);
  kinect.setMirror(true);
  kinect.enableDepth();
  kinect.startGesture(SimpleOpenNI.GESTURE_CLICK);
  kinect.enableHand();
  kinect.startGesture(int("RaiseHand"));
  handPositions = new ArrayList();
}

void draw(){
  kinect.update();
  image(kinect.depthImage(),0,0);
  for (int i=1;i<handPositions.size();i++){
    currentHand=handPositions.get(i);
    previousHand=handPositions.get(i-1);
 
    currentX=(currentHand.x);
    lastX=(previousHand.x);   
    currentY=(currentHand.y);
    lastY=(previousHand.y);
 
    float interpolatedX = lerp(lastX,currentX,0.3f);
    lastX = int(interpolatedX);
    float interpolatedY = lerp(lastY,currentY,0.3f);
    lastY = int(interpolatedY);
    x= int(lastX);
    y= int(lastY); 
  }
  fill(255,0,0);
  ellipse(lastX,lastY,15,15); 
  spos= lastX/4;
  x= int(lastX);
  println (x);
}
  
void onCreateHands(int handId, PVector position, float time){
      kinect.convertRealWorldToProjective(position,position);
      handPositions.add(position);
}
 
void onUpdateHands(int handId, PVector position, float time){
      kinect.convertRealWorldToProjective(position,position);
      handPositions.add(position);
}
 
void onDestroyHands(int handId, float time) {
      handPositions.clear();
      //kinect.addGesture(int("RaiseHand"));
      kinect.startGesture(SimpleOpenNI.GESTURE_CLICK);
}
 
void onRecognizeGesture(String strGesture, PVector idPosition, PVector endPosition) {
      kinect.startTrackingHand(endPosition);
      //kinect.removeGesture("RaiseHand");
      kinect.endGesture(SimpleOpenNI.GESTURE_CLICK);
}
