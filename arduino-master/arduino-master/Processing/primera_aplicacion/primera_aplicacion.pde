
import ddf.minim.*;
import lll.Loc.*;

import lll.wrj4P5.*;


Wrj4P5 wii;
Minim minim;
Minim mini;

AudioPlayer bmusic;
AudioPlayer playe;
int spazio=50;
int value;
void setup() {
  size(300,300,P3D);
  wii=new Wrj4P5(this);
  wii.connect();
  
  minim= new Minim(this);
    mini= new Minim(this);

  bmusic = minim.loadFile("Crash.wav", 1024);
  playe = mini.loadFile("LowTom.wav");
} 
void draw() {
  background(0);
  stroke(255);
  translate(100/1,200/1,0);
  lights();
  
  Loc p=wii.rimokon.irLights[0];
  Loc a=wii.rimokon.irLights[1];
  Loc b=wii.rimokon.irLights[2];
  Loc c=wii.rimokon.irLights[3];
  rotateX((int) (wii.rimokon.senced.x*5+10));
  rotateY((int) (wii.rimokon.senced.y*5+10));
  rotateZ((int) (wii.rimokon.senced.z*5+10));
  box(100,100,100);
  
  
}
  
void buttonPressed(RimokonEvent evt, int rid) {
   if (evt.wasPressed(RimokonEvent.TWO)){ 
   //song= minim.loadFile("Crash.wav");
   //song.play();
   //value=1;
  //bmusic.rewind();
  //play the file
  bmusic.play();
  bmusic.rewind();
  //value=1;
 }
 
  if (evt.wasPressed(RimokonEvent.ONE)){
  
  //play the file
  //playe = minim.loadFile("LowTom.wav",1024);
  playe.play();
  playe.rewind(); 
   }
   if (evt.wasPressed(RimokonEvent.B)) println("B");
   if (evt.wasPressed(RimokonEvent.A)) println("A");
   if (evt.wasPressed(RimokonEvent.MINUS)) println("Minus");
   if (evt.wasPressed(RimokonEvent.HOME)) println("Home");
   if (evt.wasPressed(RimokonEvent.LEFT)) println("Left");
   if (evt.wasPressed(RimokonEvent.RIGHT)) println("Right");
   if (evt.wasPressed(RimokonEvent.DOWN)) println("Down");
   if (evt.wasPressed(RimokonEvent.UP)) println("Up");
   if (evt.wasPressed(RimokonEvent.PLUS)) println("Plus");
}
void stop()
{
  // always close Minim audio classes when you are done with them
  bmusic.close();
  playe.close();
  minim.stop();
   
  super.stop();
}

