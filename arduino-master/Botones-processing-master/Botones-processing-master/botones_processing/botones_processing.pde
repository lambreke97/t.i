int buttonSize=100;
int buttonX1, buttonX2, buttonY1, buttonY2, buttonLockX, buttonLockY; 
int buttonLockSizeX=80;
int buttonLockSizeY=30;
color buttonColor1, buttonColor2, buttonLockColor=#4BE863;
boolean button1, button2, buttonLock=false;
PFont font;

void setup() {
  size(600, 400);
  noStroke();
  font=createFont("Bold Arial", 16, true);
  buttonX1=width/5;
  buttonY1=height/4;
  buttonX2=3*width/5;
  buttonY2=height/4;
  buttonLockX=width/20;
  buttonLockY=height/15;
  buttonColor1=buttonColor2=buttonLockColor;
}

void draw() {
  background(255);
  smooth();
  textFont(font,25);
  fill(buttonLockColor);
  rect(buttonLockX, buttonLockY, buttonLockSizeX, buttonLockSizeY);
  fill(buttonColor1);
  rect(buttonX1, buttonY1, buttonSize, buttonSize);
  fill(buttonColor2);
  rect(buttonX2, buttonY2, buttonSize, buttonSize);
  if(button1){
    fill(0, 102, 153);
    text("OFF", buttonX1, buttonY1-2);
  }
  else{
    fill(0, 102, 153);
    text("ON", buttonX1, buttonY1-2); 
  }
  if(button2){
    fill(0, 102, 153);
    text("OFF", buttonX2, buttonY2-2);
  }
  else{
   fill(0, 102, 153);
   text("ON", buttonX2, buttonY2-2); 
  }
  if(buttonLock){
    fill(0, 102, 153);
    text("Unlocked", buttonLockX, buttonLockY-2);
  }
  else{
   fill(0, 102, 153);
   text("Locked", buttonLockX, buttonLockY-2); 
  }
} 

void mousePressed() {
  if (mouseX>=buttonX1 && mouseX<=buttonX1+buttonSize && mouseY>=buttonY1 && mouseY<=buttonY1+buttonSize && buttonLock) {
    if (button1) {
      buttonColor1=#4BE863;
    } else {
      buttonColor1=#FF0E05;
    }
    button1=!button1;
  } else if (mouseX>=buttonX2 && mouseX<=buttonX2+buttonSize && mouseY>=buttonY2 && mouseY<=buttonY2+buttonSize && buttonLock) {
    if (button2) {
      buttonColor2=#4BE863;
    } else {
      buttonColor2=#FF0E05;
    }
    button2=!button2;
  } 
  else if (mouseX>=buttonLockX && mouseX<=buttonLockX+buttonLockSizeX && mouseY>=buttonLockY && mouseY<=buttonLockY+buttonLockSizeY) {
    if (buttonLock) {
      buttonLockColor=#4BE863;
   }
   else {
      buttonLockColor=#FF0E05;
  }
  buttonLock=!buttonLock;
  }
    else {
    return;
  }
}
