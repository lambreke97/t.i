import processing.serial.*;
import cc.arduino.*;
import ddf.minim.*;

AudioPlayer player;
Minim minim;

Arduino arduino;
int switchPin = 2;
void setup() {
  minim = new Minim(this);
  player = minim.loadFile("Bass.wav");
  player.play();
  smooth();
size(200, 200);
arduino = new Arduino(this, Arduino.list()[0], 57600);
arduino.pinMode(switchPin, Arduino.INPUT);
}
void draw() {
if(arduino.digitalRead(switchPin)==Arduino.LOW) { // Testea el estado de entrada 2

background(255, 0, 0); // Si el estado es bajo, sin pulsar pone el fondo rojo
} else {
background(0, 0, 0); // Si el estado es alto, pulsado pone fondo negro
  player.rewind();
  player.play();
}
}

